import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/shared/presentation/manager/auth/auth_bloc.dart';
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
    // TODO check if user is already logged in
  }

  @override
  Widget build(BuildContext context) {
    kUseDefaultOverlays(context, statusBarBrightness: context.theme.brightness);
    return BlocConsumer(
      bloc: _authBloc,
      listener: (context, state) {
        if (!mounted) return;

        if (state is SuccessState<Account>) {
          // TODO update UI to show user is logged in
        }
      },
      builder: (context, state) => Scaffold(
        body: ResponsiveLayout(
          mobile: Stack(
            children: [
              /// main content
              Positioned.fill(
                child: Column(
                  children: [
                    Expanded(child: Assets.imgAppLogoAnimated.asAssetImage()),
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
                    ).horizontal(24),
                    if (state is SuccessState<Account>) ...{
                      AppRoundedButton(
                        text: 'Get started',
                        icon: TablerIcons.compass,
                        onTap: () => context.navigator.pushNamedAndRemoveUntil(
                            AppRouter.dashboardRoute, (route) => false),
                      ).horizontal(24),
                    } else if (state is! LoadingState) ...{
                      AppRoundedButton(
                        text: context.localizer.signUp,
                        icon: TablerIcons.shield_check,
                        onTap: context.showLoginSheet,
                      ),
                      SafeArea(
                        top: false,
                        child: TextButton(
                          // TODO navigate to dashboard
                          onPressed: context.showFeatureUnderDevSheet,
                          child: context.localizer.signInLater.button(context),
                        ).top(8),
                      ),
                    },
                  ],
                ),
              ),

              /// developer info
              Positioned(
                top: 12,
                left: 16,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: context.localizer.appDev
                      .overline(context, emphasis: kEmphasisMedium),
                ),
              ),

              Positioned(
                top: 12,
                right: 16,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompleteAccountUI(Account account) => AppRoundedButton(
        text: 'Complete your account setup',
        onTap: () => context.showAccountSetupSheet(account),
      ).fillMaxWidth(context, context.isMobile ? 0.8 : 0.6);
}
