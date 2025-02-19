import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/responsive/size_provider.dart';

extension SizeDetectionHelper on BuildContext {
  bool get isLandScape =>
      MediaQuery.orientationOf(this) == Orientation.landscape;

  //* handling the landScape status
  double get screenWidth => isLandScape
      ? MediaQuery.sizeOf(this).height
      : MediaQuery.sizeOf(this).width;
  double get screenHeight => isLandScape
      ? MediaQuery.sizeOf(this).width
      : MediaQuery.sizeOf(this).height;

  //* Make accessing the SizeProvider more easier
  SizeProvider get sizeProvider => SizeProvider.of(this);

  //* The following value represents how much wider the current widget "width" is compared to the design reference "baseSize".
  double get scaleWidth => sizeProvider.width / sizeProvider.baseSize.width;
  double get scaleHeight => sizeProvider.height / sizeProvider.baseSize.height;

  double setHeight(num height) {
    return height * scaleHeight;
  }

  double setWidth(num width) {
    return width * scaleWidth;
  }

  double setMinSize(num size) {
    return size * min(scaleWidth, scaleHeight);
  }

  double setMaxSize(num size) {
    return size * max(scaleWidth, scaleHeight);
  }
}
