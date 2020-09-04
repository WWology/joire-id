import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final double space;
  final int index;
  final bool isActive;
  CategoryItem({Key key, this.isActive, this.index, this.imagePath, this.space})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: space),
      child: Column(
        children: [
          isActive
              ? Container(height: 80, width: 80, child: Image.asset(imagePath))
              : Container(
                  height: 50,
                  width: 50,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.grey,
                      BlendMode.modulate,
                    ),
                    child: Image.asset(imagePath),
                  ),
                ),
        ],
      ),
    );
  }
}
