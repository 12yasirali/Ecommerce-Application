import 'package:ecommerceapplication/commons/widgets/appbar/appBar.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressPage extends StatelessWidget {
  const AddNewAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const YAppBar(
        title: Text(
          "Add New Address",
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            YSizes.defaultSpace,
          ),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.user,
                    ),
                    labelText: "Name",
                  ),
                ),
                const SizedBox(
                  height: YSizes.spaceBetweenInputFields,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.mobile,
                    ),
                    labelText: "Phone Number",
                  ),
                ),
                const SizedBox(
                  height: YSizes.spaceBetweenInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.building_31,
                          ),
                          labelText: "Street",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: YSizes.spaceBetweenInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.code,
                          ),
                          labelText: "Postal Code",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: YSizes.spaceBetween,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.building,
                          ),
                          labelText: "City",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: YSizes.spaceBetweenInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.activity,
                          ),
                          labelText: "State",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: YSizes.spaceBetween,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Iconsax.global,
                      ),
                      labelText: "Country"),
                ),
                const SizedBox(
                  height: YSizes.defaultSpace,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      side: BorderSide.none,
                      backgroundColor: isDark ? YColors.white : YColors.black,
                    ),
                    child: const Text(
                      "Save",
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
