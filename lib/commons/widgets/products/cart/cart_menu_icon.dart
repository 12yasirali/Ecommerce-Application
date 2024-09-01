import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class YCartContainerIcon extends StatelessWidget {
  const YCartContainerIcon({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.shopping_bag,
            color: isDark ? YColors.white : YColors.black,
          ),
        ),
        Positioned(
          top: 6,
          right: 6,
          child: Container(
            width: 13,
            height: 13,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(18)),
            child: Center(
              child: Text(
                "2",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.apply(color: YColors.white, fontSizeFactor: 0.8),
              ),
            ),
          ),
        )
      ],
    );
  }
}
