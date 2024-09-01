import 'package:ecommerceapplication/commons/widgets/appbar/appBar.dart';
import 'package:ecommerceapplication/commons/widgets/icon/Circular_BrandImage.dart';
import 'package:ecommerceapplication/commons/widgets/shimmers/shimmer_loader.dart';
import 'package:ecommerceapplication/commons/widgets/texts/section_heading.dart';
import 'package:ecommerceapplication/features/authentication/controllers/userController/user_controller.dart';
import 'package:ecommerceapplication/features/authentication/screens/detailUpdationScreen/changename_screen.dart';
import 'package:ecommerceapplication/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const YAppBar(
        title: Text("Profile"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : YImagePath.user;
                      return controller.isImageUploading.value
                          ? YShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 100,
                            )
                          : YCircularImage(
                              width: 80,
                              height: 80,
                              effectHeight: 80,
                              effectWidth: 80,
                              showImageColor: true,
                              padding: EdgeInsets.all(0),
                              backgroundColor: YColors.white,
                              imageUrl: image,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                      onPressed: () {
                        controller.uploadUserProFilePicture();
                      },
                      child: const Text("Change Profile Picture"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: YSizes.spaceBetween / 2,
              ),
              const Divider(),
              const SizedBox(
                height: YSizes.spaceBetween,
              ),
              const YSectionHeading(
                sectionTitle: "Profile Information",
                showButton: false,
              ),
              const SizedBox(
                height: YSizes.spaceBetween,
              ),
              YProfileMenu(
                icon: Iconsax.arrow_right_34,
                onTap: () {
                  Get.to(() => ChangeName_Screen());
                },
                title: "Name",
                value: controller.user.value.firstName +
                    " " +
                    controller.user.value.lastName,
              ),
              YProfileMenu(
                icon: Iconsax.arrow_right_34,
                onTap: () {},
                title: "User Name",
                value: controller.user.value.userName,
              ),
              const SizedBox(
                height: YSizes.spaceBetweenSections,
              ),
              const YSectionHeading(
                sectionTitle: "Personal Information",
                showButton: false,
              ),
              const SizedBox(
                height: YSizes.spaceBetween,
              ),
              YProfileMenu(
                icon: Iconsax.arrow_right_34,
                onTap: () {},
                title: "User ID",
                value: controller.user.value.id,
              ),
              YProfileMenu(
                icon: Iconsax.arrow_right_34,
                onTap: () {},
                title: "E-mail",
                value: controller.user.value.email,
              ),
              YProfileMenu(
                icon: Iconsax.copy,
                onTap: () {},
                title: "Phone Number",
                value: controller.user.value.phoneNumber,
              ),
              YProfileMenu(
                icon: Iconsax.arrow_right_34,
                onTap: () {},
                title: "Gender",
                value: "Male",
              ),
              YProfileMenu(
                icon: Iconsax.arrow_right_34,
                onTap: () {},
                title: "Date of Birth",
                value: "10 Sep, 1993",
              ),
              const SizedBox(
                height: YSizes.spaceBetween,
              ),
              TextButton(
                onPressed: () {
                  controller.deleteUserAccountWarningPopup();
                },
                child: const Text(
                  "Delete Account",
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
