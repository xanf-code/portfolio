import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      child: SelectableText(
        text,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}
