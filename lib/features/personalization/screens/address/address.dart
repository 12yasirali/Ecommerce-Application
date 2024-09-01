import 'package:ecommerceapplication/commons/widgets/appbar/appBar.dart';
import 'package:ecommerceapplication/features/personalization/screens/address/add_new_address.dart';
import 'package:ecommerceapplication/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddNewAddressPage());
        },
        backgroundColor: YColors.primary,
        child: const Icon(
          Iconsax.add,
          color: YColors.white,
        ),
      ),
      appBar: YAppBar(
        showBackArrow: true,
        title: Text(
          "Address",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(
                selectedAddress: false,
              ),
              SingleAddress(
                selectedAddress: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
