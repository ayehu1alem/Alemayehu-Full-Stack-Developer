import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppTextStyles {
  static const TextStyle baseLabel = TextStyle(
    color: CustomColors.textDefault,
    fontSize: 28,
  );

  static TextStyle dynamicLabel(Color color) =>
      TextStyle(color: color, fontWeight: FontWeight.bold);
}
