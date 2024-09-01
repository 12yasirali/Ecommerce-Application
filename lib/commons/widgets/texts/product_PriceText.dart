import 'package:flutter/material.dart';

class YProductPriceText extends StatelessWidget {
  const YProductPriceText({
    super.key,
    required this.price,
    this.currencySign = "\$",
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });

  final String price, currencySign;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        currencySign + price,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: isLarge
            ? Theme.of(context).textTheme.headlineMedium?.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context).textTheme.headlineSmall?.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null),
      ),
    );
  }
}
