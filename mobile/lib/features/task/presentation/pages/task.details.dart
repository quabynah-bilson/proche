import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/core/utils/session.dart';
import 'package:mobile/core/utils/timestamp.dart';
import 'package:mobile/features/onboarding/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/features/shared/presentation/manager/location/location_cubit.dart';
import 'package:mobile/features/shared/presentation/widgets/tab.container.dart';
import 'package:mobile/features/task/presentation/manager/task_bloc.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:mobile/generated/protos/shared.pb.dart';
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
  late final _locationCubit = LocationCubit(context),
      _isCurrentOwner = UserSession.kUserId == widget.task.userId;
  final _quickHelpBloc = TaskBloc(),
      _ownerBloc = AuthBloc(),
      _taskBloc = TaskBloc(),
      _applyForTaskBloc = TaskBloc();
  final _candidatesStreamController =
          StreamController<List<TaskCandidate>>.broadcast(sync: true),
      _taskStreamController =
          StreamController<ProcheTask>.broadcast(sync: true);

  Widget _buildCandidatesTab(AsyncSnapshot<List<TaskCandidate>> snapshot) {
    if (snapshot.hasData) {
      return ListView.separated(
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        itemCount: snapshot.data!.length,
        separatorBuilder: (_, __) =>
            Divider(color: context.colorScheme.secondaryContainer),
        itemBuilder: (context, index) {
          var candidate = snapshot.data![index];
          return GestureDetector(
            onTap: () => context.navigator.pushNamed(
                AppRouter.publicProfileRoute,
                arguments: candidate.account.owner),
            child: Column(
              key: ValueKey(candidate.id),
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: context.width * 0.17,
                    height: context.width * 0.17,
                    decoration: BoxDecoration(
                      color: context.colorScheme.background,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: context.colorScheme.secondaryContainer,
                          width: 2.5),
                    ),
                    child: candidate.account.owner.avatarUrl
                        .avatar(size: context.width * 0.2, circular: true),
                  ),
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      candidate.account.owner.displayName
                          .subtitle1(context, weight: FontWeight.w600),
                      if (candidate.account.owner.isVerified) ...{
                        const SizedBox(width: 8),
                        Assets.imgVerified.asAssetImage(
                            size: context.textTheme.titleLarge!.fontSize),
                      },
                    ],
                  ),
                  subtitle: candidate.account.specialization
                      .bodyText2(context, emphasis: kEmphasisMedium),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: context.width * 0.21, bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${candidate.account.hourlyRate.toStringAsFixed(2)}/hr',
                        style: context.textTheme.titleLarge
                            ?.copyWith(color: context.colorScheme.secondary),
                      ),
                      Text(
                        '⭐️${candidate.account.ratings.toStringAsFixed(1)}',
                        style: context.textTheme.titleMedium
                            ?.copyWith(color: context.colorScheme.secondary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
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
  }

  Widget get _buildDetailsTab => Expanded(
        child: StreamBuilder<ProcheTask>(
            stream: _taskStreamController.stream,
            initialData: widget.task,
            builder: (context, snapshot) {
              var currentTask = snapshot.data ?? widget.task;
              return AnimatedListView(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, kToolbarHeight),
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: currentTask.imageUrl.asNetworkImage(
                        height: context.height * 0.3, width: context.width),
                  ),
                  currentTask.title.h6(context).vertical(16),
                  BlocBuilder(
                    bloc: _locationCubit,
                    builder: (context, state) {
                      if (state is SuccessState<double>) {
                        return Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      '⏱️${formatTimestamp(widget.task.createdAt.toDateTime())}'),
                              const TextSpan(text: ' • '),
                              TextSpan(
                                  text:
                                      '${(state.data / 1000).toStringAsFixed(2)}m away'),
                              const TextSpan(text: ' • '),
                              TextSpan(
                                  text:
                                      '\$${widget.task.chargePerHour.toStringAsFixed(2)}/hr'),
                            ],
                          ),
                          textAlign: TextAlign.start,
                          style: context.textTheme.titleSmall?.copyWith(
                            color: context.colorScheme.onBackground
                                .withOpacity(kEmphasisMedium),
                          ),
                        ).bottom(8);
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                  BlocBuilder(
                    bloc: _ownerBloc,
                    builder: (context, state) {
                      if (state is SuccessState<Account>) {
                        var account = state.data;
                        return ListTile(
                          onTap: () => context.navigator.pushNamed(
                              AppRouter.publicProfileRoute,
                              arguments: account),
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              account.displayName
                                  .subtitle1(context, weight: FontWeight.w600),
                              if (account.isVerified) ...{
                                const SizedBox(width: 8),
                                Assets.imgVerified.asAssetImage(
                                    size:
                                        context.textTheme.titleLarge!.fontSize),
                              },
                            ],
                          ),
                          trailing: IconButton(
                              onPressed: () => context.navigator.pushNamed(
                                  AppRouter.chatRoute,
                                  arguments: account),
                              color: context.colorScheme.secondary,
                              iconSize: 28,
                              icon: const Icon(TablerIcons.message_2_share)),
                          subtitle: (account.isPublicAccount
                                  ? context.localizer.publicAccount
                                  : context.localizer.privateAccount)
                              .bodyText2(context, emphasis: kEmphasisMedium),
                          leading: account.avatarUrl
                              .avatar(size: 56, circular: true),
                          minLeadingWidth: 56,
                          contentPadding: EdgeInsets.zero,
                        );
                      }

                      return const CircularProgressIndicator.adaptive()
                          .centered();
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 20),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: context.height * 0.15,
                    width: context.width,
                    child: Stack(
                      children: [
                        IgnorePointer(
                          ignoring: true,
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                                target: LatLng(currentTask.address.latitude,
                                    currentTask.address.longitude),
                                zoom: 16),
                            myLocationButtonEnabled: false,
                            markers: {
                              Marker(
                                markerId: MarkerId(currentTask.id),
                                position: LatLng(currentTask.address.latitude,
                                    currentTask.address.longitude),
                              )
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  context.localizer.description
                      .subtitle1(context, weight: FontWeight.w600)
                      .bottom(8),
                  currentTask.description.bodyText1(context),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: context.colorScheme.secondary
                          .withOpacity(kEmphasisLowest),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: context.localizer.idCardRequiredForServiceApplication
                        .subtitle1(context,
                            alignment: TextAlign.center,
                            color: context.colorScheme.secondary),
                  ),
                  if (!_isCurrentOwner)
                    BlocBuilder(
                      bloc: _ownerBloc,
                      builder: (context, state) {
                        if (state is SuccessState<Account>) {
                          var account = state.data;
                          return AppRoundedButton(
                            text: context.localizer.applyNow,
                            enabled: !_loading,
                            onTap: () async {
                              var taskRequest =
                                  await context.showTaskApplicationSheet(
                                      currentTask, account);
                              if (taskRequest == null) return;
                              taskRequest.taskId = widget.task.id;
                              _applyForTaskBloc
                                  .add(ApplyForTaskEvent(taskRequest));
                            },
                          ).centered();
                        }

                        return const CircularProgressIndicator.adaptive()
                            .centered();
                      },
                    ),
                ],
              );
            }),
      );

  @override
  void initState() {
    super.initState();
    _quickHelpBloc.add(GetCandidatesForTask(widget.task.id));
    _taskBloc.add(GetTaskEvent(widget.task.id));
    _ownerBloc.add(GetAccountByIdAuthEvent(widget.task.userId));
    doAfterDelay(() async {
      _locationCubit.getDistanceBetween(
          AddressWithLatLngName(
              latitude: UserSession.lat, longitude: UserSession.lng),
          AddressWithLatLngName(
            latitude: widget.task.address.latitude,
            longitude: widget.task.address.longitude,
          ));
    });
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
            bloc: _quickHelpBloc,
            listener: (context, state) {
              if (!mounted) return;

              setState(() => _loading = state is LoadingState);

              if (state is SuccessState<Stream<List<TaskCandidate>>>) {
                _candidatesStreamController.sink.addStream(state.data);
              }
            },
          ),
          BlocListener(
            bloc: _taskBloc,
            listener: (context, state) {
              if (!mounted) return;

              setState(() => _loading = state is LoadingState);

              if (state is SuccessState<Stream<ProcheTask>>) {
                _taskStreamController.sink.addStream(state.data);
              }
            },
          ),
          BlocListener(
            bloc: _applyForTaskBloc,
            listener: (context, state) {
              if (!mounted) return;

              setState(() => _loading = state is LoadingState);

              if (state is ErrorState<String>) {
                context.showMessageDialog(state.failure);
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(),
          body: LoadingIndicator(
            isLoading: _loading,
            loadingAnimIsAsset: true,
            lottieAnimResource: Assets.animLoading,
            child: StreamBuilder<List<TaskCandidate>>(
                stream: _candidatesStreamController.stream,
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      PilledTabContainer(
                        labels: [
                          context.localizer.candidates(
                              snapshot.hasData && snapshot.data != null
                                  ? snapshot.data!.length
                                  : 0),
                          context.localizer.postDetails
                        ],
                        selectedIndex: _selectedIndex,
                        onTabSelected: (index) =>
                            setState(() => _selectedIndex = index),
                      ).horizontal(24),
                      if (_selectedIndex == 0)
                        Expanded(child: _buildCandidatesTab(snapshot))
                      else
                        _buildDetailsTab,
                    ],
                  );
                }),
          ),
        ),
      );

  void _closeStreams() async {
    if (await _candidatesStreamController.done) {
      await _candidatesStreamController.close();
    }

    if (await _taskStreamController.done) {
      await _taskStreamController.close();
    }
  }
}
