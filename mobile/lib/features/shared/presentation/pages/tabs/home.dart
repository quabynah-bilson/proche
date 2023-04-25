part of '../dashboard.dart';

class _HomeTab extends StatefulWidget {
  final Account? account;

  const _HomeTab({Key? key, this.account}) : super(key: key);

  @override
  State<_HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<_HomeTab> {
  late final _authBloc = AuthBloc(),
      _quickHelpBloc = TaskBloc(),
      _locationCubit = LocationCubit(context),
      _mapController = Completer<GoogleMapController>(),
      _kBorderRadius = 8.0;
  var _currentLocation = const LatLng(37.42796133580664, -122.085749655962),
      _currentAddress = 'Loading...';
  late var _account = widget.account;

  final _quickHelpStream = StreamController<List<ProcheTask>>.broadcast();

  @override
  void initState() {
    super.initState();
    _authBloc.add(GetCurrentAccountAuthEvent());
    _locationCubit.getCurrentLocation();
  }

  @override
  void dispose() {
    _closeStreams();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocListener(
        listeners: [
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
                setState(() {
                  _currentLocation =
                      LatLng(state.data.latitude, state.data.longitude);
                  UserSession.lat = state.data.latitude;
                  UserSession.lng = state.data.longitude;
                  _currentAddress = state.data.name;
                });
                _quickHelpBloc.add(
                  GetAllTasksEvent(
                    CommonAddress(
                        latitude: state.data.latitude,
                        longitude: state.data.longitude),
                  ),
                );
              }
            },
          ),
          BlocListener(
            bloc: _quickHelpBloc,
            listener: (context, state) {
              if (!mounted) return;

              if (state is SuccessState<Stream<List<ProcheTask>>>) {
                _quickHelpStream.sink.addStream(state.data);
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
              child: CustomScrollView(
                slivers: [
                  /// user location section
                  SliverSafeArea(
                    bottom: false,
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: 16,
                                bottom: 8,
                                top: context.height * 0.015),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: context.colorScheme.background,
                              borderRadius:
                                  BorderRadius.circular(_kBorderRadius),
                            ),
                            child: TextButton.icon(
                              onPressed: context.showFiltersSheet,
                              icon: Icon(TablerIcons.filter,
                                  color: context.colorScheme.secondary),
                              label: context.localizer.filters.button(context,
                                  color: context.colorScheme.secondary),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: context.colorScheme.background,
                              borderRadius:
                                  BorderRadius.circular(_kBorderRadius),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: AnimatedColumn(
                                    animateType: AnimateType.slideRight,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      context.localizer.yourLocation.caption(
                                          context,
                                          emphasis: kEmphasisMedium),
                                      _currentAddress.bodyText1(context,
                                          weight: FontWeight.bold),
                                    ],
                                  ),
                                ),
                                if (_account != null &&
                                    !_account!.avatarUrl.isNullOrEmpty())
                                  _account!.avatarUrl
                                      .avatar(size: 48, circular: true),
                              ],
                            ),
                          ),
                        ],
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
                                onPressed: () => context.navigator
                                    .pushNamed(AppRouter.userActivitiesRoute),
                                child:
                                    context.localizer.showMore.button(context),
                              ),
                            ],
                          ).horizontal(24).top(16),

                          /// quick help content
                          StreamBuilder<List<ProcheTask>>(
                            stream: _quickHelpStream.stream,
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return SafeArea(
                                  child: EmptyContentPlaceholder(
                                    icon: TablerIcons.subtask,
                                    title: context
                                        .localizer.nothingAvailableHeader,
                                    subtitle: context
                                        .localizer.nothingAvailableSubhead,
                                  ),
                                );
                              }

                              if (snapshot.hasData) {
                                final tasks = snapshot.data;
                                if (tasks!.isEmpty) {
                                  return SafeArea(
                                    child: EmptyContentPlaceholder(
                                      icon: TablerIcons.subtask,
                                      title: context
                                          .localizer.nothingAvailableHeader,
                                      subtitle: context
                                          .localizer.nothingAvailableSubhead,
                                    ),
                                  );
                                }

                                return ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding:
                                      const EdgeInsets.fromLTRB(24, 16, 24, 20),
                                  itemBuilder: (context, index) =>
                                      QuickHelpListTile(task: tasks[index]),
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 12),
                                  itemCount: tasks.length,
                                );
                              }

                              return SafeArea(
                                child:
                                    const CircularProgressIndicator.adaptive()
                                        .centered(),
                              );
                            },
                          ),

                          /// free giveaway header
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              context.localizer.freeGiveaway.h6(context),
                              TextButton(
                                onPressed: () => context.navigator
                                    .pushNamed(AppRouter.userActivitiesRoute),
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
                                onPressed: () => context.navigator
                                    .pushNamed(AppRouter.userActivitiesRoute),
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
                                onPressed: () => context.navigator
                                    .pushNamed(AppRouter.userActivitiesRoute),
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
      );

  void _closeStreams() async {
    if (await _quickHelpStream.done) _quickHelpStream.close();
  }
}
