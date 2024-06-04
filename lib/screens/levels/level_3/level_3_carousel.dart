import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cipher_affair/components/custom_button.dart';
import 'package:cipher_affair/components/custom_icon_button.dart';
import 'package:cipher_affair/consts/assets_consts.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/level_strings.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:cipher_affair/screens/levels/level_2/level_2_page.dart';
import 'package:flutter/material.dart';

import 'level_3_page.dart';

class Level3Carousel extends StatefulWidget {
  const Level3Carousel({super.key});

  @override
  State<Level3Carousel> createState() => _Level3CarouselState();
}

class _Level3CarouselState extends State<Level3Carousel> {
  int currentPage = 0;
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary_3,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          leadingWidth: MediaQuery.of(context).size.width,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                iconData: Icons.arrow_back,
                width: 0.2,
                height: 0.05,
                onPressed: () {
                  buttonCarouselController.previousPage();
                },
              ),
              CustomButton(
                buttonHeight: 0.05,
                buttonWidth: 0.3,
                buttonText: currentPage == 2 ? 'Start' : 'Skip',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Level3Page()));
                },
              ),
              CustomIconButton(
                iconData: Icons.arrow_forward,
                width: 0.2,
                height: 0.05,
                onPressed: () {
                  buttonCarouselController.nextPage();
                },
              )
            ],
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          backgroundColor: Colors.amber,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.05),
          child: CarouselSlider(
            carouselController: buttonCarouselController,
            items: LevelStrings().level3Before.map((carouselItem) {
              return carouselItemWidget(
                  carouselItem, AssetConsts().level3BeforeAssets[currentPage]);
            }).toList(),
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  currentPage = index;
                  setState(() {});
                },
                autoPlay: true,
                height: MediaQuery.of(context).size.height,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                reverse: false,
                autoPlayInterval: const Duration(milliseconds: 15000),
                aspectRatio: MediaQuery.of(context).size.width /
                    MediaQuery.of(context).size.height,
                enlargeCenterPage: false,
                padEnds: false),
          ),
        ),
      ),
    );
  }

  Widget carouselItemWidget(List<String> itemStrings, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.height * 0.01),
          height: imagePath.isNotEmpty
              ? MediaQuery.of(context).size.height * 0.35
              : MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
              color: Colors.white, border: Border.all(color: Colors.black)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: itemStrings.map((stringItem) {
              return AutoSizeText(
                stringItem,
                maxLines: 3,
                style: const TextStyle(fontFamily: 'Kod', fontSize: 15.0),
              );
            }).toList(),
          ),
        ),
        SpacingConsts().smallHeightBetweenFields(context),
        if (imagePath.isNotEmpty)
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          )
      ],
    );
  }
}