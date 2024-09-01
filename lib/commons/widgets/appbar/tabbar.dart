import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/device/device_utility.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';

class YTabBar extends StatelessWidget implements PreferredSizeWidget {
  const YTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return Material(
      color: isDark ? YColors.dark : YColors.light,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        tabs: tabs,
        isScrollable: true,
        indicatorColor: YColors.primary,
        labelColor: isDark ? YColors.white : YColors.black,
        unselectedLabelColor: YColors.darkerGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(YDeviceUtility.getAppbarHeight());
}
