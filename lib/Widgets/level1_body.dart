import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/ModelClass/theme_provider.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class Level1Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DarkThemeProvider _theme = Provider.of<DarkThemeProvider>(context);
    final double height = MediaQuery.of(context).size.height;
    final Constants _constants = Constants();

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      // ignore: sized_box_for_whitespace
      child: Container(
        height: height * 0.67,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(
                "https://raw.githubusercontent.com/xanf-code/MyPortfolio/master/images/DarshanAswath.jpg",
              ),
            ),
            Text(
              _constants.name,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Text(
              _constants.exp,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              _constants.longBio,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              height: 45,
              width: 160,
              decoration: BoxDecoration(
                color: _theme.darkTheme == true ? Colors.white : Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  "CONNECT WITH ME",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color:
                        _theme.darkTheme == true ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
