import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/onboarding/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/features/shared/presentation/manager/locale/locale_cubit.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:shared_utils/shared_utils.dart';

/// welcome page for all users
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  final _authBloc = AuthBloc();

  @override
  void initState() {
    super.initState();
    _authBloc.add(GetCurrentAccountAuthEvent());
  }

  @override
  Widget build(BuildContext context) {
    kUseDefaultOverlays(context, statusBarBrightness: context.theme.brightness);
    return BlocConsumer(
      bloc: _authBloc,
      listener: (context, state) {
        if (!mounted) return;

        if (state is ErrorState<String>) {
          // get public token for unauthorized user
          _authBloc.add(GetPublicAccessTokenAuthEvent());
        }
      },
      builder: (context, state) => Scaffold(
        body: Stack(
          children: [
            /// main content
            Positioned.fill(
              child: SafeArea(
                top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(),
                    // image
                    Lottie.asset(Assets.animSearchOnMap),

                    // desc
                    AnimatedColumn(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      animateType: AnimateType.slideRight,
                      children: [
                        context.localizer.appDesc.h5(context,
                            weight: FontWeight.bold, alignment: TextAlign.center),
                        context.localizer.appLongDesc
                            .bodyText1(context,
                                alignment: TextAlign.center,
                                emphasis: kEmphasisMedium)
                            .top(8),
                      ],
                    ).horizontal(context.width * 0.1),
                    const Spacer(),

                    // action buttons
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: AppRoundedButton(
                            text: context.localizer.signIn,
                            outlined: true,
                            onTap: context.showLoginSheet,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: AppRoundedButton(
                            text: context.localizer.signUp,
                            onTap: () => context.navigator
                                .pushNamed(AppRouter.tutorialRoute),
                          ),
                        ),
                      ],
                    ).bottom(40).horizontal(24),
                  ],
                ),
              ),
            ),

            /// developer info
            Positioned(
              top: 12,
              left: 16,
              child: state is SuccessState<Account>
                  ? SafeArea(
                      bottom: false,
                      child: AnimatedRow(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        animateType: AnimateType.slideRight,
                        children: [
                          Assets.imgAppLogoAnimated.asAssetImage(size: 40),
                          context.localizer.appName
                              .subtitle1(context,
                                  weight: context
                                      .textTheme.headlineSmall?.fontWeight)
                              .left(8),
                        ],
                      ),
                    )
                  : SafeArea(
                      bottom: false,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: context.localizer.appDev
                            .overline(context, emphasis: kEmphasisMedium),
                      ),
                    ),
            ),

            /// language picker
            Positioned(
              top: 12,
              left: context.width * 0.1,
              child: SafeArea(
                bottom: false,
                child: BlocBuilder(
                  bloc: context.read<LocaleCubit>(),
                  builder: (context, state) => state is SuccessState<String>
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: context.colorScheme.onBackground
                                .withOpacity(kEmphasisLowest),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              state.data
                                  .toUpperCase()
                                  .subtitle2(context,
                                      color: context.colorScheme.onBackground,
                                      weight: FontWeight.bold)
                                  .right(8),
                              PopupMenuButton<String>(
                                color: context.colorScheme.background,
                                icon: Icon(TablerIcons.chevron_down,
                                    color: context.colorScheme.onBackground),
                                onSelected: (value) => context
                                    .read<LocaleCubit>()
                                    .setLocale(value),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 'en',
                                    child: Text(context.localizer.english),
                                  ),
                                  PopupMenuItem(
                                    value: 'fr',
                                    child: Text(context.localizer.french),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Positioned.fill(
              child: state is LoadingState
                  ? const SizedBox.shrink()
                  : state is SuccessState<Account>
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SafeArea(
                                          bottom: false,
                                          child: AnimatedColumn(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            animateType: AnimateType.slideLeft,
                                            children: [
                                              state.data.avatarUrl
                                                      .isNullOrEmpty()
                                                  ? const SizedBox.shrink()
                                                  : state.data.avatarUrl.avatar(
                                                      size: context.width * 0.4,
                                                      circular: true),
                                              context.localizer.welcomeBack
                                                  .subtitle2(context,
                                                      emphasis:
                                                          kEmphasisMedium),
                                              state.data.displayName
                                                  .h6(context),
                                            ],
                                          ).top(context.height * 0.1),
                                        ),
                                        const Spacer(),
                                        AnimatedColumn(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          animateType: AnimateType.slideRight,
                                          children: [
                                            context.localizer.appName.h4(
                                                context,
                                                weight: FontWeight.bold),
                                            context.localizer.appDesc
                                                .bodyText2(context),
                                          ],
                                        ).top(8).bottom(40),
                                      ],
                                    ).horizontal(24),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: context.width,
                              color: context.colorScheme.onPrimary,
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 24, bottom: 8),
                              child: SafeArea(
                                top: false,
                                child: AppRoundedButton(
                                  text: context.localizer.getStarted,
                                  backgroundColor: context.colorScheme.primary,
                                  textColor: context.colorScheme.onPrimary,
                                  onTap: () => context.navigator
                                      .pushNamedAndRemoveUntil(
                                          AppRouter.dashboardRoute,
                                          (route) => false),
                                  enabled: state is! LoadingState,
                                ).centered(),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(),
                            ),
                            AnimatedColumn(
                              animateType: AnimateType.slideRight,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                context.localizer.appName.h4(context,
                                    color: context.colorScheme.onSecondary,
                                    weight: FontWeight.bold),
                                context.localizer.appDesc
                                    .bodyText2(context,
                                        color: context.colorScheme.onSecondary)
                                    .top(8)
                                    .bottom(40),
                              ],
                            ),
                            AppRoundedButton(
                              text: state is SuccessState<Account>
                                  ? context.localizer.getStarted
                                  : context.localizer.createProfile,
                              icon: TablerIcons.shield_check,
                              onTap: () => state is SuccessState<Account>
                                  ? context.navigator.pushNamedAndRemoveUntil(
                                      AppRouter.dashboardRoute,
                                      (route) => false)
                                  : context.navigator
                                      .pushNamed(AppRouter.tutorialRoute),
                            ),
                            if (state is! SuccessState<Account>)
                              SafeArea(
                                top: false,
                                child: TextButton.icon(
                                  onPressed: context.showLoginSheet,
                                  icon: Icon(TablerIcons.mail_forward,
                                      color: context.colorScheme.onSecondary),
                                  label: context.localizer.signIn.button(
                                      context,
                                      color: context.colorScheme.onSecondary),
                                ).top(8),
                              ),
                          ],
                        ).horizontal(24),
            ),
* */
