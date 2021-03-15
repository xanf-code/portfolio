import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/Widgets/appbar.dart';
import 'package:portfolio/Widgets/footer.dart';
import 'package:portfolio/Widgets/leve2_body.dart';
import 'package:portfolio/Widgets/level1_body.dart';
import 'package:portfolio/Widgets/level2_text_body.dart';
import 'package:portfolio/Widgets/tech_stack.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

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
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          AppBarWidget(),
          Level1Body(),
          SkillSection(),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: TextBody(
              text1: "My ",
              text2: "Projects 💻 🖊️",
            ),
          ),
          Level2Body(),
          Footer(),
        ],
      ),
    );
  }
}
