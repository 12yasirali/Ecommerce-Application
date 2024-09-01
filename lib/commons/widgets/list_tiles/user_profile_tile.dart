import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/authentication/controllers/userController/user_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_path.dart';
import '../icon/Circular_BrandImage.dart';

class YUserProfileTile extends StatelessWidget {
  const YUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    final controller = UserController.instance;
    return ListTile(
      leading: const YCircularImage(
        width: 50,
        height: 50,
        imageUrl: YImagePath.user,
        padding: EdgeInsets.all(0),
        showImageColor: true,
        backgroundColor: YColors.white,
      ),
      title: Obx(
        () => Text(
          controller.user.value.userName,
          style: Theme.of(context).textTheme.headlineSmall?.apply(
                color: isDark ? YColors.white : YColors.black,
              ),
        ),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.apply(color: isDark ? YColors.white : YColors.black),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Iconsax.edit,
          color: isDark ? YColors.white : YColors.black,
        ),
      ),
    );
  }
}
