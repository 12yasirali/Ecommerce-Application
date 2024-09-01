import 'package:ecommerceapplication/commons/widgets/appbar/appBar.dart';
import 'package:ecommerceapplication/commons/widgets/containers/primary_HeaderContainer.dart';
import 'package:ecommerceapplication/commons/widgets/list_tiles/setting_menu_tile.dart';
import 'package:ecommerceapplication/commons/widgets/texts/section_heading.dart';
import 'package:ecommerceapplication/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerceapplication/features/personalization/screens/address/address.dart';
import 'package:ecommerceapplication/features/personalization/screens/profile/profile.dart';
import 'package:ecommerceapplication/features/shop/screens/order/order.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../commons/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/constants/colors.dart';

class Setting_Page extends StatelessWidget {
  const Setting_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            YPrimaryHeaderContainer(
              childHomeWidgets: Column(
                children: [
                  YAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context).textTheme.headlineSmall?.apply(
                          color: isDark ? YColors.white : YColors.black),
                    ),
                  ),
                  const SizedBox(
                    height: YSizes.spaceBetweenSections,
                  ),
                  YUserProfileTile(
                    onPressed: () {
                      Get.to(() => const ProfilePage());
                    },
                  ),
                  const SizedBox(
                    height: YSizes.spaceBetweenSections,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(YSizes.defaultSpace),
              child: Column(
                children: [
                  const YSectionHeading(
                    sectionTitle: "Account Setting",
                    showButton: false,
                  ),
                  const SizedBox(
                    height: YSizes.spaceBetweenSections,
                  ),
                  SettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My Address",
                    subTitle: "Set shopping delivery address",
                    onTap: () {
                      Get.to(() => const UserAddressScreen());
                    },
                  ),
                  const SettingMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: "My Cart",
                      subTitle: "Add, remove products and move to checkout"),
                  SettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Orders",
                    subTitle: "In_progress and Completed Orders",
                    onTap: () {
                      Get.to(() => const OrderScreen());
                    },
                  ),
                  const SettingMenuTile(
                      icon: Iconsax.bank,
                      title: "Bank Account",
                      subTitle: "Widthdraw balance to registered bank account"),
                  const SettingMenuTile(
                      icon: Iconsax.discount_shape,
                      title: "My Coupons",
                      subTitle: "List of all discounted coupons"),
                  const SettingMenuTile(
                      icon: Iconsax.notification,
                      title: "Notifications",
                      subTitle: "Set any kind of notification message"),
                  const SettingMenuTile(
                      icon: Iconsax.security_card,
                      title: "Account Privacy",
                      subTitle: "Manage data usage and connected accounts"),
                  const SizedBox(height: YSizes.spaceBetweenSections),
                  const YSectionHeading(
                      sectionTitle: "App Settings", showButton: false),
                  const SizedBox(height: YSizes.spaceBetween),
                  const SettingMenuTile(
                      icon: Iconsax.document_upload,
                      title: "Load Data",
                      subTitle: "Upload data to your Cloud FireStore"),
                  SettingMenuTile(
                    icon: Iconsax.location,
                    title: "Geolocation",
                    subTitle: "Set recommendation based on location",
                    trailing: Switch(
                      activeColor: YColors.primary,
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingMenuTile(
                      icon: Iconsax.security_user,
                      title: "Safe Mode",
                      subTitle: "Search result is safe for all ages",
                      trailing: Switch(
                        activeColor: YColors.primary,
                        value: false,
                        onChanged: (value) {},
                      )),
                  SettingMenuTile(
                    icon: Iconsax.image,
                    title: "HD image Quality",
                    subTitle: "Set image quality to be seen",
                    trailing: Switch(
                      activeColor: YColors.primary,
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: YSizes.spaceBetweenSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {
                          AuthenticationRepository.instance.logout();
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                          elevation: 30,
                          surfaceTintColor: isDark
                              ? YColors.white.withOpacity(0.3)
                              : YColors.black.withOpacity(0.2),
                          backgroundColor: Colors.transparent,
                        ),
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              color: isDark ? YColors.white : YColors.black),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
