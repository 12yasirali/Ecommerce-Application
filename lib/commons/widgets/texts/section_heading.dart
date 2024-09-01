import 'package:flutter/material.dart';

class YSectionHeading extends StatelessWidget {
  const YSectionHeading({
    super.key,
    this.textColor,
    required this.sectionTitle,
    this.buttonTitle = 'View all',
    this.showButton = true,
    this.onPressed,
  });
  final Color? textColor;
  final String sectionTitle, buttonTitle;
  final bool showButton;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionTitle,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}
