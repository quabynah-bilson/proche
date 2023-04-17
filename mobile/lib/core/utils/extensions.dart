import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/actions.dart';
import 'package:mobile/features/onboarding/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:protobuf/protobuf.dart';
import 'package:shared_utils/shared_utils.dart';

import 'validator.dart';

extension BuildContextX on BuildContext {
  TextTheme get textTheme => theme.textTheme;

  AppLocalizations get localizer => AppLocalizations.of(this)!;

  void showFeatureUnderDevSheet() async {
    showCupertinoModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.background,
      useRootNavigator: true,
      bounce: true,
      builder: (context) => AnimatedColumn(
        animateType: AnimateType.slideDown,
        children: [
          Lottie.asset(Assets.animWorkInProgress,
                  frameRate: FrameRate(90),
                  height: height * 0.25,
                  width: width * 0.7)
              .bottom(24),
          EmptyContentPlaceholder(
              title: localizer.underMaintenanceHeader,
              subtitle: localizer.underMaintenanceSubhead),
          SafeArea(
            top: false,
            child: AppRoundedButton(
                    text: localizer.gotIt, onTap: context.navigator.pop)
                .top(40),
          ),
        ],
      ),
    );
  }

  /// show a welcome dialog for new users
  void showWelcomeDialog() async {
    await Future.delayed(const Duration(milliseconds: 850));
    showCupertinoModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.background,
      useRootNavigator: true,
      bounce: true,
      isDismissible: false,
      builder: (context) => AnimatedColumn(
        animateType: AnimateType.slideDown,
        children: [
          Lottie.asset(Assets.animWelcomeNewUser,
                  frameRate: FrameRate(90),
                  height: height * 0.25,
                  width: width * 0.7)
              .bottom(24),
          EmptyContentPlaceholder(
              title: localizer.thanksForExploring(localizer.appName),
              subtitle: localizer.appWelcomeText),
          AppRoundedButton(text: localizer.gotIt, onTap: context.navigator.pop)
              .top(40),
          SafeArea(
            top: false,
            child: TextButton(
              onPressed: () {
                context.navigator.pop();
                doAfterDelay(showLoginSheet);
              },
              child:
                  localizer.joinUs.button(context, alignment: TextAlign.center),
            ).top(8),
          ),
        ],
      ),
    );
  }

  // TODO: account setup sheet
  void showAccountSetupSheet(Account account) async {
    final authBloc = AuthBloc(),
        formKey = GlobalKey<FormState>(),
        usernameController = TextEditingController();
    var loading = false;

    showCupertinoModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.background,
      useRootNavigator: true,
      bounce: true,
      builder: (context) => StatefulBuilder(
        builder: (_, setState) => BlocConsumer(
          bloc: authBloc,
          listener: (context, state) {
            setState(() => loading = state is LoadingState);

            // TODO: handle success state
            if (state is SuccessState<Account>) {}

            if (state is ErrorState<String>) {
              showMessageDialog(state.failure);
            }
          },
          builder: (context, state) => SafeArea(
            bottom: false,
            child: Material(
              color: colorScheme.surface,
              child: LoadingIndicator(
                lottieAnimResource: Assets.animLoading,
                isLoading: state is LoadingState,
                loadingAnimIsAsset: true,
                child: ListView(
                  shrinkWrap: true,
                  controller: ModalScrollController.of(context),
                  children: [
                    Lottie.asset(Assets.animWelcomeNewUser,
                            frameRate: FrameRate(90), height: height * 0.15)
                        .bottom(24),
                    'You\'re almost there!'
                        .h6(context, alignment: TextAlign.center),
                    Text.rich(
                      TextSpan(children: [
                        const TextSpan(
                            text: 'Complete your account setup for '),
                        TextSpan(
                          text: account.displayName,
                          style: TextStyle(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                            text: ' to allow for a more seamless experience'),
                      ]),
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color:
                            colorScheme.onSurface.withOpacity(kEmphasisMedium),
                      ),
                    ).top(4),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          AppTextField(
                            localizer.username,
                            controller: usernameController,
                            capitalization: TextCapitalization.words,
                            validator: Validators.validate,
                            prefixIcon: const Icon(Icons.alternate_email),
                            enabled: state is! LoadingState,
                          ),
                        ],
                      ),
                    ).horizontal(24).top(24),
                    SafeArea(
                      top: false,
                      child: AppRoundedButton(
                        text: 'Next', // todo
                        enabled: state is! LoadingState,
                        onTap: () async {
                          if (formKey.currentState != null &&
                              formKey.currentState!.validate()) {
                            formKey.currentState?.save();

                            /// perform phone verification
                            var phoneNumber = await navigator
                                .pushNamed(AppRouter.phoneVerificationRoute);

                            if (phoneNumber is String) {
                              var name = usernameController.text.trim();
                              var updatedAccount = account.rebuild((acct) {
                                acct.phoneNumber = phoneNumber;
                                acct.displayName = name;
                              });
                              // TODO: update account
                            }
                          }
                        },
                      ).horizontal(20),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                              color: theme.disabledColor
                                  .withOpacity(kEmphasisLowest),
                              endIndent: 24),
                        ),
                        localizer.continueWith
                            .bodyText2(context, emphasis: kEmphasisMedium),
                        Expanded(
                          child: Divider(
                              color: theme.disabledColor
                                  .withOpacity(kEmphasisLowest),
                              indent: 24),
                        ),
                      ],
                    ).top(16),
                    AppRoundedButton(
                      text: localizer.continueWithApple,
                      icon: TablerIcons.brand_apple,
                      backgroundColor: colorScheme.onSurface,
                      textColor: colorScheme.surface,
                      layoutSize: LayoutSize.wrapContent,
                      // TODO apple authentication
                      onTap: showFeatureUnderDevSheet,
                    ).horizontal(20).top(24),
                    AppRoundedButton(
                      text: localizer.continueWithGoogle,
                      icon: TablerIcons.brand_google,
                      backgroundColor: colorScheme.error,
                      textColor: colorScheme.onError,
                      // TODO google authentication
                      onTap: showFeatureUnderDevSheet,
                    ).horizontal(20).top(16),
                  ],
                ).horizontal(24).vertical(20),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// used for custom error messages / prompts
  void showMessageDialog(
    String message, {
    bool showAsError = true,
    String? title,
    String? actionLabel,
    String? animationAsset,
    VoidCallback? onTap,
  }) async {
    showCupertinoModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.background,
      useRootNavigator: true,
      isDismissible: showAsError,
      enableDrag: false,
      bounce: true,
      builder: (context) => AnimatedColumn(
        animateType: AnimateType.slideRight,
        children: [
          Lottie.asset(
                  animationAsset ??
                      (showAsError ? Assets.animError : Assets.animSuccess),
                  frameRate: FrameRate(90),
                  repeat: false,
                  height: height * 0.1,
                  width: width * 0.7)
              .bottom(24),
          EmptyContentPlaceholder(
              title: title ?? localizer.errorHeader, subtitle: message),
          SafeArea(
            top: false,
            child: AppRoundedButton(
                    text: actionLabel ?? localizer.okay,
                    onTap: onTap ?? context.navigator.pop)
                .top(40),
          ),
        ],
      ).top(24),
    );
  }

  /// sign in sheet for unauthenticated users
  void showLoginSheet() async {
    final formKey = GlobalKey<FormState>(),
        phoneNumberController = TextEditingController(),
        passwordController = TextEditingController(),
        authBloc = AuthBloc(),
        currentAccountBloc = AuthBloc(),
        countriesBloc = AuthBloc();
    var loading = false;
    Country? selectedCountry;
    Account? account;

    // invoke get countries
    countriesBloc.add(GetCountriesAuthEvent());

    showCupertinoModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.background,
      useRootNavigator: true,
      bounce: true,
      builder: (context) => StatefulBuilder(
        builder: (_, setState) => MultiBlocListener(
          listeners: [
            // global auth bloc listener
            BlocListener(
              bloc: authBloc,
              listener: (context, state) {
                setState(() => loading = state is LoadingState);

                if (state is ErrorState<String>) {
                  showMessageDialog(state.failure, title: localizer.authFailed);
                }

                if (state is SuccessState<void>) {
                  navigator.pushNamedAndRemoveUntil(
                      AppRouter.dashboardRoute, (route) => false);
                }

                if (state is SuccessState<Account>) {
                  showMessageDialog(
                    localizer.signedInAs(state.data.displayName),
                    title: localizer.welcomeBack,
                    showAsError: false,
                    onTap: () => navigator.pushNamedAndRemoveUntil(
                        AppRouter.dashboardRoute, (route) => false),
                  );
                }
              },
            ),

            // current account bloc listener
            BlocListener(
              bloc: currentAccountBloc,
              listener: (context, state) {
                setState(() => loading = state is LoadingState);
                if (state is SuccessState<Account>) {
                  setState(() => account = state.data);
                }

                if (state is ErrorState<String>) {
                  showMessageDialog(state.failure);
                }
              },
            ),

            // current account bloc listener
            BlocListener(
              bloc: countriesBloc,
              listener: (context, state) {
                if (state is ErrorState<String>) {
                  context
                    ..navigator.pop()
                    ..showMessageDialog(state.failure);
                }
              },
            ),
          ],
          child: LoadingIndicator(
            lottieAnimResource: Assets.animLoading,
            isLoading: loading,
            loadingAnimIsAsset: true,
            message: localizer.authenticating,
            child: Container(
              width: width,
              padding: EdgeInsets.fromLTRB(
                  context.width * 0.1, 40, context.width * 0.1, 8),
              child: SafeArea(
                top: false,
                child: Material(
                  color: colorScheme.background,
                  child: Form(
                    key: formKey,
                    child: AnimatedListView(
                      duration: 350,
                      animateType: AnimateType.slideUp,
                      children: [
                        if (account == null ||
                            account!.avatarUrl.isNullOrEmpty()) ...{
                          Assets.imgAppLogo.asAssetImage(
                              height: height * 0.15, width: width * 0.5),
                          localizer.appName.h5(this,
                              weight: FontWeight.bold,
                              color: colorScheme.onSurface,
                              alignment: TextAlign.center),
                        } else ...{
                          ClipOval(
                            // child: Image.memory(
                            //     account!.avatarUrl.decodeBase64ImageToBytes(),
                            //     fit: BoxFit.contain,
                            //     height: height * 0.15,
                            //     width: width * 0.5),
                            child: account!.avatarUrl
                                .avatar(size: height * 0.15, circular: true),
                          ).centered(),
                          account!.displayName.h5(this,
                              weight: FontWeight.bold,
                              color: colorScheme.onSurface,
                              alignment: TextAlign.center),
                        },
                        localizer.appLongDesc
                            .bodyText2(context, alignment: TextAlign.center)
                            .top(8)
                            .bottom(40),
                        BlocBuilder(
                          bloc: countriesBloc,
                          builder: (context, state) {
                            final countries =
                                state is SuccessState<List<Country>>
                                    ? state.data
                                    : <Country>[];
                            return AppDropdownField(
                              label: context.localizer.selectCountry,
                              values: countries.map((e) => e.name).toList(),
                              onSelected: (name) {
                                selectedCountry = countries.firstWhere(
                                    (element) => element.name == name);
                                setState(() {});
                              },
                              current: selectedCountry?.name,
                              enabled: state is! LoadingState,
                              prefixIcon: selectedCountry == null
                                  ? null
                                  : Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          12, 12, 8, 12),
                                      clipBehavior: Clip.hardEdge,
                                      decoration: const BoxDecoration(),
                                      child: selectedCountry!.flagUrl
                                          .asSvg(size: 16, fromAsset: false),
                                    ),
                            );
                          },
                        ),
                        if (selectedCountry != null) ...{
                          AppTextField(
                            localizer.phoneNumber,
                            enabled: selectedCountry != null && !loading,
                            controller: phoneNumberController,
                            textFieldType: AppTextFieldType.phone,
                            validator: Validators.validatePhone,
                            maxLength: 10,
                            onChange: (input) {
                              if (input == null) return;
                              if (input.length >= 10) {
                                account = null;
                                currentAccountBloc.add(
                                    GetAccountByPhoneNumberAuthEvent(
                                        phoneNumber:
                                            phoneNumberController.text.trim()));
                              }
                            },
                            floatLabel: true,
                            prefixIcon: const Icon(TablerIcons.phone_plus),
                          ),
                        },
                        if (account != null) ...{
                          AppTextField(
                            localizer.password,
                            enabled: !loading,
                            controller: passwordController,
                            floatLabel: true,
                            textFieldType: AppTextFieldType.password,
                            prefixIcon: const Icon(Icons.password),
                            validator: Validators.validatePassword,
                          ),
                        },
                        AppRoundedButton(
                          text: localizer.signIn,
                          enabled: account != null && !loading,
                          onTap: () async {
                            if (formKey.currentState != null &&
                                formKey.currentState!.validate()) {
                              formKey.currentState?.save();
                              var phoneNumber =
                                      phoneNumberController.text.trim(),
                                  password = passwordController.text.trim();
                              authBloc.add(
                                LoginAuthEvent(
                                  phoneNumber: phoneNumber,
                                  password: password,
                                  countryId: selectedCountry!.id,
                                ),
                              );
                            }
                          },
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                  height: 40,
                                  color: context.theme.disabledColor
                                      .withOpacity(kEmphasisMedium),
                                  indent: 24),
                            ),
                            context.localizer.or
                                .subtitle2(context)
                                .horizontal(16),
                            Expanded(
                              child: Divider(
                                  height: 40,
                                  color: context.theme.disabledColor
                                      .withOpacity(kEmphasisMedium),
                                  endIndent: 24),
                            ),
                          ],
                        ),
                        AppRoundedButton(
                          text: localizer.joinUs,
                          enabled: !loading,
                          outlined: true,
                          onTap: () => navigator
                              .pushNamed(AppRouter.registerNewAccountRoute),
                        ),
                        TextButton(
                          onPressed: openTermsOfService,
                          child: Text.rich(
                            TextSpan(
                              style: theme.textTheme.labelSmall?.copyWith(
                                  color: context.colorScheme.onSurface
                                      .withOpacity(kEmphasisHigh)),
                              children: [
                                TextSpan(text: '${localizer.tos1} '),
                                TextSpan(
                                    text: localizer.termsOfService,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                TextSpan(text: ' ${localizer.and} '),
                                TextSpan(
                                    text: localizer.privacyPolicy,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ).top(24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension StringX on String {
  Uint8List decodeBase64ImageToBytes() {
    Uint8List bytes = base64Decode(split(',')[1]); // decode the base64 string
    return bytes;
  }
}
