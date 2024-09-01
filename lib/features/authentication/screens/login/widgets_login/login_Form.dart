import 'package:ecommerceapplication/features/authentication/screens/forgetPassword_configuretaion/forgetPassowrd_Screen.dart';
import 'package:ecommerceapplication/features/authentication/screens/signUp/sign_up.dart';
import 'package:ecommerceapplication/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';
import '../../../../../utils/helpers/helperFunction.dart';
import '../../../controllers/login_Controller/login_controller.dart';

class YLoginForm extends StatelessWidget {
  const YLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: YSizes.spaceBetweenSections,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) {
                YValidators.validateEmail(value);
                return null;
              },
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: YTextString.email),
            ),
            const SizedBox(height: YSizes.spaceBetweenInputFields),
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value) {
                  YValidators.validateEmptyText("Password", value);
                  return null;
                },
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: YTextString.password,
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.hidePassword.value =
                              !controller.hidePassword.value;
                        },
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye))),
              ),
            ),
            const SizedBox(
              height: YSizes.spaceBetweenInputFields / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) {
                          controller.rememberMe.value =
                              !controller.rememberMe.value;
                        },
                      ),
                    ),
                    const Text(YTextString.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => const Forget_Password());
                  },
                  child: const Text(YTextString.forgetPassword),
                ),
              ],
            ),
            const SizedBox(
              height: YSizes.spaceBetweenSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    controller.emailAndPasswordLogin();
                  },
                  style: ElevatedButton.styleFrom(
                      side: BorderSide.none,
                      backgroundColor: isDark ? YColors.white : YColors.black),
                  child: Text(
                    YTextString.signIn,
                    style: TextStyle(
                        color: isDark ? YColors.black : YColors.white),
                  )),
            ),
            const SizedBox(
              height: YSizes.spaceBetween,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => const SignUp_Page());
                  },
                  style: OutlinedButton.styleFrom(
                      side: BorderSide.none,
                      elevation: 30,
                      surfaceTintColor: isDark
                          ? YColors.grey.withOpacity(0.3)
                          : YColors.black.withOpacity(0.2),
                      backgroundColor: Colors.transparent),
                  child: Text(
                    YTextString.createAccount,
                    style: TextStyle(
                        color: isDark ? YColors.white : YColors.black),
                  )),
            ),
            const SizedBox(
              height: YSizes.spaceBetween,
            ),
          ],
        ),
      ),
    );
  }
}
