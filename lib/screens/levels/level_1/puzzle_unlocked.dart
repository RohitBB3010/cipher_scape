import 'package:cipher_affair/components/custom_button.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:flutter/material.dart';
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
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/carousel/level_1_carousel_after/Level_1_After_1.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
