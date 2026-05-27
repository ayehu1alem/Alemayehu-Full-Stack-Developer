import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/skills_items.dart';

class SkillsCard extends StatefulWidget {
  const SkillsCard({super.key});

  @override
  State<SkillsCard> createState() => _SkillsCardState();
}

class _SkillsCardState extends State<SkillsCard> {
  int hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      // Increased slightly for breathing room during animation scales
      runSpacing: 12,
      children: [
        for (int i = 0; i < skillsItems.length; i++) ...[
          // 1. Detect mouse hover states
          InkWell(
            onTap: () {},
            // Essential to make desktop hover trigger reliably
            hoverColor: Colors.transparent,
            // Keeps the custom AnimatedContainer decoration clean
            splashColor: Colors.transparent,
            onHover: (isHovered) {
              setState(() {
                hoveredIndex = isHovered ? i : -1;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutCubic,
              // Smooth deceleration curve
              // 2. Micro-scaling: Lift up the hovered item slightly
              transform: hoveredIndex == i
                  ? (Matrix4.identity()..translate(0, -4, 0))
                  : Matrix4.identity(),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                // 3. Smooth color background switch
                color: hoveredIndex == i
                    ? CustomColors.yellowPrimary.withOpacity(0.15)
                    : CustomColors.bgLight2,
                borderRadius: BorderRadius.circular(20),
                // 4. Smooth glowing border addition on hover
                border: Border.all(
                  color: hoveredIndex == i
                      ? CustomColors.yellowPrimary
                      : Colors.transparent,
                  width: 1.5,
                ),
                boxShadow: [
                  if (hoveredIndex == i)
                    BoxShadow(
                      color: CustomColors.yellowPrimary.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(skillsItems[i]["img"], width: 24, height: 24),
                  const SizedBox(width: 10),
                  Text(
                    skillsItems[i]["title"],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      // 5. Text color highlights dynamically on hover
                      color: hoveredIndex == i
                          ? CustomColors.yellowPrimary
                          : CustomColors.whitePrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
