import 'package:flutter/material.dart';
import 'package:shared_utils/shared_utils.dart';

class PilledTabContainer extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final void Function(int) onTabSelected;

  const PilledTabContainer(
      {Key? key,
      required this.labels,
      required this.selectedIndex,
      required this.onTabSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: context.width,
        height: 64,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: labels
              .map(
                (label) => Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colorScheme.background,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: label.button(context, ).centered(),
                  ),
                ),
              )
              .toList(),
        ),
      );
}
