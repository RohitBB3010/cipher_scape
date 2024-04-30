import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/components/custom_button.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/level_strings.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:flutter/material.dart';

class LevelCompleted extends StatelessWidget {
  const LevelCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary_3,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.amber,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SpacingConsts().smallHeightBetweenFields(context),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image.asset('assets/level_assets/l3_a/l3_a1.jpeg'),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.26,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.02),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: LevelStrings().level3After.first.map((e) {
                          return AutoSizeText(
                            e,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontFamily: 'Kod'),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SpacingConsts().smallHeightBetweenFields(context),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.3,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.02),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: LevelStrings().level3After[1].map((e) {
                          return AutoSizeText(
                            e,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontFamily: 'Kod'),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image.asset('assets/level_assets/l3_a/l3_a2.jpeg'),
                    ),
                  ],
                ),
                SpacingConsts().smallHeightBetweenFields(context),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image.asset('assets/level_assets/l3_a/l3_a3.jpeg'),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.3,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.02),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: LevelStrings().level3After[2].map((e) {
                          return AutoSizeText(
                            e,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontFamily: 'Kod'),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SpacingConsts().mediumHeightBetweenFields(context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: LevelStrings().level3After[3].map((e) {
                      return AutoSizeText(
                        e,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontFamily: 'Kod'),
                      );
                    }).toList(),
                  ),
                ),
                SpacingConsts().smallHeightBetweenFields(context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset('assets/level_assets/l3_a/l3_a4.jpeg'),
                ),
                SpacingConsts().smallHeightBetweenFields(context),
                const AutoSizeText(
                  'TO BE CONTINUED...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Kod', color: Colors.white, fontSize: 30),
                ),
                SpacingConsts().smallHeightBetweenFields(context),
                CustomButton(
                  buttonText: 'GO TO HOME PAGE',
                  buttonHeight: 0.07,
                  buttonWidth: 0.7,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
                SpacingConsts().mediumHeightBetweenFields(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
