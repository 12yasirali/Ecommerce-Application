import 'package:ecommerceapplication/commons/widgets/appbar/appBar.dart';
import 'package:ecommerceapplication/features/authentication/screens/detailUpdationScreen/controller/updatename_controller.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/constants/text_string.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:ecommerceapplication/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeName_Screen extends StatelessWidget {
  const ChangeName_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: YAppBar(
        showBackArrow: false,
        title: Text("Change Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(YSizes.defaultSpace),
        child: Column(
          children: [
            Text(
              "Use Real name for easy verification. This name will appear on several page",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: YSizes.spaceBetween,
            ),
            Form(
              key: controller.updateUserNameKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        YValidators.validateEmptyText("First Name", value),
                    expands: false,
                    decoration:
                        InputDecoration(labelText: YTextString.firstName),
                  ),
                  SizedBox(
                    height: YSizes.spaceBetween,
                  ),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        YValidators.validateEmptyText("Last Name", value),
                    expands: false,
                    decoration:
                        InputDecoration(labelText: YTextString.lastName),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: YSizes.spaceBetween,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.updateUserNames();
                },
                style: ElevatedButton.styleFrom(
                    side: BorderSide.none,
                    backgroundColor: isDark ? YColors.white : Colors.black),
                child: Text(
                  "Update",
                  style:
                      TextStyle(color: isDark ? YColors.black : YColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
