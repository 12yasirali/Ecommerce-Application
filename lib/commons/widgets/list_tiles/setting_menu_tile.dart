import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';

class SettingMenuTile extends StatelessWidget {
  const SettingMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle,
      this.trailing,
      this.onTap});

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);

    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 28,
        color: YColors.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.apply(color: isDark ? YColors.white : Colors.black),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.apply(color: isDark ? YColors.white : Colors.black),
      ),
      trailing: trailing,
    );
  }
}
