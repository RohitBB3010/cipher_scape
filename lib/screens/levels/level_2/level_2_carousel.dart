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
import 'package:just_audio/just_audio.dart';

// class Level2Carousel extends StatefulWidget {
//   const Level2Carousel({super.key});

//   @override
//   State<Level2Carousel> createState() => _Level2CarouselState();
// }

// class _Level2CarouselState extends State<Level2Carousel> {
//   List<int> levels = [1, 2];
//   CarouselController buttonCarouselController = CarouselController();
//   int currentPage = 0;
//   late AudioPlayer audioPlayer;

//   @override
//   void initState() {
//     super.initState();
//     audioPlayer = AudioPlayer()..setAsset('assets/music/backgroundMusic.mp3');
//     audioPlayer.play();
//   }

//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: primary_3,
//       appBar: AppBar(
//         toolbarHeight: MediaQuery.of(context).size.height * 0.08,
//         leadingWidth: MediaQuery.of(context).size.width,
//         leading: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CustomIconButton(
//               iconData: Icons.arrow_back,
//               width: 0.2,
//               height: 0.05,
//               onPressed: () {
//                 buttonCarouselController.previousPage();
//               },
//             ),
//             CustomButton(
//               buttonHeight: 0.05,
//               buttonWidth: 0.3,
//               buttonText: currentPage == 1 ? 'Start' : 'Skip',
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const Level2Page()));
//               },
//             ),
//             CustomIconButton(
//               iconData: Icons.arrow_forward,
//               width: 0.2,
//               height: 0.05,
//               onPressed: () {
//                 buttonCarouselController.nextPage();
//               },
//             )
//           ],
//         ),
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(10),
//                 bottomRight: Radius.circular(10))),
//         backgroundColor: Colors.amber,
//       ),
//       body: Container(
//         child: CarouselSlider(
//           items: levels.map((carouselItem) {
//             return Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * 0.6,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage(
//                           'assets/carousel/level_2_carousel_before/Level_2_Before_$carouselItem.png'),
//                       fit: BoxFit.fill)),
//             );
//           }).toList(),
//           carouselController: buttonCarouselController,
//           options: CarouselOptions(
//               onPageChanged: (index, reason) {
//                 currentPage = index;
//                 setState(() {});
//               },
//               autoPlay: true,
//               height: MediaQuery.of(context).size.height,
//               enableInfiniteScroll: false,
//               viewportFraction: 1,
//               reverse: false,
//               autoPlayInterval: const Duration(milliseconds: 10000),
//               aspectRatio: MediaQuery.of(context).size.width /
//                   MediaQuery.of(context).size.height,
//               enlargeCenterPage: false,
//               padEnds: false),
//         ),
//       ),
//     ));
//   }
// }

class Level2Carousel extends StatefulWidget {
  const Level2Carousel({super.key});

  @override
  State<Level2Carousel> createState() => _Level2CarouselState();
}

class _Level2CarouselState extends State<Level2Carousel> {
  CarouselController buttonCarouselController = CarouselController();
  int currentPage = 0;

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
                buttonText: currentPage == 1 ? 'Start' : 'Skip',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Level2Page()));
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
            items: LevelStrings().level2Before.map((carouselItem) {
              return carouselItemWidget(
                  carouselItem, AssetConsts().level2BeforeAssets[currentPage]);
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
                autoPlayInterval: const Duration(milliseconds: 10000),
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
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.height * 0.01),
          height: MediaQuery.of(context).size.height * 0.2,
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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        )
      ],
    );
  }
}
