import 'package:flutter/material.dart';
import 'package:shared_utils/shared_utils.dart';

/// rounded button with icon
class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final Color? foregroundColor;
  final VoidCallback onTap;
  final bool hasBadge;
  final bool isOpaque;

  const RoundedIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.color,
    this.foregroundColor,
    this.hasBadge = false,
    this.isOpaque = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (color ?? context.colorScheme.primary)
                .withOpacity(isOpaque ? kEmphasisHighest : kEmphasisLowest),
            border: Border.all(
                width: 1, color: color ?? context.colorScheme.primary),
          ),
          child: Stack(
            children: [
              Icon(
                icon,
                size: 20,
                color: isOpaque
                    ? (foregroundColor ?? context.colorScheme.onPrimary)
                    : (color ?? context.colorScheme.primary),
              ).centered(),
              if (hasBadge)
                Positioned(
                  top: 10,
                  right: 12,
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
}
