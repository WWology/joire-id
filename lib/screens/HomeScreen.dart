import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:joire_id/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    List categories = [
      {
        'imagePath': 'assets/Icons/CheeseCake.png',
        'space': screenHeight / 10,
      },
      {
        'imagePath': 'assets/Icons/Jars.png',
        'space': screenHeight / 10,
      },
      {
        'imagePath': 'assets/Icons/MilkBrownies.png',
        'space': screenHeight / 10,
      },
      {
        'imagePath': 'assets/Icons/Bombolini.png',
        'space': screenHeight / 10,
      },
    ];

    List isSelected = [true, false, false, false];

    return Scaffold(
      key: _scaffoldKey,
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
                Align(
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight / 30),
                    child: Material(
                      color: kMainThemeColour,
                      child: IconButton(
                        icon: Icon(Icons.search),
                        splashRadius: 30,
                        splashColor: Colors.transparent,
                        iconSize: 40,
                        onPressed: () {},
                      ),
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
                        return CategoryItem(
                          imagePath: categories[index]['imagePath'],
                          space: categories[index]['space'],
                        );
                      }),
                )
              ],
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    _openEndDrawer();
                  },
                  child: Container(
                      height: screenHeight / 6,
                      width: screenWidth - 60,
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/JoireLogo.png')),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CategoryItem extends StatefulWidget {
  final String imagePath;
  final double space;
  CategoryItem({Key key, this.imagePath, this.space}) : super(key: key);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool isActive;
  @override
  void initState() {
    isActive = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isActive
            ? setState(() {
                isActive = false;
              })
            : setState(() {
                isActive = true;
              });
      },
      child: Padding(
        padding: EdgeInsets.only(top: widget.space),
        child: Column(
          children: [
            isActive
                ? Container(
                    height: 80, width: 80, child: Image.asset(widget.imagePath))
                : Container(
                    height: 50,
                    width: 50,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.grey,
                        BlendMode.modulate,
                      ),
                      child: Image.asset(widget.imagePath),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
