import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:portfolio/ModelClass/theme_provider.dart';
import 'package:provider/provider.dart';

class Level3 extends StatelessWidget {
  @override
  List skills = [
    {
      "name": "Javascript",
      "percent": 0.75,
      "text": "7",
    },
    {
      "name": "Kotlin",
      "percent": 0.7,
      "text": "7",
    },
    {
      "name": "Android",
      "percent": 0.75,
      "text": "6",
    },
    {
      "name": "SQL",
      "percent": 0.80,
      "text": "8",
    },
    {
      "name": "Ktor",
      "percent": 0.60,
      "text": "6",
    },
    {
      "name": "Ruby",
      "percent": 0.60,
      "text": "6",
    },
    {
      "name": "Node",
      "percent": 0.85,
      "text": "8",
    },
    {
      "name": "MongoDB",
      "percent": 0.85,
      "text": "8",
    },
    {
      "name": "React",
      "percent": 0.75,
      "text": "7",
    },
    {
      "name": "Flutter",
      "percent": 0.8,
      "text": "8",
    },
  ];
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      height: 380,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: skills.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularPercentIndicator(
                radius: 55.0,
                percent: double.parse(skills[index]["percent"].toString()),
                center: Text(skills[index]["text"].toString()),
                progressColor:
                    themeChange.darkTheme == true ? Colors.white : Colors.black,
                backgroundColor:
                    themeChange.darkTheme == true ? Colors.black : Colors.white,
                animation: true,
                animationDuration: 1000,
              ),
              Text(
                skills[index]["name"].toString(),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
