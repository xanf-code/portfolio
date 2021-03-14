import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/ModelClass/theme_provider.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    // ignore: sized_box_for_whitespace
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Placeholder(
            fallbackWidth: 50,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => debugPrint("sadsa"),
                child: const AppBarNav(
                  text: "Home",
                ),
              ),
              const AppBarNav(
                text: "Playlists",
              ),
              //TO-DO THEME MANAGEMENT
              Checkbox(
                value: themeChange.darkTheme,
                onChanged: (bool value) {
                  themeChange.darkTheme = value;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppBarNav extends StatelessWidget {
  final String text;
  const AppBarNav({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}
