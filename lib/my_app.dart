import 'package:fancy_cursor/fancy_cursor.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Home/certification.dart';
import 'package:portfolio/Home/contact_page.dart';
import 'package:portfolio/Home/home.dart';
import 'package:portfolio/Home/individual.dart';
import 'package:portfolio/Home/playlist.dart';
import 'package:portfolio/ThemeData/dark_theme_styles.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:vrouter/vrouter.dart';
import 'ModelClass/theme_provider.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  Future getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
          return VRouter(
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            debugShowCheckedModeBanner: false,
            builder: (context, widget) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, widget),
              maxWidth: MediaQuery.of(context).size.width,
              minWidth: 480,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(480, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ],
              background: Container(
                color: const Color(0xFFF5F5F5),
              ),
            ),
            routes: [
              VStacked(
                path: '/',
                widget: FancyCursor(
                  size: 12,
                  color: Colors.yellow,
                  delay: const Duration(milliseconds: 700),
                  child: HomePage(),
                ),
              ),
              VStacked(
                path: '/project/:id/:title',
                widget: FancyCursor(
                  size: 12,
                  color: Colors.yellow,
                  delay: const Duration(milliseconds: 700),
                  child: IndividualPosts(),
                ),
                buildTransition: (animation1, _, child) => ScaleTransition(
                  scale: animation1,
                  child: child,
                ),
                transitionDuration: const Duration(milliseconds: 100),
                name: 'projects',
                aliases: ['/projects'],
              ),
              VStacked(
                path: '/contact',
                widget: FancyCursor(
                  size: 12,
                  color: Colors.yellow,
                  delay: const Duration(milliseconds: 700),
                  child: ContactPage(),
                ),
                name: 'contact',
              ),
              VStacked(
                path: '/playlist',
                widget: FancyCursor(
                  size: 12,
                  color: Colors.yellow,
                  delay: const Duration(milliseconds: 700),
                  child: PlayListPage(),
                ),
                name: 'playlist',
              ),
              VStacked(
                path: '/certificates',
                widget: FancyCursor(
                  size: 12,
                  color: Colors.yellow,
                  delay: const Duration(milliseconds: 700),
                  child: Certification(),
                ),
                name: 'certificates',
              ),
              VRouteRedirector(path: ':_(.*)', redirectTo: '/'),
            ],
          );
        },
      ),
    );
  }
}
