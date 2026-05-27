import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../constants/colors.dart';
import '../utils/breakpoints.dart';
import '../utils/project_utils.dart';
import 'project_card_widget.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    late final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: context.adaptiveHorizontalPadding.copyWith(top: 20, bottom: 40),
      child: Column(
        children: [
          //Work Projects Title
          Text(
            "text_projects".tr(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: CustomColors.whiteSecondary,
            ),
          ),
          const SizedBox(height: 50),

          //Work Projects Cards
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < projectUtilsList.length; i++)
                  ProjectCardWidget(project: projectUtilsList[i]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
