import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/constants.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/shared/presentation/manager/auth/auth_bloc.dart';
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
                        context.localizer!.appName.h4(context, weight: FontWeight.bold),
                        kAppDesc.bodyText2(context).top(8).bottom(40),
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
                        text: 'Sign up',
                        icon: TablerIcons.shield_check,
                        onTap: context.showLoginSheet,
                      ),
                      SafeArea(
                        top: false,
                        child: TextButton(
                          // TODO navigate to dashboard
                          onPressed: context.showFeatureUnderDevSheet,
                          child: 'Sign in later'.button(context),
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
                  child:
                  kAppNameLong.overline(context, emphasis: kEmphasisMedium),
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
