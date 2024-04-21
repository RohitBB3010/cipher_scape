import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/screens/levels/level_1/level_1_page.dart';
import 'package:flutter/material.dart';

class Level1Carousel extends StatefulWidget {
  const Level1Carousel({super.key});

  @override
  State<Level1Carousel> createState() => _Level1CarouselState();
}

class _Level1CarouselState extends State<Level1Carousel> {
  List<int> levels = [1, 2, 3, 4, 5, 6, 7, 8];
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: primary_3,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        leading: ElevatedButton(
            onPressed: () {
              buttonCarouselController.previousPage();
            },
            child: AutoSizeText('Previous')),
        title: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Level1Page()));
            },
            child: AutoSizeText('Skip')),
        centerTitle: true,
        actions: [
          ElevatedButton(
              onPressed: () {
                buttonCarouselController.nextPage();
              },
              child: AutoSizeText('Next')),
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: CarouselSlider(
          items: levels.map((carouselItem) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/carousel/level_1_carousel/slide_$carouselItem.png'),
                      fit: BoxFit.fill)),
            );
          }).toList(),
          carouselController: buttonCarouselController,
          options: CarouselOptions(
              autoPlay: true,
              height: MediaQuery.of(context).size.height,
              enableInfiniteScroll: false,
              viewportFraction: 1,
              reverse: false,
              autoPlayInterval: const Duration(milliseconds: 10000),
              aspectRatio: MediaQuery.of(context).size.width /
                  MediaQuery.of(context).size.height,
              enlargeCenterPage: false,
              padEnds: false),
        ),
      ),
    ));
  }
}
