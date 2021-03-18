import 'package:cached_network_image/cached_network_image.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:portfolio/ModelClass/theme_provider.dart';
import 'package:portfolio/Widgets/appbar.dart';
import 'package:portfolio/Widgets/footer.dart';
import 'package:portfolio/Widgets/leve2_body.dart';
import 'package:portfolio/Widgets/level1_body.dart';
import 'package:portfolio/Widgets/level2_text_body.dart';
import 'package:portfolio/Widgets/level3_body.dart';
import 'package:portfolio/Widgets/my_behaviour.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vrouter/vrouter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      // ignore: sized_box_for_whitespace
      drawer: Container(
        width: 60,
        child: Drawer(
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  launch("mailto:darshanaswath@gmail.com");
                },
                child: NavButtons(
                  themeChange: themeChange,
                  icons: FeatherIcons.mail,
                ),
              ),
              GestureDetector(
                onTap: () {
                  VRouterData.of(context).pushNamed(
                    'playlist',
                  );
                },
                child: NavButtons(
                  themeChange: themeChange,
                  icons: FeatherIcons.music,
                ),
              ),
              GestureDetector(
                onTap: () {
                  VRouterData.of(context).pushNamed(
                    'certificates',
                  );
                },
                child: NavButtons(
                  themeChange: themeChange,
                  icons: FeatherIcons.award,
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        leading: Visibility(
          // ignore: avoid_bool_literals_in_conditional_expressions
          visible: MediaQuery.of(context).size.width < 800 ? true : false,
          child: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: IconButton(
                  icon: const Icon(FeatherIcons.alignLeft),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              );
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Row(
              children: [
                if (MediaQuery.of(context).size.width > 800)
                  GestureDetector(
                    onTap: () {
                      VRouterData.of(context).pushNamed(
                        'playlist',
                      );
                    },
                    child: const AppBarNav(
                      text: "Playlists",
                    ),
                  ),
                SizedBox(
                  width: 60,
                  child: DayNightSwitcher(
                    isDarkModeEnabled: themeChange.darkTheme,
                    onStateChanged: (isDarkModeEnabled) {
                      setState(
                        () {
                          themeChange.darkTheme = isDarkModeEnabled;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: _getChild(),
    );
  }

  Widget _getChild() {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView(
        children: [
          DelayedDisplay(
            delay: const Duration(seconds: 1),
            slidingBeginOffset: const Offset(1, 0),
            child: Level1Body(),
          ),
          if (MediaQuery.of(context).size.width < 800)
            const DelayedDisplay(
              delay: Duration(seconds: 1),
              child: Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextBody(
                  text1: "My ",
                  text2: "Skills 🪄🪄️",
                ),
              ),
            ),
          if (MediaQuery.of(context).size.width < 800)
            DelayedDisplay(
              delay: const Duration(seconds: 1),
              slidingBeginOffset: const Offset(-1, 0),
              child: Level3(),
            ),
          const DelayedDisplay(
            delay: Duration(seconds: 1),
            child: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: TextBody(
                text1: "My ",
                text2: "Projects 💻 🖊️",
              ),
            ),
          ),
          DelayedDisplay(
            delay: const Duration(seconds: 1),
            slidingBeginOffset: const Offset(-1, 0),
            child: Level2Body(),
          ),
          Footer(),
        ],
      ),
    );
  }
}

class NavButtons extends StatelessWidget {
  const NavButtons({
    Key key,
    @required this.themeChange,
    this.icons,
  }) : super(key: key);

  final DarkThemeProvider themeChange;
  final IconData icons;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // ignore: sized_box_for_whitespace
      child: Container(
        width: 60,
        height: 45,
        decoration: BoxDecoration(
          color: themeChange.darkTheme == true ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Icon(
            icons,
            color: themeChange.darkTheme == true ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
