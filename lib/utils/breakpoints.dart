import 'package:flutter/material.dart';

import '../constants/size.dart';

/// Breakpoints for adaptive design
class Breakpoints {
  static const double phoneMax = axMinDesktopWidth;
  static const double tabletMax = axTabletWidth;
}

/// Extension to make responsive design clean and concise
extension ResponsiveContext on BuildContext {
  // Get screen dimensions
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  // Percentage-based scaling shortcuts
  double widthPct(double percent) => screenWidth * (percent / 100);

  double heightPct(double percent) => screenHeight * (percent / 100);

  // Device type checks
  bool get isPhone => screenWidth < Breakpoints.phoneMax;

  bool get isTablet =>
      screenWidth >= Breakpoints.phoneMax &&
      screenWidth <= Breakpoints.tabletMax;

  bool get isDesktop => screenWidth > Breakpoints.tabletMax;

  // Reusable adaptive padding
  EdgeInsets get adaptiveHorizontalPadding {
    if (isDesktop)
      return EdgeInsets.symmetric(horizontal: (screenWidth - 1000) / 2);
    if (isTablet)
      return EdgeInsets.symmetric(
        horizontal: (screenWidth - axMinDesktopWidth) / 2,
      );
    return const EdgeInsets.symmetric(horizontal: 16.0);
  }
}
