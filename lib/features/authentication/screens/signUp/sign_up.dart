import 'package:ecommerceapplication/commons/widgets/Widgets_login_signup/from_DIvider.dart';
import 'package:ecommerceapplication/commons/widgets/Widgets_login_signup/social_Buttons.dart';
import 'package:ecommerceapplication/features/authentication/screens/signUp/widget_signUp/signUp_form.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/constants/text_string.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp_Page extends StatelessWidget {
  const SignUp_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? YColors.black : YColors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: YSizes.paddingUpSpace, horizontal: YSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                YTextString.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: YSizes.spaceBetweenSections,
              ),
              const YSignUpFrom(),
              const SizedBox(
                height: YSizes.spaceBetweenSections,
              ),
              YFormDivider(
                  dividerText: "${YTextString.orSignInWith.capitalize}"),
              const SizedBox(
                height: YSizes.spaceBetweenSections,
              ),
              const YSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
