import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/skills_items.dart';

class ServicesDesktop extends StatelessWidget {
  const ServicesDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 650),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              // Combining intro statement with bullets safely inside a vertical column
              Text(
                "text_two".tr(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: CustomColors.whiteSecondary,
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 15),

              // Bullet points listed vertically
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBulletPoint("text_android".tr()),
                    _buildBulletPoint("text_ios".tr()),
                    _buildBulletPoint("text_desktop".tr()),
                    _buildBulletPoint("text_web".tr()),
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
                      // Adds a nice click splash
                      child: SizedBox(
                        width: 300,
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          leading: Image.asset(
                            platformItems[i]["img"],
                            width: 26,
                          ),
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
        ),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
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
