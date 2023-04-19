import 'package:flutter/material.dart';
import 'package:shared_utils/shared_utils.dart';

/// rounded button with icon
class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final VoidCallback onTap;

  const RoundedIconButton(
      {Key? key, required this.icon, this.color, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (color ?? context.colorScheme.primary)
                .withOpacity(kEmphasisLowest),
            border: Border.all(
                width: 1, color: color ?? context.colorScheme.primary),
          ),
          child: Icon(
            icon,
            color: color ?? context.colorScheme.primary,
          ),
        ),
      );
}
