import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:flutter/material.dart';

class LoginComponent {
  Widget basicComp(
      num? width, num? height, double? fontSize, BuildContext context) {
    width = width ?? 0.7;
    height = height ?? 0.25;
    fontSize = fontSize ?? 30.0;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpacingConsts().largeHeightBetweenFields(context),
          Center(
            child: AutoSizeText(
              'Cypher Affair',
              maxLines: 1,
              style: TextStyle(
                  fontFamily: 'Legio', fontSize: fontSize, color: Colors.amber),
            ),
          ),
          SpacingConsts().smallHeightBetweenFields(context),
          SizedBox(
            width: MediaQuery.of(context).size.width * width,
            height: MediaQuery.of(context).size.height * height,
            child: Image.asset('assets/login.png'),
          )
        ],
      ),
    );
  }
}
