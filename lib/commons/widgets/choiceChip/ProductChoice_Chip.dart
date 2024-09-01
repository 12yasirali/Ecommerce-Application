import 'package:ecommerceapplication/commons/widgets/containers/custom_Container.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class YChoiceChip extends StatelessWidget {
  const YChoiceChip({
    super.key,
    required this.isSelected,
    required this.text,
    this.onSelected,
  });

  final bool isSelected;
  final String text;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = YHelperFunctions.getColor(text) != null;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: isSelected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: isSelected ? YColors.white : null),
        avatar: isColor
            ? YCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: YHelperFunctions.getColor(text),
              )
            : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? Colors.green : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        selectedColor: isColor ? Colors.green : null,
      ),
    );
  }
}
