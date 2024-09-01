import 'package:ecommerceapplication/features/authentication/controllers/forgetpassword_Controller/forget_Password_Controller.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_path.dart';
import '../../../../utils/constants/text_string.dart';
import '../../../../utils/helpers/helperFunction.dart';

class Forget_Password extends StatelessWidget {
  const Forget_Password({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    final isDark = YHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                width: YHelperFunctions.screenWidth() * 0.6,
                height: YHelperFunctions.screenHeight() * 0.3,
                image: const AssetImage(YImagePath.forget),
              ),
              const SizedBox(
                height: YSizes.spaceBetweenSections,
              ),
              Text(
                YTextString.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: YSizes.spaceBetween,
              ),
              Text(
                YTextString.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: YSizes.spaceBetween * 2,
              ),
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  controller: controller.email,
                  validator: YValidators.validateEmail,
                  decoration: const InputDecoration(
                      labelText: YTextString.email,
                      prefixIcon: Icon(Iconsax.direct_right)),
                ),
              ),
              const SizedBox(
                height: YSizes.spaceBetweenSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.sendPasswordResetEmail();
                  },
                  style: ElevatedButton.styleFrom(
                      side: BorderSide.none,
                      backgroundColor: isDark ? YColors.white : YColors.black),
                  child: Text(
                    YTextString.submit,
                    style: TextStyle(
                      color: isDark ? YColors.black : YColors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
