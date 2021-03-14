import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBody extends StatelessWidget {
  final String text1;
  final String text2;

  const TextBody({Key key, this.text1, this.text2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
        top: 6,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Text(
              text1,
              style: GoogleFonts.poppins(
                fontSize: 18,
              ),
            ),
            Text(
              text2,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
