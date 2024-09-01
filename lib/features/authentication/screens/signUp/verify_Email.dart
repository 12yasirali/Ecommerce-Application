import 'package:ecommerceapplication/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerceapplication/features/authentication/controllers/signup_Controller/verify-Email_controller.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/constants/text_string.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Verify_Email extends StatelessWidget {
  const Verify_Email({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);

    final controller = Get.put(Verify_Email_Controller());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                AuthenticationRepository.instance.logout();
              },
              icon: const Icon(CupertinoIcons.clear))
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
                image: const AssetImage(YImagePath.sendMail),
              ),
              const SizedBox(
                height: YSizes.spaceBetweenSections,
              ),
              Text(
                YTextString.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: YSizes.spaceBetween,
              ),
              Text(
                email ?? " ",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: YSizes.spaceBetween,
              ),
              Text(
                YTextString.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: YSizes.spaceBetween,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => controller.checkEmailVerificationStatus());
                  },
                  style: ElevatedButton.styleFrom(
                      side: BorderSide.none,
                      backgroundColor: isDark ? YColors.white : YColors.black),
                  child: Text(
                    YTextString.continueText,
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
                        controller.sendEmailVerification();
                      },
                      style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                          elevation: 30,
                          surfaceTintColor: isDark
                              ? YColors.grey.withOpacity(0.3)
                              : YColors.black.withOpacity(0.2),
                          backgroundColor: Colors.transparent),
                      child: Text(
                        YTextString.resendEmail,
                        style: TextStyle(
                            color: isDark ? YColors.white : YColors.black),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
