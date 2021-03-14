import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        bottom: 10,
      ),
      // ignore: sized_box_for_whitespace
      child: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              splashRadius: 1,
              splashColor: Colors.transparent,
              icon: const Icon(
                FeatherIcons.linkedin,
                size: 16,
              ),
              onPressed: () {},
            ),
            IconButton(
              splashRadius: 1,
              splashColor: Colors.transparent,
              icon: const Icon(
                FeatherIcons.twitter,
                size: 16,
              ),
              onPressed: () {},
            ),
            IconButton(
              splashRadius: 1,
              splashColor: Colors.transparent,
              icon: const Icon(
                FeatherIcons.github,
                size: 16,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
