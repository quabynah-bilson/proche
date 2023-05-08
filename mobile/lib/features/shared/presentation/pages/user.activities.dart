import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/shared/presentation/manager/post/posts_bloc.dart';
import 'package:mobile/features/shared/presentation/widgets/quick.help.tile.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:mobile/generated/protos/core_shared.pb.dart';
import 'package:shared_utils/shared_utils.dart';

/// shows user's activities [events, tasks, trips etc] in a curated list
class UserActivitiesPage extends StatefulWidget {
  final Account? account;

  const UserActivitiesPage({Key? key, this.account}) : super(key: key);

  @override
  State<UserActivitiesPage> createState() => _UserActivitiesPageState();
}

class _UserActivitiesPageState extends State<UserActivitiesPage> {
  late final _postsBloc = PostsBloc();
  var _loading = true, _selectedTabIndex = 0;
  var _tasks = <ProcheTask>[],
      _giveaways = <GiveAway>[],
      _trips = <Trip>[],
      _events = <ProcheEvent>[];

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
            onTap: () => setState(() => _selectedTabIndex = index),
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

  Widget get _buildQuickHelpContent => _tasks.isEmpty
      ? EmptyContentPlaceholder(
          icon: TablerIcons.package_off,
          title: context.localizer.nothingAvailableHeader,
          subtitle: context.localizer.nothingAvailableSubhead,
        )
      : ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
          itemBuilder: (context, index) =>
              QuickHelpListTile(task: _tasks[index]),
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemCount: _tasks.length,
        );

  // TODO implement this
  Widget get _buildFreeGiveawayContent => _giveaways.isEmpty
      ? EmptyContentPlaceholder(
          icon: TablerIcons.gift_off,
          title: context.localizer.nothingAvailableHeader,
          subtitle: context.localizer.nothingAvailableSubhead,
        )
      : ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
          // todo -> build list tile
          itemBuilder: (context, index) => Container(),
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemCount: _giveaways.length,
        );

  // TODO implement this
  Widget get _buildTripsContent => _trips.isEmpty
      ? EmptyContentPlaceholder(
          icon: TablerIcons.bus_off,
          title: context.localizer.nothingAvailableHeader,
          subtitle: context.localizer.nothingAvailableSubhead,
        )
      : ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
          // todo -> build list tile
          itemBuilder: (context, index) => Container(),
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemCount: _trips.length,
        );

  // TODO implement this
  Widget get _buildEventsContent => _events.isEmpty
      ? EmptyContentPlaceholder(
          icon: TablerIcons.calendar_off,
          title: context.localizer.nothingAvailableHeader,
          subtitle: context.localizer.nothingAvailableSubhead,
        )
      : ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
          // todo -> build list tile
          itemBuilder: (context, index) => Container(),
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemCount: _events.length,
        );

  @override
  void initState() {
    super.initState();
    _postsBloc.add(widget.account == null
        ? GetCurrentUserPostsEvent()
        : GetUserPostsEvent(widget.account!.id));
  }

  @override
  Widget build(BuildContext context) => BlocListener(
        bloc: _postsBloc,
        listener: (context, state) {
          if (!mounted) return;

          setState(() => _loading = state is LoadingState);

          if (state is SuccessState<GetPostsForUserResponse>) {
            setState(() {
              _tasks = state.data.tasks;
              _giveaways = state.data.giveaways;
              _trips = state.data.trips;
              _events = state.data.events;
            });
          }
        },
        child: Scaffold(
          appBar: AppBar(),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              var index = await context.showServiceTypePickerSheet();
              if (index == null) return;
              context.navigator
                  .pushNamed(AppRouter.serviceFinderRoute, arguments: index);
            },
            icon: const Icon(TablerIcons.upload),
            label: Text(context.localizer.uploadService),
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
}
