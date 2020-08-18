import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:joire_id/constants.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = [
    "Cheesecake",
    "Jars",
    "Brownies",
    "Others",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: kMainThemeColour,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: IconButton(
                    icon: Image.asset('assets/Icons/MenuButton.png'),
                    onPressed: null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    iconSize: 50,
                    onPressed: null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      "Cheesecake",
                      style: TextStyle(color: kBlackColour),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      "Jars",
                      style: TextStyle(color: kBlackColour),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      "Brownies",
                      style: TextStyle(color: kBlackColour),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      "Others",
                      style: TextStyle(color: kBlackColour),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
