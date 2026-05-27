import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/skills_items.dart';

class ServicesMobile extends StatelessWidget {
  const ServicesMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: screenWidth / 1.1),
      child: Column(
        children: [
          Text(
            "text_two".tr(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: CustomColors.whiteSecondary,
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 15),

          // Mobile friendly clean list layout entries
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMobileBullet("text_android".tr()),
                _buildMobileBullet("text_ios".tr()),
                _buildMobileBullet("text_desktop".tr()),
                _buildMobileBullet("text_web".tr()),
              ],
            ),
          ),

          const SizedBox(height: 20),
          for (int i = 0; i < platformItems.length; i++)
            Padding(
              padding: const EdgeInsets.all(5.0),
              // Adds crisp spacing around each item block
              child: Material(
                color: CustomColors.bgLight2,
                // Move the background color here
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAlias,
                // Ensures the splash/hover matches the rounded edges
                child: InkWell(
                  onTap: () {},
                  // Triggers the gesture layer
                  hoverColor: CustomColors.yellowPrimary,
                  // Tint the container on hover
                  splashColor: CustomColors.yellowSecondary,
                  child: SizedBox(
                    width: 300,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      leading: Image.asset(platformItems[i]["img"], width: 26),
                      title: Text(
                        platformItems[i]["title"].toString().tr(),
                        style: const TextStyle(
                          color: CustomColors.whiteSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMobileBullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(
            Icons.star_border,
            color: CustomColors.yellowPrimary,
            size: 18,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: CustomColors.whitePrimary,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
