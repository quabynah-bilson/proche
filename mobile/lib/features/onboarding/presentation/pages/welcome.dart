import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              child: state is LoadingState
                  ? Assets.imgAppLogoAnimated.asAssetImage().centered()
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
                                              Image.memory(
                                                  state.data.avatarUrl
                                                      .decodeBase64ImageToBytes(),
                                                  width: context.width * 0.4,
                                                  height: context.width * 0.4),
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
                                  backgroundColor:
                                      context.colorScheme.primary,
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
                                child:
                                    Assets.imgAppLogoAnimated.asAssetImage()),
                            AnimatedColumn(
                              animateType: AnimateType.slideRight,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                context.localizer.appName
                                    .h4(context, weight: FontWeight.bold),
                                context.localizer.appDesc
                                    .bodyText2(context)
                                    .top(8)
                                    .bottom(40),
                              ],
                            ),
                            AppRoundedButton(
                              text: context.localizer.signUp,
                              icon: TablerIcons.shield_check,
                              onTap: context.showLoginSheet,
                            ),
                            SafeArea(
                              top: false,
                              child: TextButton(
                                onPressed: () => context.navigator
                                    .pushNamed(AppRouter.dashboardRoute),
                                child: context.localizer.signInLater
                                    .button(context),
                              ).top(8),
                            ),
                          ],
                        ).horizontal(24),
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
              right: 16,
              child: SafeArea(
                bottom: false,
                child: BlocBuilder(
                  bloc: context.read<LocaleCubit>(),
                  builder: (context, state) => state is SuccessState<String>
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: context.colorScheme.primary
                                .withOpacity(kEmphasisLowest),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              state.data
                                  .toUpperCase()
                                  .subtitle2(context,
                                      color: context.colorScheme.primary,
                                      weight: FontWeight.bold)
                                  .right(8),
                              PopupMenuButton<String>(
                                color: context.colorScheme.background,
                                icon: Icon(TablerIcons.chevron_down,
                                    color: context.colorScheme.primary),
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

  Widget _buildCompleteAccountUI(Account account) => AppRoundedButton(
        text: 'Complete your account setup',
        onTap: () => context.showAccountSetupSheet(account),
      ).fillMaxWidth(context, context.isMobile ? 0.8 : 0.6);
}
