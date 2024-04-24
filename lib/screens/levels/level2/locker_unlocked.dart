import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/components/custom_button.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LockerUnlocked extends StatelessWidget {
  const LockerUnlocked({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary_3,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primary_3,
          centerTitle: true,
          title: CustomButton(
            buttonText: 'Home',
            buttonHeight: 0.06,
            buttonWidth: 0.2,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SpacingConsts().mediumHeightBetweenFields(context),
            Container(
              width: MediaQuery.of(context).size.width * 0.88,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.01),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: const AutoSizeText(
                'And the antidote is yours now... You have saved your life, but can you escape??',
                maxLines: 3,
                style: TextStyle(
                    fontFamily: 'Kod', color: Colors.black, fontSize: 25.0),
              ),
            ),
            SpacingConsts().mediumHeightBetweenFields(context),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.88,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage(
                          'assets/carousel/level_2_carousel_after/level_2_after.jpg'),
                      fit: BoxFit.cover)),
            ),
          ]),
        ),
      ),
    );
  }
}
