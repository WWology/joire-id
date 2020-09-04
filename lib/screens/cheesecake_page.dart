import 'package:flutter/material.dart';

import 'package:joire_id/constants.dart';

class CheeseCakePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          heightFactor: 1.2,
          child: Container(
            height: 400,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kMainThemeColour,
            ),
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image:
                          AssetImage('assets/images/StrawberryCheesecake.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 8, bottom: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Strawberry Cheesecake",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        color: kBlackColour,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Available sizes",
                      style: TextStyle(
                        color: kBlackColour,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: kWhiteColour),
                        child: Text(
                          "D16",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kBlackColour,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: kWhiteColour),
                        child: Text(
                          "D20",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kBlackColour,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
