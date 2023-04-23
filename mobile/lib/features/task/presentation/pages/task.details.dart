import 'package:flutter/material.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/shared/presentation/widgets/tab.container.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/task.pb.dart';
import 'package:shared_utils/shared_utils.dart';

class ProcheTaskDetailsPage extends StatefulWidget {
  final ProcheTask task;

  const ProcheTaskDetailsPage({Key? key, required this.task}) : super(key: key);

  @override
  State<ProcheTaskDetailsPage> createState() => _ProcheTaskDetailsPageState();
}

class _ProcheTaskDetailsPageState extends State<ProcheTaskDetailsPage> {
  var _loading = false, _selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: LoadingIndicator(
          isLoading: _loading,
          loadingAnimIsAsset: true,
          lottieAnimResource: Assets.animLoading,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: PilledTabContainer(
                  labels: [
                    context.localizer.candidates,
                    context.localizer.postDetails
                  ],
                  selectedIndex: _selectedIndex,
                  onTabSelected: (index) =>
                      setState(() => _selectedIndex = index),
                ).horizontal(24),
              ),
              // empty content placeholder
              // todo: add candidates list
              SliverFillRemaining(
                hasScrollBody: false,
                child: EmptyContentPlaceholder(
                  icon: TablerIcons.user_search,
                  title: context.localizer.nothingAvailableHeader,
                  subtitle: context.localizer.nothingAvailableSubhead,
                ),
              ),
            ],
          ),
        ),
      );
}
