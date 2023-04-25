import 'package:flutter/material.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/core/utils/session.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/core_shared.pb.dart';
import 'package:shared_utils/shared_utils.dart';

class TaskCandidateTile extends StatelessWidget {
  final TaskCandidate candidate;

  const TaskCandidateTile({Key? key, required this.candidate})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: UserSession.kUserId == candidate.account.owner.id
            ? null
            : () => context.navigator.pushNamed(AppRouter.publicProfileRoute,
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
              padding: EdgeInsets.only(left: context.width * 0.21, bottom: 16),
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
}
