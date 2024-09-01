import 'package:ecommerceapplication/features/authentication/controllers/userController/user_controller.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/constants/text_string.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:ecommerceapplication/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text("Re_Authenticate User"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(YSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value) =>
                      YValidators.validateEmptyText("Email", value),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: YTextString.email),
                ),
                SizedBox(
                  height: YSizes.spaceBetween,
                ),
                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        YValidators.validateEmptyText("Password", value),
                    decoration: InputDecoration(
                      labelText: YTextString.password,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.hidePassword.value =
                              !controller.hidePassword.value;
                        },
                        icon: Icon(
                          controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: YSizes.spaceBetween,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.reAuthenticateUserEmailAndPassword();
                    },
                    style: ElevatedButton.styleFrom(
                        side: BorderSide.none,
                        backgroundColor: isDark ? YColors.white : Colors.black),
                    child: Text(
                      "Verify",
                      style: TextStyle(
                          color: isDark ? YColors.black : YColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
