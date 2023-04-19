part of '../dashboard.dart';

class _HomeTab extends StatefulWidget {
  final Account? account;

  const _HomeTab({Key? key, this.account}) : super(key: key);

  @override
  State<_HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<_HomeTab> {
  late final _authBloc = AuthBloc(),
      _signOutBloc = AuthBloc(),
      _locationCubit = LocationCubit(context),
      _mapController = Completer<GoogleMapController>(),
      _kBorderRadius = 8.0,
      _iconList = <IconData>[
        TablerIcons.home_2,
        TablerIcons.search,
        TablerIcons.bell_z,
        TablerIcons.settings,
      ];
  var _currentLocation = const LatLng(37.42796133580664, -122.085749655962),
      _currentAddress = 'Loading...';
  Account? _account;

  @override
  void initState() {
    super.initState();
    _authBloc.add(GetCurrentAccountAuthEvent());
    doAfterDelay(() {
      setState(() => _account = widget.account);
      _locationCubit.getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) => MultiBlocListener(
        listeners: [
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
          ),
          BlocListener(
            bloc: _authBloc,
            listener: (context, state) {
              if (!mounted) return;

              if (state is ErrorState<String>) {
                context.showMessageDialog(state.failure);
              }

              if (state is SuccessState<Account>) {
                setState(() => _account = state.data);
              }
            },
          ),
          BlocListener(
            bloc: _locationCubit,
            listener: (context, state) {
              if (!mounted) return;

              if (state is ErrorState<String>) {
                setState(() => _currentAddress = 'n/a');
                context.showMessageDialog(state.failure);
              }

              if (state is SuccessState<AddressWithLatLngName>) {
                _currentLocation =
                    LatLng(state.data.latitude, state.data.longitude);
                setState(() => _currentAddress = state.data.name);
              }
            },
          ),
        ],
        child: Stack(
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
                  initialCameraPosition:
                      CameraPosition(target: _currentLocation, zoom: 14),
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
              child: NotificationListener(
                onNotification: (notification) {
                  if (notification is ScrollUpdateNotification) {
                    // todo -> hide/show bottom nav bar
                  }
                  return false;
                },
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      floating: true,
                      snap: true,
                      elevation: 0,
                      forceElevated: false,
                      backgroundColor:
                          context.colorScheme.background.withOpacity(0),
                      foregroundColor: Colors.transparent,
                      bottom: PreferredSize(
                          preferredSize: Size.fromHeight(context.height * 0.07),
                          child: const SizedBox.shrink()),

                      /// user location section
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        collapseMode: CollapseMode.parallax,
                        title: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: context.colorScheme.background,
                            borderRadius: BorderRadius.circular(_kBorderRadius),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: AnimatedColumn(
                                  animateType: AnimateType.slideRight,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    context.localizer.yourLocation.overline(
                                        context,
                                        emphasis: kEmphasisMedium),
                                    _currentAddress.overline(context,
                                        weight: FontWeight.bold),
                                  ],
                                ),
                              ),
                              if (_account != null &&
                                  !_account!.avatarUrl.isNullOrEmpty())
                                _account!.avatarUrl
                                    .avatar(size: 32, circular: true),
                            ],
                          ),
                        ),
                      ),
                    ),

                    /// main content
                    SliverToBoxAdapter(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: context.colorScheme.background),
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
                                  child: context.localizer.showMore
                                      .button(context),
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
                                  child: context.localizer.showMore
                                      .button(context),
                                ),
                              ],
                            ).horizontal(24).top(16),

                            // TODO  -> free giveaway content
                            SafeArea(
                              child: EmptyContentPlaceholder(
                                  icon: TablerIcons.gift_off,
                                  title:
                                      context.localizer.underMaintenanceHeader,
                                  subtitle: context
                                      .localizer.underMaintenanceSubhead),
                            ),

                            /// events header
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                context.localizer.events.h6(context),
                                TextButton(
                                  onPressed: context.showFeatureUnderDevSheet,
                                  child: context.localizer.showMore
                                      .button(context),
                                ),
                              ],
                            ).horizontal(24).top(16),

                            // TODO  -> events content
                            SafeArea(
                              child: EmptyContentPlaceholder(
                                  icon: TablerIcons.calendar_off,
                                  title:
                                      context.localizer.underMaintenanceHeader,
                                  subtitle: context
                                      .localizer.underMaintenanceSubhead),
                            ),

                            /// trips header
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                context.localizer.trips.h6(context),
                                TextButton(
                                  onPressed: context.showFeatureUnderDevSheet,
                                  child: context.localizer.showMore
                                      .button(context),
                                ),
                              ],
                            ).horizontal(24).top(16),

                            // TODO  -> trips content
                            SafeArea(
                              child: EmptyContentPlaceholder(
                                  icon: TablerIcons.bus_off,
                                  title:
                                      context.localizer.underMaintenanceHeader,
                                  subtitle: context
                                      .localizer.underMaintenanceSubhead),
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
            ),
          ],
        ).fillMaxSize(context),
      );

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
