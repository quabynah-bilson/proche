import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/shared/presentation/manager/location/location_cubit.dart';
import 'package:mobile/features/shared/presentation/widgets/quick.help.tile.dart';
import 'package:mobile/features/task/presentation/manager/task_bloc.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/core_shared.pb.dart';
import 'package:mobile/generated/protos/shared.pb.dart';
import 'package:mobile/generated/protos/task.pb.dart';
import 'package:shared_utils/shared_utils.dart';

/// shows user's activities [events, tasks, trips etc] in a curated list
class UserActivitiesPage extends StatefulWidget {
  const UserActivitiesPage({Key? key}) : super(key: key);

  @override
  State<UserActivitiesPage> createState() => _UserActivitiesPageState();
}

class _UserActivitiesPageState extends State<UserActivitiesPage> {
  late final _quickHelpBloc = TaskBloc(),
      _locationBloc = LocationCubit(context);
  var _loading = true, _selectedTabIndex = 0;
  CommonAddress? _currentAddress;

  Widget get _buildCategoriesPicker {
    final headers = [
      context.localizer.quickHelp,
      context.localizer.freeGiveaway,
      context.localizer.trips,
      context.localizer.events,
    ];
    return SliverToBoxAdapter(
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var active = index == _selectedTabIndex;
          return GestureDetector(
            onTap: () {
              setState(() => _selectedTabIndex = index);
              _getServiceForSelectedTab();
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                  color: (active
                          ? context.colorScheme.primary
                          : context.colorScheme.onSecondaryContainer)
                      .withOpacity(kEmphasisLowest),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      width: active ? 1.5 : 1,
                      color: active
                          ? context.colorScheme.primary
                          : context.colorScheme.onSecondaryContainer)),
              child: headers[index]
                  .subtitle1(context,
                      color: active
                          ? context.colorScheme.primary
                          : context.colorScheme.onSecondaryContainer)
                  .centered(),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemCount: headers.length,
      ).fillMaxHeight(context, 0.05),
    );
  }

  Widget get _buildContentForSelectedTab {
    Widget child = const SizedBox.shrink();
    switch (_selectedTabIndex) {
      case 0:
        child = _buildQuickHelpContent;
        break;
      case 1:
        child = _buildFreeGiveawayContent;
        break;
      case 2:
        child = _buildTripsContent;
        break;
      case 3:
        child = _buildEventsContent;
        break;
      default:
        child = const SizedBox();
    }

    return SliverFillRemaining(child: child);
  }

  Widget get _buildQuickHelpContent => BlocBuilder(
        bloc: _quickHelpBloc,
        builder: (context, state) {
          if (state is ErrorState<String>) {
            return EmptyContentPlaceholder(
              icon: TablerIcons.package_off,
              title: context.localizer.nothingAvailableHeader,
              subtitle: context.localizer.nothingAvailableSubhead,
            );
          }

          if (state is SuccessState<Stream<List<ProcheTask>>>) {
            return StreamBuilder<List<ProcheTask>>(
              stream: state.data,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return SafeArea(
                    child: EmptyContentPlaceholder(
                      icon: TablerIcons.subtask,
                      title: context.localizer.nothingAvailableHeader,
                      subtitle: context.localizer.nothingAvailableSubhead,
                    ),
                  );
                }

                if (snapshot.hasData) {
                  final tasks = snapshot.data;
                  if (tasks!.isEmpty) {
                    return SafeArea(
                      child: EmptyContentPlaceholder(
                        icon: TablerIcons.subtask,
                        title: context.localizer.nothingAvailableHeader,
                        subtitle: context.localizer.nothingAvailableSubhead,
                      ),
                    );
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
                    itemBuilder: (context, index) =>
                        QuickHelpListTile(task: tasks[index]),
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemCount: tasks.length,
                  );
                }

                return SafeArea(
                  child: const CircularProgressIndicator.adaptive().centered(),
                );
              },
            );
          }

          return SafeArea(
            child: const CircularProgressIndicator.adaptive().centered(),
          );
        },
      );

  // TODO implement this
  Widget get _buildFreeGiveawayContent => EmptyContentPlaceholder(
        title: context.localizer.underMaintenanceHeader,
        subtitle: context.localizer.underMaintenanceSubhead,
        icon: TablerIcons.gift_off,
      );

  // TODO implement this
  Widget get _buildTripsContent => EmptyContentPlaceholder(
        title: context.localizer.underMaintenanceHeader,
        subtitle: context.localizer.underMaintenanceSubhead,
        icon: TablerIcons.bus_off,
      );

  // TODO implement this
  Widget get _buildEventsContent => EmptyContentPlaceholder(
        title: context.localizer.underMaintenanceHeader,
        subtitle: context.localizer.underMaintenanceSubhead,
        icon: TablerIcons.calendar_event,
      );

  @override
  void initState() {
    super.initState();
    _locationBloc.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) => MultiBlocListener(
        listeners: [
          BlocListener(
            bloc: _locationBloc,
            listener: (context, state) {
              if (!mounted) return;

              setState(() => _loading = state is LoadingState);

              if (state is SuccessState<AddressWithLatLngName>) {
                setState(() => _currentAddress = CommonAddress(
                      longitude: state.data.longitude,
                      latitude: state.data.latitude,
                      radius: 10,
                    ));
                _getServiceForSelectedTab();
              }
            },
          ),
          BlocListener(
            bloc: _quickHelpBloc,
            listener: (context, state) {
              if (!mounted) return;

              setState(() => _loading = state is LoadingState);
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              var index = await context.showServiceTypePickerSheet();
              if (index == null) return;
              context.navigator
                  .pushNamed(AppRouter.serviceFinderRoute, arguments: index);
            },
            backgroundColor: context.colorScheme.background,
            foregroundColor: context.colorScheme.onBackground,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            icon: ClipOval(
              child: Assets.imgAppLogoAnimated.asAssetImage(
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            label: context.localizer.uploadService.button(context),
          ),
          body: LoadingIndicator(
            isLoading: _loading,
            loadingAnimIsAsset: true,
            lottieAnimResource: Assets.animLoading,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: context.localizer.myPosts
                      .h6(context, weight: FontWeight.w600)
                      .left(24)
                      .bottom(16),
                ),
                _buildCategoriesPicker,
                _buildContentForSelectedTab,
              ],
            ),
          ),
        ),
      );

  void _getServiceForSelectedTab() {
    switch (_selectedTabIndex) {
      case 0:
        _quickHelpBloc.add(GetAllTasksEvent(_currentAddress!));
        break;
      // todo -> add others
      default:
        break;
    }
  }
}
