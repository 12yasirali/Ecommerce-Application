import 'package:ecommerceapplication/features/authentication/controllers/forgetpassword_Controller/forget_Password_Controller.dart';
import 'package:ecommerceapplication/features/authentication/screens/login/login_Page.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_string.dart';
import '../../../../utils/helpers/helperFunction.dart';

class Reset_Password extends StatelessWidget {
  const Reset_Password({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                width: YHelperFunctions.screenWidth() * 0.8,
                height: YHelperFunctions.screenHeight() * 0.4,
                image: const AssetImage(
                  YImagePath.sendMail,
                ),
              ),
              const SizedBox(
                height: YSizes.spaceBetweenSections,
              ),
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: YSizes.spaceBetween,
              ),
              Text(
                YTextString.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: YSizes.spaceBetween,
              ),
              Text(
                YTextString.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: YSizes.spaceBetweenSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => const Login_Page());
                  },
                  style: ElevatedButton.styleFrom(
                      side: BorderSide.none,
                      backgroundColor: isDark ? YColors.white : YColors.black),
                  child: Text(
                    YTextString.doneText,
                    style: TextStyle(
                        color: isDark ? YColors.black : YColors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: YSizes.spaceBetween,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    ForgetPasswordController.instance
                        .resendPasswordResetEmail(email);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                    elevation: 30.0,
                    surfaceTintColor: isDark
                        ? YColors.white.withOpacity(0.3)
                        : YColors.black.withOpacity(0.3),
                    backgroundColor: Colors.transparent,
                  ),
                  child: Text(
                    YTextString.resendEmail,
                    style: TextStyle(
                      color: isDark ? YColors.white : YColors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
