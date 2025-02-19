import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/responsive/size_detection_helper.dart';

class DeviceUtilities {
  static bool isMobile(BuildContext context) {
    return context.screenWidth < 600;
  }

  static bool isTablet(BuildContext context) {
    return context.screenWidth >= 600 && context.screenWidth < 1200;
  }

  static bool isDesktop(BuildContext context) {
    return context.screenWidth >= 1200;
  }

  static int gridChildrenCount(BuildContext context,
      {required int mobileCount,
      int? tabletCount,
      int? desktopCount,
      int? elseCount}) {
    if (isMobile(context)) {
      return mobileCount;
    } else if (isTablet(context) && tabletCount != null) {
      return tabletCount;
    } else if (isDesktop(context) && desktopCount != null) {
      return desktopCount;
    } else {
      return elseCount ?? mobileCount;
    }
  }
}
