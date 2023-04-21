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
                            weight: FontWeight.bold,
                            alignment: TextAlign.center),
                        context.localizer.appLongDesc
                            .bodyText1(context,
                                alignment: TextAlign.center,
                                emphasis: kEmphasisMedium)
                            .top(8),
                      ],
                    ).horizontal(context.width * 0.1),
                    const Spacer(),

                    // action buttons
                    if (state is LoadingState)
                      const CircularProgressIndicator.adaptive()
                    else if (state is SuccessState<Account>) ...{
                      AppRoundedButton(
                        text: context.localizer.getStarted,
                        onTap: () => context.navigator.pushNamedAndRemoveUntil(
                            AppRouter.dashboardRoute, (_) => false),
                      ),
                      SafeArea(
                        top: false,
                        child: context.localizer.appDev
                            .overline(context, emphasis: kEmphasisMedium)
                            .top(16),
                      ),
                    } else
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
                      ).bottom(40).horizontal(24)
                  ],
                ),
              ),
            ),

            /// developer info
            if (state is! LoadingState)
              Positioned(
                top: 12,
                left: state is LoadingState ? -context.width * 0.3 : 16,
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
            if (state is! LoadingState)
              Positioned(
                top: 12,
                left:
                    state is SuccessState<Account> ? null : context.width * 0.1,
                right:
                    state is SuccessState<Account> ? context.width * 0.1 : null,
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
                                  enabled: state is! LoadingState,
                                  enableFeedback: true,
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
