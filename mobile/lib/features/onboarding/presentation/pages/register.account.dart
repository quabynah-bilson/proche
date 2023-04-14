import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/core/utils/validator.dart';
import 'package:mobile/features/onboarding/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:shared_utils/shared_utils.dart';

class RegisterAccountPage extends StatefulWidget {
  const RegisterAccountPage({Key? key}) : super(key: key);

  @override
  State<RegisterAccountPage> createState() => _RegisterAccountPageState();
}

class _RegisterAccountPageState extends State<RegisterAccountPage> {
  final _authBloc = AuthBloc(),
      _countryBloc = AuthBloc(),
      _currentAccountBloc = AuthBloc();
  var _loading = false;
  Country? _selectedCountry;
  final _formKey = GlobalKey<FormState>(),
      _nameController = TextEditingController(),
      _phoneNumberController = TextEditingController(),
      _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _countryBloc.add(GetCountriesAuthEvent());
  }

  @override
  Widget build(BuildContext context) {
    kUseDefaultOverlays(context, statusBarBrightness: context.theme.brightness);
    return MultiBlocListener(
      listeners: [
        BlocListener(
          bloc: _authBloc,
          listener: (context, state) {
            if (!mounted) return;

            setState(() => _loading = state is LoadingState);

            if (state is SuccessState<void>) _createAccount();
          },
        ),
        BlocListener(
          bloc: _currentAccountBloc,
          listener: (context, state) {
            if (!mounted) return;

            setState(() => _loading = state is LoadingState);

            if (state is SuccessState<Account>) {
              context.showMessageDialog(context.localizer.accountAlreadyTaken);
            }

            if (state is ErrorState<String>) {
              context.showMessageDialog(state.failure);
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(backgroundColor: context.colorScheme.background),
        body: LoadingIndicator(
          isLoading: _loading,
          loadingAnimIsAsset: true,
          lottieAnimResource: Assets.animLoading,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.imgAppLogo.asAssetImage(
                      height: context.height * 0.15,
                      width: context.width * 0.5),
                  context.localizer.appName.h5(context,
                      weight: FontWeight.bold,
                      color: context.colorScheme.onSurface,
                      alignment: TextAlign.center),
                  context.localizer.appLongDesc
                      .bodyText2(context, alignment: TextAlign.center)
                      .top(8)
                      .bottom(40),
                  BlocBuilder(
                    bloc: _countryBloc,
                    builder: (context, state) {
                      final countries = state is SuccessState<List<Country>>
                          ? state.data
                          : <Country>[];
                      return AppDropdownField(
                        label: context.localizer.selectCountry,
                        values: countries.map((e) => e.name).toList(),
                        onSelected: (name) {
                          _selectedCountry = countries
                              .firstWhere((element) => element.name == name);
                          setState(() {});
                        },
                        current: _selectedCountry?.name,
                        enabled: state is! LoadingState,
                        prefixIcon: _selectedCountry == null
                            ? null
                            : Container(
                                margin:
                                    const EdgeInsets.fromLTRB(12, 12, 8, 12),
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(),
                                child: _selectedCountry!.flagUrl
                                    .asSvg(size: 16, fromAsset: false),
                              ),
                      );
                    },
                  ),
                  if (_selectedCountry != null) ...{
                    AppTextField(
                      context.localizer.phoneNumber,
                      enabled: _selectedCountry != null && !_loading,
                      controller: _phoneNumberController,
                      textFieldType: AppTextFieldType.phone,
                      validator: Validators.validatePhone,
                      maxLength: 10,
                      onChange: (input) {
                        if (input == null) return;
                        if (input.length >= 10) {
                          _currentAccountBloc.add(
                              GetAccountByPhoneNumberAuthEvent(
                                  phoneNumber:
                                      _phoneNumberController.text.trim()));
                        }
                      },
                      floatLabel: true,
                      prefixIcon: const Icon(TablerIcons.phone_plus),
                    ),
                  },
                  BlocBuilder(
                    bloc: _currentAccountBloc,
                    builder: (context, state) {
                      if (state is ErrorState<String>) {
                        return AppTextField(
                          context.localizer.password,
                          enabled: !_loading,
                          controller: _passwordController,
                          floatLabel: true,
                          textFieldType: AppTextFieldType.password,
                          prefixIcon: const Icon(Icons.password),
                          validator: Validators.validatePassword,
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                  BlocBuilder(
                    bloc: _currentAccountBloc,
                    builder: (context, state) {
                      return AppRoundedButton(
                        text: context.localizer.next,
                        enabled: state is ErrorState && !_loading,
                        onTap: _validateAndVerifyNumber,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// validate form and get user's phone number for verification
  void _validateAndVerifyNumber() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      var phoneNumber = _phoneNumberController.text.trim();
      _currentAccountBloc
          .add(SendVerificationCodeAuthEvent(phoneNumber: phoneNumber));
    }
  }

  void _createAccount() async {
    var phoneNumber = _phoneNumberController.text.trim();
    var successful = await context.navigator
        .pushNamed(AppRouter.phoneVerificationRoute, arguments: phoneNumber);
    if (successful is bool) {
      // todo -> proceed to select an optional profile avatar and register account
    }
  }
}
