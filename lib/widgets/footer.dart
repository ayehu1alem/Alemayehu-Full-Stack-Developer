import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/social_media_push.dart';

import '../constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: CustomColors.scaffoldBd,
      width: double.maxFinite,
      alignment: Alignment.center,
      child: Column(
        children: [
          const Divider(
            color: CustomColors.yellowPrimary,
            thickness: 3.5,
            height: 50,
          ),

          const SocialMediaPush(),
          const SizedBox(height: 50),
          Text(
            "text_right".tr(),
            style: TextStyle(
              color: CustomColors.whitePrimary,
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
