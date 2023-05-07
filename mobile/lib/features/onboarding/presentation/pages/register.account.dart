import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/core/utils/validator.dart';
import 'package:mobile/features/onboarding/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/features/shared/presentation/widgets/country.flag.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:protobuf_google/protobuf_google.dart' show Empty;
import 'package:shared_utils/shared_utils.dart';

class RegisterAccountPage extends StatefulWidget {
  const RegisterAccountPage({Key? key}) : super(key: key);

  @override
  State<RegisterAccountPage> createState() => _RegisterAccountPageState();
}

class _RegisterAccountPageState extends State<RegisterAccountPage> {
  final _authBloc = AuthBloc(),
      _createAccountBloc = AuthBloc(),
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

            if (state is SuccessState<Empty>) _createAccount();

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

            if (state is SuccessState<Empty>) {
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
                      FilledTextField(
                        context.localizer.displayName,
                        enabled: _selectedCountry != null && !_loading,
                        controller: _nameController,
                        capitalization: TextCapitalization.words,
                        validator: Validators.validate,
                        maxLength: 20,
                        prefixIcon: TablerIcons.id_badge_2,
                      ).top(24),

                      /// show avatars
                      AnimationLimiter(
                        child: GridView.builder(
                          padding: const EdgeInsets.only(top: 20, bottom: 16),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 8),
                          itemCount: _avatars.length,
                          itemBuilder: (context, index) =>
                              AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            columnCount: 3,
                            child: ScaleAnimation(
                              child: FadeInAnimation(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() =>
                                        _selectedAvatarAsset = _avatars[index]);
                                  },
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: _selectedAvatarAsset ==
                                              _avatars[index]
                                          ? context.colorScheme.secondary
                                          : null,
                                      border: Border.all(
                                          color: context.theme.disabledColor
                                              .withOpacity(kEmphasisMedium)),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(_avatars[index])),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ).fillMaxWidth(context).fillMaxHeight(context, 0.3),
                      ),

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
                      FilledTextField(
                        context.localizer.selectCountry,
                        controller: _countryController,
                        readOnly: true,
                        enabled: !_loading,
                        validator: Validators.validate,
                        prefix: _selectedCountry == null
                            ? null
                            : CountryFlagIcon(country: _selectedCountry),
                        onTap: () async {
                          _selectedCountry = await context.showCountriesSheet();
                          _countryController.text =
                              _selectedCountry?.name ?? '';
                          setState(() {});
                        },
                      ),
                      if (_selectedCountry != null) ...{
                        FilledTextField(
                          context.localizer.phoneNumber,
                          enabled: _selectedCountry != null && !_loading,
                          controller: _phoneNumberController,
                          type: AppTextFieldType.phone,
                          validator: (input) =>
                              Validators.validatePhone(context, input),
                          onChanged: (input) {
                            if (input.isNullOrEmpty()) return;
                            if (input.replaceAll(' ', '').trim().length >= 10) {
                              _currentAccountBloc.add(
                                  GetAccountByPhoneNumberAuthEvent(
                                      _phoneNumberController.text.trim()));
                            }
                          },
                          prefixIcon: TablerIcons.phone_plus,
                        ),
                      },
                      BlocBuilder(
                        bloc: _currentAccountBloc,
                        builder: (context, state) {
                          if (state is ErrorState<String>) {
                            return FilledTextField(
                              context.localizer.password,
                              enabled: !_loading,
                              controller: _passwordController,
                              type: AppTextFieldType.password,
                              prefixIcon: Icons.password,
                              validator: (input) =>
                                  Validators.validatePassword(context, input),
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
