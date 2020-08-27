import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:joire_id/CategoryItem.dart';
import 'package:joire_id/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController pageController = PageController(viewportFraction: .7);

  List _isSelected = [true, false, false, false];

  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    // Devices ScreenHeight
    var screenHeight = MediaQuery.of(context).size.height;

    // Devices Screenwidth
    var screenWidth = MediaQuery.of(context).size.width;

    // List containing all the categories for the CategoryItem class
    List categories = [
      {
        'imagePath': 'assets/Icons/CheeseCake.png',
        'space': screenHeight / 8,
      },
      {
        'imagePath': 'assets/Icons/Jars.png',
        'space': screenHeight / 8,
      },
      {
        'imagePath': 'assets/Icons/MilkBrownies.png',
        'space': screenHeight / 8,
      },
      {
        'imagePath': 'assets/Icons/Bombolini.png',
        'space': screenHeight / 8,
      },
    ];

    return Scaffold(
      // Used for End Drawer Open
      key: _scaffoldKey,
      endDrawer: Drawer(),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            buildSidemenu(screenHeight, screenWidth, categories),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      _openEndDrawer();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: kBlackColour,
                        ),
                        height: screenHeight / 7,
                        width: screenWidth - 60,
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/JoireLogo.png',
                          scale: 2,
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    height: screenHeight / 1.18,
                    width: screenWidth - 60,
                    child: PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          var previousIndex = _isSelected.indexOf(true);
                          _isSelected[index] = true;

                          if (index != previousIndex) {
                            _isSelected[previousIndex] = false;
                          }
                        });
                      },
                      controller: pageController,
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: kBlackColour,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 10,
                          width: 10,
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildSidemenu(
      double screenHeight, double screenWidth, List categories) {
    return Container(
      height: screenHeight,
      width: screenWidth / 8,
      color: kMainThemeColour,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight / 20),
            child: Material(
              color: kMainThemeColour,
              child: IconButton(
                splashColor: Colors.transparent,
                splashRadius: 30,
                icon: Image.asset('assets/Icons/MenuButton.png'),
                onPressed: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        var previousIndex = _isSelected.indexOf(true);
                        _isSelected[index] = true;

                        if (index != previousIndex) {
                          _isSelected[previousIndex] = false;
                        }
                        pageController.animateToPage(
                          index,
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      });
                    },
                    child: _isSelected[index]
                        ? CategoryItem(
                            isActive: true,
                            index: index,
                            imagePath: categories[index]['imagePath'],
                            space: categories[index]['space'],
                          )
                        : CategoryItem(
                            isActive: false,
                            index: index,
                            imagePath: categories[index]['imagePath'],
                            space: categories[index]['space'],
                          ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
