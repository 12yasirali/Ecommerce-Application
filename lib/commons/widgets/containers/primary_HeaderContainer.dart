import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../curved_edges/custom_Curved_widget.dart';
import 'custom_Container.dart';

class YPrimaryHeaderContainer extends StatelessWidget {
  const YPrimaryHeaderContainer({
    super.key,
    required this.childHomeWidgets,
  });

  final Widget childHomeWidgets;

  @override
  Widget build(BuildContext context) {
    return YCurvedEdgeWidget(
      child: Container(
        color: YColors.primary.withGreen(170),
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -100,
              right: -230,
              child: YCircularContainer(
                backgroundColor: YColors.white.withOpacity(0.3),
              ),
            ),
            Positioned(
              top: 100,
              right: -250,
              child: YCircularContainer(
                backgroundColor: YColors.white.withOpacity(0.3),
              ),
            ),
            childHomeWidgets
          ],
        ),
      ),
    );
  }
}
