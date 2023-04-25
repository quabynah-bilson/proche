import 'package:flutter/material.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/shared/presentation/widgets/quick.help.tile.dart';
import 'package:mobile/generated/protos/core_shared.pb.dart';
import 'package:shared_utils/shared_utils.dart';

class UserPostsForProfileView extends StatelessWidget {
  final List<ProcheTask> tasks;
  final List<ProcheEvent> events;
  final List<GiveAway> giveaways;
  final List<Trip> trips;

  const UserPostsForProfileView({
    Key? key,
    required this.tasks,
    required this.events,
    required this.giveaways,
    required this.trips,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hasTrips = trips.isNotEmpty,
        hasGiveaways = giveaways.isNotEmpty,
        hasEvents = events.isNotEmpty,
        hasTasks = tasks.isNotEmpty,
        hasNoPosts = !hasTrips && !hasGiveaways && !hasEvents && !hasTasks;

    return SafeArea(
      top: false,
      child: hasNoPosts
          ? EmptyContentPlaceholder(
              icon: TablerIcons.notes_off,
              title: context.localizer.nothingAvailableHeader,
              subtitle: context.localizer.nothingAvailableSubhead).top(24)
          : CustomScrollView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                if (hasTasks)
                  // tasks
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DecoratedBox(
                            decoration: BoxDecoration(
                              color: context.colorScheme.secondary
                                  .withOpacity(kEmphasisLowest),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: context.localizer.quickHelp
                                .subtitle2(context,
                                    color: context.colorScheme.secondary)
                                .vertical(4)
                                .horizontal(12)),
                        ListView.separated(
                          padding: const EdgeInsets.only(top: 16),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              SummaryQuickHelpListTile(task: tasks[index]),
                          separatorBuilder: (_, __) => const SizedBox(width: 8),
                          itemCount: tasks.length,
                        ).fillMaxHeight(context, 0.2),
                      ],
                    ).bottom(16),
                  ),

                // events
                if (hasEvents)
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DecoratedBox(
                            decoration: BoxDecoration(
                              color: context.colorScheme.secondary
                                  .withOpacity(kEmphasisLowest),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: context.localizer.events
                                .subtitle2(context,
                                    color: context.colorScheme.secondary)
                                .vertical(4)
                                .horizontal(12)),
                        ListView.separated(
                          padding: const EdgeInsets.only(top: 16),
                          scrollDirection: Axis.horizontal,
                          // todo -> build tile
                          itemBuilder: (context, index) => Container(
                            width: context.width * 0.45,
                            height: 100,
                            decoration: BoxDecoration(
                              color: context.colorScheme.secondary
                                  .withOpacity(kEmphasisLowest),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          separatorBuilder: (_, __) => const SizedBox(width: 8),
                          itemCount: events.length,
                        ).fillMaxHeight(context, 0.2),
                      ],
                    ).bottom(16),
                  ),

                // giveaways
                if (hasGiveaways)
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DecoratedBox(
                            decoration: BoxDecoration(
                              color: context.colorScheme.secondary
                                  .withOpacity(kEmphasisLowest),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: context.localizer.freeGiveaway
                                .subtitle2(context,
                                    color: context.colorScheme.secondary)
                                .vertical(4)
                                .horizontal(12)),
                        ListView.separated(
                          padding: const EdgeInsets.only(top: 16),
                          scrollDirection: Axis.horizontal,
                          // todo -> build tile
                          itemBuilder: (context, index) => Container(
                            width: context.width * 0.45,
                            height: 100,
                            decoration: BoxDecoration(
                              color: context.colorScheme.secondary
                                  .withOpacity(kEmphasisLowest),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          separatorBuilder: (_, __) => const SizedBox(width: 8),
                          itemCount: giveaways.length,
                        ).fillMaxHeight(context, 0.2),
                      ],
                    ).bottom(16),
                  ),

                // trips
                if (hasTrips)
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DecoratedBox(
                            decoration: BoxDecoration(
                              color: context.colorScheme.secondary
                                  .withOpacity(kEmphasisLowest),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: context.localizer.trips
                                .subtitle2(context,
                                    color: context.colorScheme.secondary)
                                .vertical(4)
                                .horizontal(12)),
                        ListView.separated(
                          padding: const EdgeInsets.only(top: 16),
                          scrollDirection: Axis.horizontal,
                          // todo -> build tile
                          itemBuilder: (context, index) => Container(
                            width: context.width * 0.45,
                            height: 100,
                            decoration: BoxDecoration(
                              color: context.colorScheme.secondary
                                  .withOpacity(kEmphasisLowest),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          separatorBuilder: (_, __) => const SizedBox(width: 8),
                          itemCount: trips.length,
                        ).fillMaxHeight(context, 0.2),
                      ],
                    ).bottom(16),
                  ),
              ],
            ),
    );
  }
}
