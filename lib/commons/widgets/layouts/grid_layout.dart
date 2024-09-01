import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class YGrid_Layout extends StatelessWidget {
  const YGrid_Layout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 243.4,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: YSizes.gridViewSpacing,
          crossAxisSpacing: YSizes.gridViewSpacing,
          mainAxisExtent: mainAxisExtent,
        ),
        itemBuilder: itemBuilder);
  }
}
