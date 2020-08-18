import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:joire_id/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: Drawer(),
      body: Row(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth / 8,
            color: kMainThemeColour,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: InkWell(
                    child: IconButton(
                      icon: Image.asset('assets/Icons/MenuButton.png'),
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    iconSize: 50,
                    onPressed: () {},
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 100),
                  // To make the text Vertical, Rotated Box Quarter Turns 3
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: DefaultTabController(
                      length: 4,
                      child: Row(
                        children: [
                          CategoryItem(
                            imagePath: "assets/Icons/Bombolini.png",
                            isActive: false,
                            press: () {},
                            space: 80,
                          ),
                          CategoryItem(
                            imagePath: "assets/Icons/MilkBrownies.png",
                            isActive: false,
                            press: () {},
                            space: 80,
                          ),
                          CategoryItem(
                            imagePath: "assets/Icons/Jars.png",
                            isActive: false,
                            press: () {},
                            space: 80,
                          ),
                          CategoryItem(
                            imagePath: "assets/Icons/CheeseCake.png",
                            isActive: true,
                            press: () {},
                            space: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    height: 100,
                    width: 400,
                    alignment: Alignment.centerRight,
                    child: Image.asset('assets/JoireLogo.png')),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final bool isActive;
  final Function press;
  final double space;
  const CategoryItem(
      {Key key, this.imagePath, this.isActive, this.press, this.space})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.only(right: space),
        child: Column(
          children: [
            RotatedBox(
              quarterTurns: 1,
              child: isActive
                  ? Container(
                      height: 50, width: 50, child: Image.asset(imagePath))
                  : Container(
                      height: 35,
                      width: 35,
                      child: Image.asset(imagePath),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
