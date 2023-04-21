import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/core/utils/session.dart';
import 'package:mobile/features/onboarding/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:mobile/generated/protos/task.pb.dart';
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
  var _isFavorite = false, _distance = 0.0;

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
              widget.task.title.bodyText2(context,
                  weight: FontWeight.w600,
                  color: context.colorScheme.onSurface),
              // metadata
              Text.rich(
                // TODO: replace with computed data
                TextSpan(
                  children: [
                    TextSpan(text: '⏱️Just now'),
                    TextSpan(text: ' • '),
                    TextSpan(text: '${_distance.toStringAsFixed(2)}m away'),
                    TextSpan(text: ' • '),
                    TextSpan(
                        text:
                            '\$${widget.task.chargePerHour.toStringAsFixed(2)}/hr'),
                  ],
                ),
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurface
                      .withOpacity(kEmphasisMedium),
                ),
              ).top(8),

              // sender
              BlocBuilder(
                bloc: _authBloc,
                builder: (context, state) {
                  if (state is SuccessState<Account>) {
                    var account = state.data;
                    return ListTile(
                      onTap: widget.onTap ?? context.showFeatureUnderDevSheet,
                      title: account.displayName.subtitle2(context),
                      leading:
                          account.avatarUrl.avatar(size: 40, circular: true),
                      trailing: GestureDetector(
                        // todo -> add to favorites
                        onTap: () => setState(() => _isFavorite = !_isFavorite),
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
                      subtitle: Container(
                        decoration: BoxDecoration(
                          color: context.colorScheme.primary
                              .withOpacity(kEmphasisLowest),
                          borderRadius:
                              BorderRadius.circular(_kBorderRadius / 2),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        child: 'Verified'.caption(context,
                            color: context.colorScheme.primary),
                      ).top(4).align(Alignment.centerLeft),
                      minLeadingWidth: 16,
                      contentPadding: EdgeInsets.zero,
                    );
                  }

                  return const CircularProgressIndicator.adaptive().centered();
                },
              ).top(12),
            ],
          ),
        ),
      );
}
