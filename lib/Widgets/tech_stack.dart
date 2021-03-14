import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Helper/screen_helper.dart';
import 'package:portfolio/ModelClass/skill.dart';
import 'package:portfolio/ModelClass/theme_provider.dart';
import 'package:portfolio/constants.dart';
import 'package:provider/provider.dart';

import 'level2_text_body.dart';

List<Skill> skills = [
  Skill(
    skill: "Dart",
    percentage: 60,
  ),
  Skill(
    skill: "Javascript",
    percentage: 70,
  ),
  Skill(
    skill: "PHP",
    percentage: 40,
  ),
  Skill(
    skill: "Node",
    percentage: 60,
  ),
  Skill(
    skill: "Deno",
    percentage: 50,
  ),
  Skill(
    skill: "GoLang",
    percentage: 40,
  ),
];

class SkillSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    final DarkThemeProvider _theme = Provider.of<DarkThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 12,
        bottom: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextBody(
            text1: "My ",
            text2: "Skills 💻 💼️",
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: skills
                .map(
                  (skill) => Container(
                    margin: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: skill.percentage,
                          child: Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            alignment: Alignment.centerLeft,
                            height: 38.0,
                            color: Colors.white,
                            child: Text(
                              skill.skill,
                              style: GoogleFonts.poppins(
                                color: _theme.darkTheme == true
                                    ? Colors.black
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          // remaining (blank part)
                          flex: 100 - skill.percentage,
                          child: Divider(
                            color: _theme.darkTheme == true
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "${skill.percentage}%",
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            color: _theme.darkTheme == true
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
