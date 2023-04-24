import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/core/utils/session.dart';
import 'package:mobile/core/utils/timestamp.dart';
import 'package:mobile/features/onboarding/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/features/shared/presentation/widgets/buttons.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:mobile/generated/protos/core_shared.pb.dart';
import 'package:shared_utils/shared_utils.dart';

class QuickHelpListTile extends StatefulWidget {
  final ProcheTask task;
  final VoidCallback? onTap;

  const QuickHelpListTile({
    Key? key,
    required this.task,
    this.onTap,
  }) : super(key: key);

  @override
  State<QuickHelpListTile> createState() => _QuickHelpListTileState();
}

class _QuickHelpListTileState extends State<QuickHelpListTile> {
  final _kBorderRadius = 16.0, _authBloc = AuthBloc();
  late final _isOwner = UserSession.kUserId == widget.task.userId;
  late var _isFavorite = false, _distance = 0.0;

  @override
  void initState() {
    super.initState();
    _authBloc.add(GetAccountByIdAuthEvent(widget.task.userId));
    doAfterDelay(() async {
      var distance = Geolocator.distanceBetween(
          UserSession.lat,
          UserSession.lng,
          widget.task.address.latitude,
          widget.task.address.longitude);
      setState(() => _distance = distance / 1000);
    });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => context.navigator
            .pushNamed(AppRouter.taskDetailsRoute, arguments: widget.task),
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
              Container(
                height: context.height * 0.18,
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: BorderRadius.circular(_kBorderRadius),
                ),
                child: widget.task.imageUrl.asNetworkImage(
                    width: context.width, height: context.height * 0.18),
              ),
              // purpose
              widget.task.title.bodyText2(context,
                  weight: FontWeight.w600,
                  color: context.colorScheme.onSurface),
              // metadata
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text:
                            '⏱️${formatTimestamp(widget.task.createdAt.toDateTime())}'),
                    const TextSpan(text: ' • '),
                    TextSpan(text: '${_distance.toStringAsFixed(2)}m away'),
                    const TextSpan(text: ' • '),
                    TextSpan(
                        text:
                            '\$${widget.task.chargePerHour.toStringAsFixed(2)}/hr'),
                  ],
                ),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurface
                      .withOpacity(kEmphasisMedium),
                ),
              ).top(8),

              // sender
              if (_isOwner) ...{
                Container(
                  width: context.width,
                  margin: const EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                      color: context.colorScheme.background,
                      border: Border.all(
                          color: context.colorScheme.secondaryContainer),
                      borderRadius: BorderRadius.circular(100)),
                  padding: const EdgeInsets.fromLTRB(16, 4, 8, 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      context.localizer.numberOfVolunteers(14).subtitle2(
                          context,
                          color: context.colorScheme.onSurface),
                      RoundedIconButton(
                        icon: TablerIcons.chevron_right,
                        color: context.colorScheme.onSurface,
                        onTap: () => context.navigator.pushNamed(
                            AppRouter.taskDetailsRoute,
                            arguments: widget.task),
                      ),
                    ],
                  ),
                ),
              } else ...{
                BlocBuilder(
                  bloc: _authBloc,
                  builder: (context, state) {
                    if (state is SuccessState<Account>) {
                      var account = state.data;
                      return ListTile(
                        onTap: widget.onTap ??
                            () => context.navigator.pushNamed(
                                AppRouter.publicProfileRoute,
                                arguments: account),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            account.displayName.subtitle2(context),
                            if (account.isVerified) ...{
                              const SizedBox(width: 8),
                              Assets.imgVerified.asAssetImage(
                                  size: context.textTheme.titleLarge!.fontSize),
                            },
                          ],
                        ),
                        leading:
                            account.avatarUrl.avatar(size: 40, circular: true),
                        trailing: GestureDetector(
                          // todo -> add to favorites
                          onTap: () =>
                              setState(() => _isFavorite = !_isFavorite),
                          child: Icon(
                            _isFavorite
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart,
                            color: (_isFavorite
                                    ? context.colorScheme.errorContainer
                                    : context.colorScheme.onSurface)
                                .withOpacity(kEmphasisMedium),
                          ),
                        ),
                        minLeadingWidth: 16,
                        contentPadding: EdgeInsets.zero,
                      );
                    }

                    return const CircularProgressIndicator.adaptive()
                        .centered();
                  },
                ).top(12),
              },
            ],
          ),
        ),
      );
}
