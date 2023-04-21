import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/actions.dart';
import 'package:mobile/core/utils/service.type.dart';
import 'package:mobile/features/onboarding/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:mobile/generated/protos/shared.pb.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_utils/shared_utils.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import 'validator.dart';

extension BuildContextX on BuildContext {
  TextTheme get textTheme => theme.textTheme;

  AppLocalizations get localizer => AppLocalizations.of(this)!;

  Future<void> showVerifyPasswordSheet(Account updatedAccount) async {
    final passwordController = TextEditingController(),
        authBloc = AuthBloc(),
        focusNode = FocusNode();
    var errorMessage = '';

    return await showBarModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.background,
      useRootNavigator: true,
      bounce: true,
      isDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => BlocConsumer(
          bloc: authBloc,
          listener: (context, state) {
            if (state is ErrorState<String>) {
              errorMessage = state.failure;
              setState(() => passwordController.clear());
            }

            if (state is SuccessState<void>) {
              context.navigator.pop();
            }
          },
          builder: (context, state) => LoadingIndicator(
            isLoading: state is LoadingState,
            loadingAnimIsAsset: true,
            lottieAnimResource: Assets.animLoading,
            child: Material(
              color: colorScheme.background,
              child: AnimatedColumn(
                animateType: AnimateType.slideUp,
                children: [
                  Assets.imgAppLogo
                      .asAssetImage(height: height * 0.15, width: width * 0.5),
                  localizer.verifyPassword.h6(context),
                  localizer.verifyPasswordSubhead
                      .subtitle2(context,
                          alignment: TextAlign.center,
                          emphasis: kEmphasisMedium)
                      .bottom(24),
                  if (errorMessage.isNotEmpty)
                    errorMessage
                        .bodyText2(context,
                            color: colorScheme.error,
                            alignment: TextAlign.center)
                        .bottom(16),
                  AppTextField(
                    localizer.password,
                    focusNode: focusNode,
                    textFieldType: AppTextFieldType.password,
                    validator: (input) =>
                        Validators.validatePassword(context, input),
                    controller: passwordController,
                  ),
                  AppRoundedButton(
                    text: localizer.next,
                    enabled: state is! LoadingState,
                    onTap: () {
                      if (Validators.validatePassword(
                              context, passwordController.text) ==
                          null) {
                        focusNode.unfocus();
                        if (errorMessage.isNotEmpty) {
                          setState(() => errorMessage = '');
                        }
                        authBloc.add(
                            VerifyPasswordAuthEvent(passwordController.text));
                      }
                    },
                  ).top(20).bottom(8),
                  SafeArea(
                    top: false,
                    child: AppRoundedButton(
                      text: localizer.cancel,
                      outlined: true,
                      enabled: state is! LoadingState,
                      onTap: navigator.pop,
                    ),
                  ),
                ],
              ),
            ),
          ).fillMaxHeight(context, 0.6),
        ).top(16).horizontal(24),
      ),
    );
  }

  void showFiltersSheet() async {
    showBarModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.background,
      useRootNavigator: true,
      bounce: true,
      builder: (context) => AnimatedColumn(
        animateType: AnimateType.slideUp,
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

  void showFeatureUnderDevSheet() async {
    showBarModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.background,
      useRootNavigator: true,
      bounce: true,
      builder: (context) => AnimatedColumn(
        animateType: AnimateType.slideUp,
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

  Future<int?> showServiceTypePickerSheet() async {
    final animations = [
          Assets.animSearchOnMap,
          Assets.animGiveaway,
          Assets.animTrip,
          Assets.animEvent,
        ],
        labels = [
          localizer.quickHelp,
          localizer.freeGiveaway,
          localizer.trips,
          localizer.events,
        ];
    int? selectedIndex = await showBarModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.background,
      useRootNavigator: true,
      bounce: true,
      builder: (context) => AnimatedColumn(
        animateType: AnimateType.slideUp,
        children: [
          localizer.selectServiceType.h6(context),
          localizer.selectServiceTypeSubhead
              .subtitle2(context, emphasis: kEmphasisMedium)
              .bottom(24),
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ProcheServiceType.values.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 4 / 3),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => navigator.pop(index),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: theme.disabledColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Lottie.asset(animations[index])),
                    labels[index]
                        .subtitle1(context, weight: FontWeight.w600)
                        .top(8),
                  ],
                ),
              ),
            ),
          ).fillMaxWidth(context),
          SafeArea(
            top: false,
            child: AppRoundedButton(
                    text: localizer.cancel,
                    outlined: true,
                    onTap: context.navigator.pop)
                .top(40),
          ),
        ],
      ).top(32),
    );

    await Future.delayed(kSidebarFooterDuration);
    return selectedIndex;
  }

  /// show new update dialog
  void showUpdateAppDialog(AppVersion appVersion) async {
    if (appVersion.version == getIt<String>(instanceName: 'app_version')) {
      return;
    }
    await showBarModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.background,
      useRootNavigator: true,
      bounce: true,
      isDismissible: false,
      builder: (context) => AnimatedColumn(
        animateType: AnimateType.slideDown,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: Lottie.asset(Assets.animUpdateAvailable)),
              Icon(Icons.arrow_right_alt,
                  color: colorScheme.onSurface, size: 40),
              Expanded(child: Assets.imgAppLogoAnimated.asAssetImage()),
            ],
          ).fillMaxHeight(context, 0.2).horizontal(40).bottom(24),
          EmptyContentPlaceholder(
              title: localizer.updateAvailableHeader(appVersion.version),
              subtitle: localizer.updateAvailableSubhead),
          AppRoundedButton(
            text: localizer.okay,
            onTap: () => _showInAppBrowser(
                Platform.isAndroid ? appVersion.androidUrl : appVersion.iosUrl),
          ).top(40),
          SafeArea(
            top: false,
            child: TextButton(
              onPressed: context.navigator.pop,
              child: localizer.updateLater
                  .button(context, alignment: TextAlign.center),
            ).top(8),
          ),
        ],
      ),
    );
  }

  Future<void> _showInAppBrowser(String url) async {
    var loading = true, progress = 0.0, isUnableToLoad = false;

    await showBarModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.background,
      useRootNavigator: true,
      bounce: true,
      isDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => LoadingIndicator(
          lottieAnimResource: progress >= 90.0
              ? Assets.animSuccess
              : isUnableToLoad
                  ? Assets.animNoInternetConnection
                  : Assets.animLoading,
          loadingAnimIsAsset: true,
          isLoading: loading || isUnableToLoad,
          message: progress >= 0.9
              ? localizer.success
              : isUnableToLoad
                  ? localizer.unableToLoadWebpage
                  : localizer.loading,
          child: WebViewPlus(
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) => controller.loadUrl(url),
            onPageStarted: (url) => setState(() => loading = true),
            onPageFinished: (url) => setState(() => loading = false),
            onProgress: (progress) => setState(() => progress = progress),
            onWebResourceError: (_) => setState(() => isUnableToLoad = true),
          ),
        ),
      ),
    );
  }

  /// show a welcome dialog for new users
  void showWelcomeDialog() async {
    await Future.delayed(const Duration(milliseconds: 850));
    showBarModalBottomSheet(
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

  /// used for custom error messages / prompts
  void showMessageDialog(
    String message, {
    bool showAsError = true,
    String? title,
    String? actionLabel,
    String? animationAsset,
    VoidCallback? onTap,
  }) async {
    showBarModalBottomSheet(
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
                            validator: (input) =>
                                Validators.validatePhone(context, input),
                            maxLength: 10,
                            onChange: (input) {
                              if (input == null) return;
                              if (input.length >= 10) {
                                account = null;
                                currentAccountBloc.add(
                                    GetAccountByPhoneNumberAuthEvent(
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
                            validator: (input) =>
                                Validators.validatePassword(context, input),
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
                        TextButton(
                          onPressed: () => context.navigator.popAndPushNamed(
                              AppRouter.resetPasswordRoute,
                              arguments: true),
                          child: localizer.forgotPasswordHeader
                              .button(context, alignment: TextAlign.center),
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
