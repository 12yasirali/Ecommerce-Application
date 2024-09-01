import 'package:ecommerceapplication/commons/styles/spacing_Styles.dart';
import 'package:ecommerceapplication/features/authentication/screens/login/widgets_login/login_Form.dart';
import 'package:ecommerceapplication/features/authentication/screens/login/widgets_login/login_header.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/widgets/Widgets_login_signup/from_DIvider.dart';
import '../../../../commons/widgets/Widgets_login_signup/social_Buttons.dart';

class Login_Page extends StatelessWidget {
  const Login_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: YSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const YLoginHeader(),
              const YLoginForm(),
              YFormDivider(
                dividerText: "${YTextString.orSignInWith.capitalize}",
              ),
              const SizedBox(
                height: YSizes.spaceBetweenSections,
              ),
              const YSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
