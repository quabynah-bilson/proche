import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/onboarding/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:shared_utils/shared_utils.dart';

/// main page for all users
class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _authBloc = AuthBloc(), _signOutBloc = AuthBloc();
  Account? _account;
  final _mapController = Completer<GoogleMapController>(),
      _kBorderRadius = 8.0,
      _iconList = <IconData>[
        TablerIcons.home_2,
        TablerIcons.search,
        TablerIcons.bell_z,
        TablerIcons.settings,
      ];
  final _kGooglePlex = const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746);
  var _bottomNavIndex = 0;

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

            if (state is SuccessState<void>) {
              context.navigator.pushNamedAndRemoveUntil(
                  AppRouter.welcomeRoute, (route) => false);
            }

            if (state is SuccessState<Account>) {
              setState(() => _account = state.data);
            }
          },
        ),
        BlocListener(
          bloc: _signOutBloc,
          listener: (context, state) {
            if (!mounted) return;

            if (state is ErrorState<String>) {
              context.showMessageDialog(state.failure);
            }

            if (state is SuccessState<void>) {
              context.navigator.pushNamedAndRemoveUntil(
                  AppRouter.welcomeRoute, (route) => false);
            }
          },
        )
      ],
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            /// map overlay
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: context.height * 0.25,
              child: IgnorePointer(
                ignoring: true,
                child: GoogleMap(
                  initialCameraPosition: _kGooglePlex,
                  padding: const EdgeInsets.only(bottom: 16, left: 20),
                  onMapCreated: (controller) {
                    if (_mapController.isCompleted) {
                      _mapController.complete(controller);
                    }
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  mapToolbarEnabled: false,
                ),
              ),
            ),

            /// page content
            Positioned.fill(
              child: CustomScrollView(
                slivers: [
                  /// user location section
                  SliverSafeArea(
                    bottom: false,
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            24, context.height * 0.1, 24, 16),
                        decoration: BoxDecoration(
                          color: context.colorScheme.background,
                          borderRadius: BorderRadius.circular(_kBorderRadius),
                        ),
                        child: ListTile(
                          title: context.localizer.yourLocation
                              .bodyText2(context, emphasis: kEmphasisMedium),
                          // TODO: replace with actual location name
                          subtitle: 'Accra Mall, Spintex Rd'
                              .subtitle2(context, weight: FontWeight.bold),
                          trailing: _account == null
                              ? null
                              : GestureDetector(
                                  // TODO: navigate to user profile
                                  onTap: () => context.showMessageDialog(
                                    context.localizer.signOutPrompt,
                                    title: context.localizer.confirm,
                                    animationAsset: Assets.animWelcomeNewUser,
                                    onTap: () =>
                                        _signOutBloc.add(LogoutAuthEvent()),
                                  ),
                                  child: Image.memory(
                                    _account!.avatarUrl
                                        .decodeBase64ImageToBytes(),
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),

                  /// main content
                  SliverToBoxAdapter(
                    child: DecoratedBox(
                      decoration:
                          BoxDecoration(color: context.colorScheme.background),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// quick help header
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              context.localizer.quickHelp.h6(context),
                              TextButton(
                                onPressed: context.showFeatureUnderDevSheet,
                                child:
                                    context.localizer.showMore.button(context),
                              ),
                            ],
                          ).horizontal(24).top(16),

                          /// quick help content
                          // if (Random.secure().nextBool()) ...{
                          // build a list
                          // ListView.separated(
                          //   shrinkWrap: true,
                          //   physics: const NeverScrollableScrollPhysics(),
                          //   padding:
                          //       const EdgeInsets.fromLTRB(24, 16, 24, 20),
                          //   itemBuilder: (context, index) =>
                          //       _buildQuickHelpTile(),
                          //   separatorBuilder: (_, __) =>
                          //       const SizedBox(height: 12),
                          //   itemCount: 2, // TODO : replace with data count
                          // ),
                          // } else ...{
                          //   SafeArea(
                          //     child: EmptyContentPlaceholder(
                          //       icon: TablerIcons.package_off,
                          //       title: context.localizer.nothingAvailableHeader,
                          //       subtitle:
                          //           context.localizer.nothingAvailableSubhead,
                          //     ),
                          //   ),
                          // },
                          SafeArea(
                            child: EmptyContentPlaceholder(
                              icon: TablerIcons.package_off,
                              title: context.localizer.nothingAvailableHeader,
                              subtitle:
                                  context.localizer.nothingAvailableSubhead,
                            ),
                          ),

                          /// free giveaway header
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              context.localizer.freeGiveaway.h6(context),
                              TextButton(
                                onPressed: context.showFeatureUnderDevSheet,
                                child:
                                    context.localizer.showMore.button(context),
                              ),
                            ],
                          ).horizontal(24).top(16),

                          // TODO  -> free giveaway content
                          SafeArea(
                            child: EmptyContentPlaceholder(
                                icon: TablerIcons.gift_off,
                                title: context.localizer.underMaintenanceHeader,
                                subtitle:
                                    context.localizer.underMaintenanceSubhead),
                          ),

                          /// events header
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              context.localizer.events.h6(context),
                              TextButton(
                                onPressed: context.showFeatureUnderDevSheet,
                                child:
                                    context.localizer.showMore.button(context),
                              ),
                            ],
                          ).horizontal(24).top(16),

                          // TODO  -> events content
                          SafeArea(
                            child: EmptyContentPlaceholder(
                                icon: TablerIcons.calendar_off,
                                title: context.localizer.underMaintenanceHeader,
                                subtitle:
                                    context.localizer.underMaintenanceSubhead),
                          ),

                          /// trips header
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              context.localizer.trips.h6(context),
                              TextButton(
                                onPressed: context.showFeatureUnderDevSheet,
                                child:
                                    context.localizer.showMore.button(context),
                              ),
                            ],
                          ).horizontal(24).top(16),

                          // TODO  -> trips content
                          SafeArea(
                            child: EmptyContentPlaceholder(
                                icon: TablerIcons.bus_off,
                                title: context.localizer.underMaintenanceHeader,
                                subtitle:
                                    context.localizer.underMaintenanceSubhead),
                          ),

                          // spacing at the bottom for padding
                          const SizedBox(height: kToolbarHeight),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).fillMaxSize(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: context.showFeatureUnderDevSheet,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          child: const Icon(TablerIcons.map_pin),
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: _iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.end,
          notchSmoothness: NotchSmoothness.smoothEdge,
          activeColor: context.colorScheme.primary,
          inactiveColor: context.theme.disabledColor,
          backgroundColor: context.colorScheme.onPrimary,
          onTap: (index) => setState(() => _bottomNavIndex = index),
          //other params
        ),
      ),
    );
  }

  // TODO -> extract into its own widget
  Widget _buildQuickHelpTile() => GestureDetector(
        onTap: context.showFeatureUnderDevSheet,
        child: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            border: Border.all(
                color: context.theme.disabledColor.withOpacity(kEmphasisLow)),
            borderRadius: BorderRadius.circular(_kBorderRadius),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // purpose
              'I am looking for an expert house cleaner to maintain my home this weekend'
                  .bodyText2(context,
                      weight: FontWeight.w600,
                      color: context.colorScheme.onSurface),
              // metadata
              Text.rich(
                // TODO: replace with computed data
                const TextSpan(
                  children: [
                    TextSpan(text: '⏱️Just now'),
                    TextSpan(text: ' • '),
                    TextSpan(text: '248m away'),
                    TextSpan(text: ' • '),
                    TextSpan(text: '\$40/hr'),
                  ],
                ),
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurface
                      .withOpacity(kEmphasisMedium),
                ),
              ).top(8),

              // sender
              ListTile(
                title: 'Theresah Webb'.subtitle2(context),
                leading:
                    'https://images.unsplash.com/photo-1597393922738-085ea04b5a07?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXRpZnVsJTIwYmxhY2slMjB3b21hbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=40'
                        .avatar(size: 40, circular: true),
                trailing: GestureDetector(
                  onTap: context.showFeatureUnderDevSheet,
                  child: Icon(
                    FeatherIcons.heart,
                    color: context.colorScheme.onSurface
                        .withOpacity(kEmphasisMedium),
                  ),
                ),
                subtitle: Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary
                        .withOpacity(kEmphasisLowest),
                    borderRadius: BorderRadius.circular(_kBorderRadius / 2),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: 'Verified'
                      .caption(context, color: context.colorScheme.primary),
                ).top(4).align(Alignment.centerLeft),
                minLeadingWidth: 16,
                contentPadding: EdgeInsets.zero,
              ).top(12),
            ],
          ),
        ),
      );
}
