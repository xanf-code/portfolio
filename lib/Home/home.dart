import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/Widgets/appbar.dart';
import 'package:portfolio/Widgets/footer.dart';
import 'package:portfolio/Widgets/leve2_body.dart';
import 'package:portfolio/Widgets/level1_body.dart';
import 'package:portfolio/Widgets/level2_text_body.dart';
import 'package:portfolio/Widgets/my_behaviour.dart';
import 'package:portfolio/Widgets/tech_stack.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;

  double pixels = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        pixels = _scrollController.position.pixels;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmoothScrollWeb(
        controller: _scrollController,
        child: _getChild(),
      ),
    );
  }

  Widget _getChild() {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            AppBarWidget(),
            Level1Body(),
            SkillSection(),
            AnimatedOpacity(
              opacity: pixels >= 300 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextBody(
                  text1: "My ",
                  text2: "Projects 💻 🖊️",
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: pixels >= 400 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Level2Body(),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
