import 'package:flutter/material.dart';
import 'package:shared_utils/shared_utils.dart';

class ServiceRequestOptionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? color;
  final Color? iconColor;
  final VoidCallback? onTap;

  const ServiceRequestOptionTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.color,
    this.iconColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.fromLTRB(24, 0, 24, 12),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
          decoration: BoxDecoration(
            color: (color ?? context.colorScheme.secondary)
                .withOpacity(kEmphasisLowest),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: color ?? context.colorScheme.secondary, width: 2.5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  title.subtitle1(context,
                      weight: FontWeight.w600,
                      color: color ?? context.colorScheme.secondary),
                  DecoratedBox(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color ?? context.colorScheme.secondary),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: null,
                      icon: Icon(Icons.arrow_right_alt,
                          color: iconColor ?? context.colorScheme.onSecondary),
                    ),
                  ),
                ],
              ),
              subtitle
                  .subtitle2(context,
                      color: color ?? context.colorScheme.secondary,
                      emphasis: kEmphasisMedium)
                  .top(8),
            ],
          ),
        ),
      );
}
