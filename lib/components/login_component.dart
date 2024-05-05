import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cipher_affair/consts/assets_consts.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
              'Cypher Scape',
              maxLines: 1,
              style: TextStyle(
                  fontFamily: 'Legio', fontSize: fontSize, color: Colors.amber),
            ),
          ),
          SpacingConsts().smallHeightBetweenFields(context),
          loginCarousel(context),
        ],
      ),
    );
  }

  Widget loginCarousel(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.4,
      child: CarouselSlider(
        items: AssetConsts().loginCarousel.map((e) {
          return Image.asset(e);
        }).toList(),
        options: CarouselOptions(
          autoPlay: true,
          height: MediaQuery.of(context).size.height,
          enableInfiniteScroll: true,
          viewportFraction: 1,
          autoPlayInterval: const Duration(milliseconds: 1000),
          aspectRatio: MediaQuery.of(context).size.width /
              MediaQuery.of(context).size.height,
          enlargeCenterPage: false,
          padEnds: false,
        ),
      ),
    );
  }
}
