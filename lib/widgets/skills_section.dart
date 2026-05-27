import 'package:flutter/cupertino.dart';
import 'package:portfolio/widgets/skills_desktop.dart';
import 'package:portfolio/widgets/skills_mobile.dart';

import '../constants/colors.dart';
import '../constants/size.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    late final screenSize = MediaQuery.of(context).size;
    late final screenWidth = screenSize.width;
    return Container(
      width: screenWidth,
      color: CustomColors.scaffoldBd,
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 60),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "ሙያዊ ልምዶች",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: CustomColors.whiteSecondary,
            ),
          ),
          const SizedBox(height: 50),
          screenWidth >= axMediumDesktopWidth
              ? const SkillsDesktop()
              : const SkillsMobile(),
        ],
      ),
    );
  }
}
