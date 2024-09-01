import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/constants/text_string.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Success_Screen extends StatelessWidget {
  const Success_Screen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

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
                image: AssetImage(
                  image,
                ),
              ),
              const SizedBox(
                height: YSizes.spaceBetweenSections,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: YSizes.spaceBetween,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: YSizes.spaceBetweenSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                      side: BorderSide.none,
                      backgroundColor: isDark ? YColors.white : YColors.black),
                  child: Text(
                    YTextString.continueText,
                    style: TextStyle(
                        color: isDark ? YColors.black : YColors.white),
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
