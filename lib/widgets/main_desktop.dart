import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/social_media_push.dart';

import '../constants/colors.dart';
import '../utils/breakpoints.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

    final isAmharic = context.locale.languageCode == 'am';

    return Container(
      padding: context.adaptiveHorizontalPadding.copyWith(top: 20, bottom: 20),
      constraints: BoxConstraints(minHeight: screenHeight * 0.6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Side: The Home Vector/Image and your New Bouncing Logo stacked nicely
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/home.png",
                  width: screenWidth / 2.5,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),

          const SizedBox(width: 40),

          // Right Side: Content description text wrapped cleanly
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "text_welcome".tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: CustomColors.whiteSecondary,
                  ),
                ),
                const SizedBox(height: 3),

                nameText(
                  context,
                  isAmharic ? "name".tr() : "text_one".tr(),
                  isAmharic ? "text_one".tr() : "name".tr(),
                ),
                const SizedBox(height: 20),
                Text(
                  "about_me".tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: CustomColors.whiteSecondary,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 10),

                const SocialMediaPush(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row nameText(BuildContext context, String text1, String text2) {
    final isAmharic = context.locale.languageCode == 'am';
    final String name = isAmharic ? text1 : text2;
    final String withName = isAmharic ? text2 : text1;

    if (isAmharic) {
      return Row(
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              color: CustomColors.yellowPrimary,
              fontFamily: "SorpantRegular",
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            withName,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 13,
              color: CustomColors.whitePrimary,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Text(
            withName,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 14,
              color: CustomColors.whitePrimary,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 24,
              color: CustomColors.yellowPrimary,
            ),
          ),
        ],
      );
    }
  }
}
