import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<SizedBox> loadingAssets = [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Image.asset('assets/loading_assets/loading_asset1.png'),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Image.asset('assets/loading_assets/loading_asset2.png'),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Image.asset('assets/loading_assets/loading_asset3.png'),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Image.asset('assets/loading_assets/loading_asset4.png'),
      ),
    ];

    return Scaffold(
      backgroundColor: primary_3,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SpacingConsts().customHeightBetweenFields(context, 0.15),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
              ),
              child: const AutoSizeText(
                'Cipher Scape',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Legio', color: Colors.amber, fontSize: 60.0),
              ),
            ),
            SpacingConsts().largeHeightBetweenFields(context),
            CarouselSlider(
                items: loadingAssets,
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(milliseconds: 2000),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                )),
            DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 40.0,
                  color: Colors.amber,
                  fontFamily: 'Kod',
                ),
                child: AnimatedTextKit(
                  pause: const Duration(milliseconds: 2000),
                  repeatForever: true,
                  animatedTexts: [TyperAnimatedText('Loading...')],
                ))
          ],
        ),
      ),
    );
  }
}
