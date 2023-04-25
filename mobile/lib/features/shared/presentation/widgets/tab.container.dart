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
          color: context.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: labels.map(
            (label) {
              var active = labels.indexOf(label) == selectedIndex;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onTabSelected(labels.indexOf(label)),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: active
                          ? context.colorScheme.background
                          : context.colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: label
                        .button(context,
                            alignment: TextAlign.center,
                            color: active
                                ? context.colorScheme.onBackground
                                : context.colorScheme.onSecondaryContainer)
                        .centered(),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      );
}
