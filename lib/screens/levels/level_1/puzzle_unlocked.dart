import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/components/custom_button.dart';
import 'package:cipher_affair/consts/assets_consts.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/level_strings.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class PuzzleUnlocked extends StatelessWidget {
  const PuzzleUnlocked({super.key});

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
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02,
                    vertical: MediaQuery.of(context).size.height * 0.01),
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: LevelStrings().level1After.map((stringItem) {
                    return AutoSizeText(
                      stringItem,
                      style: const TextStyle(fontSize: 15.0, fontFamily: 'Kod'),
                    );
                  }).toList(),
                ),
              ),
              SpacingConsts().smallHeightBetweenFields(context),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: Image.asset(
                  AssetConsts().level1AfterAssets.first,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
