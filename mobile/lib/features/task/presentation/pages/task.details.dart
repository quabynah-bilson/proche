import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/shared/presentation/widgets/tab.container.dart';
import 'package:mobile/features/task/presentation/manager/task_bloc.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:mobile/generated/protos/task.pb.dart';
import 'package:shared_utils/shared_utils.dart';

class ProcheTaskDetailsPage extends StatefulWidget {
  final ProcheTask task;

  const ProcheTaskDetailsPage({Key? key, required this.task}) : super(key: key);

  @override
  State<ProcheTaskDetailsPage> createState() => _ProcheTaskDetailsPageState();
}

class _ProcheTaskDetailsPageState extends State<ProcheTaskDetailsPage> {
  var _loading = false, _candidates = <BusinessAccount>[], _selectedIndex = 0;
  final _quickHelpBloc = TaskBloc();
  final _candidatesStreamController =
      StreamController<List<BusinessAccount>>.broadcast();

  Widget get _buildTabContent => Expanded(
      child: _selectedIndex == 0 ? _buildCandidatesTab : _buildDetailsTab);

  Widget get _buildCandidatesTab => StreamBuilder<List<BusinessAccount>>(
      stream: _candidatesStreamController.stream,
      // todo: add candidates list
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return EmptyContentPlaceholder(
            icon: TablerIcons.building_factory_2,
            title: context.localizer
                .numberOfVolunteers(snapshot.data!.length),
            subtitle: context.localizer.underMaintenanceSubhead,
          );
        }

        if (snapshot.hasError) {
          return EmptyContentPlaceholder(
            icon: TablerIcons.user_search,
            title: context.localizer.nothingAvailableHeader,
            subtitle: context.localizer.nothingAvailableSubhead,
          );
        }

        return const CircularProgressIndicator.adaptive().centered();
      });

  Widget get _buildDetailsTab => AnimatedListView(
        children: [],
      );

  @override
  void initState() {
    super.initState();
    _quickHelpBloc.add(GetCandidatesForTask(widget.task.id));
  }

  @override
  void dispose() {
    _candidatesStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocListener(
        bloc: _quickHelpBloc,
        listener: (context, state) {
          if (!mounted) return;

          setState(() => _loading = state is LoadingState);

          if (state is SuccessState<Stream<List<BusinessAccount>>>) {
            _candidatesStreamController.sink.addStream(state.data);
          }
        },
        child: Scaffold(
          appBar: AppBar(),
          body: LoadingIndicator(
            isLoading: _loading,
            loadingAnimIsAsset: true,
            lottieAnimResource: Assets.animLoading,
            child: StreamBuilder<List<BusinessAccount>>(
              stream: _candidatesStreamController.stream,
              initialData: const <BusinessAccount>[],
              builder: (context, snapshot) {
                return Column(
                  children: [
                    PilledTabContainer(
                      labels: [
                        context.localizer.candidates(_candidates.length),
                        context.localizer.postDetails
                      ],
                      selectedIndex: _selectedIndex,
                      onTabSelected: (index) =>
                          setState(() => _selectedIndex = index),
                    ).horizontal(24),
                    _buildTabContent,
                  ],
                );
              }
            ),
          ),
        ),
      );
}
