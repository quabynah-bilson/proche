import 'package:flutter/material.dart';
import 'package:shared_utils/shared_utils.dart';

class SettingListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Widget? trailing;
  final Color? color;
  final void Function()? onTap;
  final double bottomSpacing;

  const SettingListTile({
    Key? key,
    required this.title,
    required this.icon,
    this.subtitle,
    this.trailing,
    this.color,
    this.onTap,
    this.bottomSpacing = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: onTap,
        title: title.subtitle1(context),
        subtitle: subtitle.isNullOrEmpty()
            ? null
            : subtitle!.subtitle2(context, emphasis: kEmphasisMedium),
        minLeadingWidth: 48,
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color:
                (color ?? context.colorScheme.secondary).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color ?? context.colorScheme.secondary,
          ),
        ),
        trailing: trailing,
      ).bottom(bottomSpacing);
}
