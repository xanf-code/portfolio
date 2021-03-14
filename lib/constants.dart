import 'package:flutter/material.dart';

class Constants {
  String name = "Hi, I'm Darshan 🤘";

  String exp = "Building digital\nproducts, brands, and\nexperience.";

  String longBio =
      "a Designer and Visual Developer in BLR.\nI specialize in UI/UX Design, Web Design, App Development\nand Backend Management.";
}

const Color kPrimaryColor = Color.fromRGBO(21, 181, 114, 1);
const Color kBackgroundColor = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColor = Color.fromRGBO(249, 77, 30, 1);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;
