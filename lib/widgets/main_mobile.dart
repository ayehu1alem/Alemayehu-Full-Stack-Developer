import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/social_media_push.dart';

import '../constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isAmharic = context.locale.languageCode == 'am';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image scales gracefully to mobile device width bounds
          Image.asset(
            "assets/images/home.png",
            width: screenWidth * 0.8,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 30),

          // Bottom: Structured Text Context info stacked safely down the layout column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "text_welcome".tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: CustomColors.whiteSecondary,
                ),
              ),
              const SizedBox(height: 3),
              nameText(
                context,
                isAmharic ? "name".tr() : "text_one".tr(),
                isAmharic ? "text_one".tr() : "name".tr(),
              ),
              const SizedBox(height: 15),
              Text(
                "about_me".tr(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: CustomColors.whiteSecondary,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 10),

              const Center(child: SocialMediaPush()),
            ],
          ),
        ],
      ),
    );
  }

  Row nameText(BuildContext context, String text1, String text2) {
    final isAmharic = context.locale.languageCode == 'am';
    final String name = isAmharic ? text1 : text2;
    final String withName = isAmharic ? text2 : text1;
    //final Text nameReturn = ;
    // final Text withNameReturn = ;

    if (isAmharic) {
      return Row(
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              color: CustomColors.yellowPrimary,
              fontFamily: "SorpantRegular",
              wordSpacing: 2.5,
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
