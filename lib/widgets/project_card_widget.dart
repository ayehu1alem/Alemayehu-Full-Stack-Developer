import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/project_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key, required this.project});

  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    late final screenSize = MediaQuery.of(context).size;
    late final screenWidth = screenSize.width;
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 290,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: CustomColors.bgLight2,
      ),
      child: InkWell(
        onTap: () {}, // Required to enable hover effect
        hoverColor: CustomColors.yellowPrimary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              project.image,
              height: 140,
              width: 350,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
              child: Text(
                project.title,
                style: const TextStyle(
                  color: CustomColors.whiteSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Text(
                project.subtitle,
                style: const TextStyle(
                  color: CustomColors.whitePrimary,
                  fontSize: 12,
                ),
              ),
            ),
            const Spacer(),

            Container(
              color: CustomColors.bgLight1,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

              child: Row(
                children: [
                  Text(
                    "text_available".tr(),
                    style: TextStyle(
                      color: CustomColors.yellowSecondary,
                      fontSize: 10,
                    ),
                  ),
                  const Spacer(),

                  if (project.webLink != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: InkWell(
                        onTap: () async {
                          final Uri url = Uri.parse(project.webLink!);
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: Image.asset(
                          "assets/images/icons/website.png",
                          width: 17,
                        ),
                      ),
                    ),

                  if (project.androidLink != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: InkWell(
                        onTap: () async {
                          final Uri url = Uri.parse(project.androidLink!);
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        hoverColor: CustomColors.yellowPrimary,
                        child: Image.asset(
                          "assets/images/icons/android.png",
                          width: 19,
                        ),
                      ),
                    ),

                  if (project.iosLink != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: InkWell(
                        onTap: () async {
                          final Uri url = Uri.parse(project.iosLink!);
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: Image.asset(
                          "assets/images/icons/ios.png",
                          width: 17,
                        ),
                      ),
                    ),

                  if (project.sourceCode != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: InkWell(
                        onTap: () async {
                          final Uri url = Uri.parse(project.sourceCode!);
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: Image.asset(
                          "assets/images/icons/github.png",
                          width: 17,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
