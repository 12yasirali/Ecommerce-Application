import 'package:ecommerceapplication/features/authentication/controllers/signup_Controller/signup_controller.dart';
import 'package:ecommerceapplication/features/authentication/screens/signUp/widget_signUp/terms_andCondition.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:ecommerceapplication/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';

class YSignUpFrom extends StatelessWidget {
  const YSignUpFrom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  expands: false,
                  validator: (value) =>
                      YValidators.validateEmptyText("First Name", value),
                  decoration: const InputDecoration(
                      labelText: YTextString.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: YSizes.signupSpaceBetweenInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      YValidators.validateEmptyText("Last Name", value),
                  decoration: const InputDecoration(
                      labelText: YTextString.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: YSizes.signupSpaceBetweenInputFields,
          ),
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                YValidators.validateEmptyText("User Name", value),
            decoration: const InputDecoration(
                labelText: YTextString.userName,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: YSizes.signupSpaceBetweenInputFields,
          ),
          TextFormField(
            controller: controller.email,
            validator: (value) => YValidators.validateEmail(value),
            decoration: const InputDecoration(
                labelText: YTextString.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: YSizes.signupSpaceBetweenInputFields,
          ),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => YValidators.validatePhoneNumber(value),
            decoration: const InputDecoration(
                labelText: YTextString.phoneNumber,
                prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: YSizes.signupSpaceBetweenInputFields,
          ),
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => YValidators.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: YTextString.password,
                suffixIcon: IconButton(
                    onPressed: () {
                      controller.hidePassword.value =
                          !controller.hidePassword.value;
                    },
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye)),
                prefixIcon: const Icon(
                  Iconsax.password_check,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: YSizes.spaceBetweenSections,
          ),
          const YTermsAndCondition(),
          const SizedBox(
            height: YSizes.spaceBetweenSections,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.signUp();
              },
              style: ElevatedButton.styleFrom(
                  side: BorderSide.none,
                  backgroundColor: isDark ? YColors.white : YColors.black),
              child: Text(
                YTextString.createAccount,
                style: TextStyle(color: isDark ? YColors.black : YColors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
