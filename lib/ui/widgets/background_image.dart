import 'package:flutter/material.dart';
import 'package:glassmorphism_flutter/core/constants.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    required this.pageCount,
    required this.screenSize,
    required this.offset,
  });

  final Size screenSize;

  final int pageCount;

  final double offset;

  @override
  Widget build(BuildContext context) {
    int lastPageIdx = pageCount - 1;
    int firstPageIdx = 0;
    int alignmentMax = 1;
    int alignmentMin = -1;
    int pageRange = (lastPageIdx - firstPageIdx) - 1;
    int alignmentRange = (alignmentMax - alignmentMin);
    double alignment =
        (((offset - firstPageIdx) * alignmentRange) / pageRange) + alignmentMin;
    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: Image(
        image: const AssetImage(backgroundImage),
        alignment: Alignment(alignment, 0),
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
