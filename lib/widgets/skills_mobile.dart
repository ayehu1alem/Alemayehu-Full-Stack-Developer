import 'package:flutter/material.dart';
import 'package:portfolio/widgets/skills_card.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 50),

            child: SkillsCard(),
          ),
        ],
      ),
    );
  }
}
