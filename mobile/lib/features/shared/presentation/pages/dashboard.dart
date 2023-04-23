import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/actions.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/core/utils/session.dart';
import 'package:mobile/core/utils/validator.dart';
import 'package:mobile/features/onboarding/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/features/shared/presentation/manager/device/device.dart';
import 'package:mobile/features/shared/presentation/manager/locale/locale_cubit.dart';
import 'package:mobile/features/shared/presentation/manager/location/location_cubit.dart';
import 'package:mobile/features/shared/presentation/manager/theme/theme_cubit.dart';
import 'package:mobile/features/shared/presentation/widgets/buttons.dart';
import 'package:mobile/features/shared/presentation/widgets/quick.help.tile.dart';
import 'package:mobile/features/shared/presentation/widgets/setting.list.tile.dart';
import 'package:mobile/features/shared/presentation/widgets/tab.container.dart';
import 'package:mobile/features/task/presentation/manager/task_bloc.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:mobile/generated/protos/core_shared.pb.dart';
import 'package:mobile/generated/protos/shared.pb.dart';
import 'package:mobile/generated/protos/task.pb.dart';
import 'package:shared_utils/shared_utils.dart';

part 'tabs/business.profile.dart';

part 'tabs/home.dart';

part 'tabs/notification.dart';

part 'tabs/personal.profile.dart';

part 'tabs/search.dart';

part 'tabs/settings.dart';

/// main page for all users
class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _authBloc = AuthBloc(),
      _iconList = <IconData>[
        TablerIcons.home_2,
        TablerIcons.search,
        TablerIcons.bell_z,
        TablerIcons.settings,
      ],
      _pageController = PageController();
  var _bottomNavIndex = 0;
  Account? _account;

  @override
  void initState() {
    super.initState();
    _authBloc.add(GetCurrentAccountAuthEvent());
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

            if (state is ErrorState<String>) {
              // get public token for unauthorized user
              context.showWelcomeDialog();
            }

            if (state is SuccessState<Account>) {
              setState(() => _account = state.data);
            }
          },
        ),
      ],
      child: Scaffold(
        extendBody: true,
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (page) => setState(() => _bottomNavIndex = page),
          children: [
            _HomeTab(account: _account),
            const _SearchTab(),
            const _NotificationTab(),
            _SettingsTab(account: _account),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _bottomNavIndex == 3
            ? null
            : FloatingActionButton.extended(
                backgroundColor: context.colorScheme.background,
                foregroundColor: context.colorScheme.onBackground,
                onPressed: () async {
                  var serviceTypeIndex =
                      await context.showServiceTypePickerSheet();
                  if (serviceTypeIndex == null) return;
                  context.navigator.pushNamed(AppRouter.serviceFinderRoute,
                      arguments: serviceTypeIndex);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                label: Text(context.localizer.findService),
                icon: ClipOval(
                  child: Assets.imgAppLogoAnimated.asAssetImage(
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: _iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.none,
          elevation: 0,
          notchSmoothness: NotchSmoothness.smoothEdge,
          activeColor: context.colorScheme.primary,
          inactiveColor: context.theme.disabledColor,
          backgroundColor: context.colorScheme.onPrimary,
          onTap: (index) => _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut),
          //other params
        ),
      ),
    );
  }
}
