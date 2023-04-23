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
      _createAccountBloc = AuthBloc(),
      _countryBloc = AuthBloc(),
      _currentAccountBloc = AuthBloc();
  var _loading = false, _showPicturePickerUI = false;
  String? _selectedAvatarAsset;
  Country? _selectedCountry;
  final _formKey = GlobalKey<FormState>(),
      _countryController = TextEditingController(),
      _nameController = TextEditingController(),
      _phoneNumberController = TextEditingController(),
      _passwordController = TextEditingController(),
      _avatars = [
        Assets.avatarsLorelei0,
        Assets.avatarsLorelei1,
        Assets.avatarsLorelei2,
        Assets.avatarsLorelei3,
        Assets.avatarsLorelei4,
        Assets.avatarsLorelei5,
        Assets.avatarsLorelei6,
        Assets.avatarsLorelei7,
        Assets.avatarsLorelei8,
        Assets.avatarsLorelei9,
        Assets.avatarsLorelei10,
        Assets.avatarsLorelei11,
        Assets.avatarsLorelei12,
        Assets.avatarsLorelei13,
        Assets.avatarsLorelei13,
        Assets.avatarsLorelei14,
        Assets.avatarsLorelei15,
        Assets.avatarsLorelei16,
        Assets.avatarsLorelei17,
        Assets.avatarsLorelei18,
        Assets.avatarsLorelei19,
      ];

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

            if (state is ErrorState<String>) {
              context.showMessageDialog(state.failure);
            }
          },
        ),
        BlocListener(
          bloc: _createAccountBloc,
          listener: (context, state) {
            if (!mounted) return;

            setState(() => _loading = state is LoadingState);

            if (state is SuccessState<void>) {
              context.navigator.pushNamedAndRemoveUntil(
                  AppRouter.dashboardRoute, (route) => false);
              return;
            }

            if (state is ErrorState<String>) {
              context.showMessageDialog(state.failure);
            }
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
          },
        ),
      ],
      child: WillPopScope(
        onWillPop: () async {
          if (_showPicturePickerUI) {
            setState(() => _showPicturePickerUI = !_showPicturePickerUI);
            return Future<bool>.value(false);
          }

          return Future<bool>.value(true);
        },
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
                    if (_showPicturePickerUI) ...{
                      context.localizer.almostThere.h5(context,
                          weight: FontWeight.bold,
                          color: context.colorScheme.onSurface,
                          alignment: TextAlign.center),
                      context.localizer.profileEditHeader
                          .bodyText2(context, alignment: TextAlign.center)
                          .top(8)
                          .bottom(24),
                      AppTextField(
                        context.localizer.displayName,
                        enabled: _selectedCountry != null && !_loading,
                        controller: _nameController,
                        capitalization: TextCapitalization.words,
                        validator: Validators.validate,
                        maxLength: 20,
                        floatLabel: true,
                        prefixIcon: const Icon(TablerIcons.id_badge_2),
                      ).top(24),

                      /// show avatars
                      GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 8),
                        itemCount: _avatars.length,
                        itemBuilder: (context, index) {
                          var avatar = _avatars[index];
                          return GestureDetector(
                            onTap: () =>
                                setState(() => _selectedAvatarAsset = avatar),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: _selectedAvatarAsset == avatar ? context.colorScheme.secondary : null,
                                border: Border.all(
                                    color: context.theme.disabledColor
                                        .withOpacity(kEmphasisMedium)),
                                shape: BoxShape.circle,
                                image:
                                    DecorationImage(image: AssetImage(avatar)),
                              ),
                            ),
                          );
                        },
                      ).fillMaxWidth(context).fillMaxHeight(context, 0.3),

                      AppRoundedButton(
                        text: context.localizer.next,
                        enabled: !_loading,
                        onTap: _createNewAccountForUser,
                      ).top(24),
                    } else ...{
                      context.localizer.appName.h5(context,
                          weight: FontWeight.bold,
                          color: context.colorScheme.onSurface,
                          alignment: TextAlign.center),
                      context.localizer.appLongDesc
                          .bodyText2(context, alignment: TextAlign.center)
                          .top(8)
                          .bottom(40),
                      AppTextField(
                        context.localizer.selectCountry,
                        controller: _countryController,
                        readOnly: true,
                        enabled: !_loading,
                        validator: Validators.validate,
                        prefixIcon: _selectedCountry == null
                            ? null
                            : Container(
                          margin:
                          const EdgeInsets.fromLTRB(12, 12, 8, 12),
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle),
                          child: _selectedCountry?.flagUrl
                              .asSvg(size: 16, fromAsset: false),
                        ),
                        onTap: () async {
                          _selectedCountry = await context.showCountriesSheet();
                          _countryController.text =
                              _selectedCountry?.name ?? '';
                          setState(() {});
                        },
                      ),
                      if (_selectedCountry != null) ...{
                        AppTextField(
                          context.localizer.phoneNumber,
                          enabled: _selectedCountry != null && !_loading,
                          controller: _phoneNumberController,
                          textFieldType: AppTextFieldType.phone,
                          validator: (input) => Validators.validatePassword(context, input),
                          maxLength: 10,
                          onChange: (input) {
                            if (input == null) return;
                            if (input.length >= 10) {
                              _currentAccountBloc.add(
                                  GetAccountByPhoneNumberAuthEvent(

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
                              validator: (input) => Validators.validatePassword(context, input),
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
                    },
                  ],
                ),
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
      _authBloc.add(SendVerificationCodeAuthEvent(phoneNumber: phoneNumber));
    }
  }

  void _createAccount() async {
    var phoneNumber = _phoneNumberController.text.trim();
    var successful = await context.navigator
        .pushNamed(AppRouter.phoneVerificationRoute, arguments: phoneNumber);
    setState(() => _showPicturePickerUI = successful is bool && successful);
  }

  void _createNewAccountForUser() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      var phoneNumber = _phoneNumberController.text.trim(),
          name = _nameController.text.trim(),
          password = _passwordController.text.trim();

      _createAccountBloc.add(
        RegisterAuthEvent(
          phoneNumber: phoneNumber,
          password: password,
          displayName: name,
          countryId: _selectedCountry!.id,
          avatar: _selectedAvatarAsset,
        ),
      );
    }
  }
}
