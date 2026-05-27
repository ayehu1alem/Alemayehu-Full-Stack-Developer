import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.maxLines = 1,
    this.hintText,
  });

  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(color: CustomColors.scaffoldBd2),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16),
        filled: true,
        fillColor: CustomColors.whitePrimary,
        focusedBorder: getOutlinedInputBorder,
        enabledBorder: getOutlinedInputBorder,
        border: getOutlinedInputBorder,
        hintText: hintText,
        hintStyle: TextStyle(color: CustomColors.hintDark),
      ),
    );
  }

  OutlineInputBorder get getOutlinedInputBorder {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );
  }
}
