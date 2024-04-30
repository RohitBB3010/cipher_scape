import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/cipher_functions/playfair_Cipher.dart';
import 'package:cipher_affair/cipher_functions/playfair_cipher.dart';
import 'package:cipher_affair/cipher_functions/vignere_cipher.dart';
import 'package:cipher_affair/components/custom_button.dart';
import 'package:cipher_affair/components/shake_widget.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/list_levels.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:cipher_affair/firebase_functions.dart';
import 'package:cipher_affair/screens/levels/level_3/level_completed.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Level3Page extends StatefulWidget {
  const Level3Page({super.key});

  @override
  State<Level3Page> createState() => _Level3PageState();
}

class _Level3PageState extends State<Level3Page> {
  TextEditingController controller = TextEditingController();
  late String cipherText;
  int lives = 3;
  final shakeKey = GlobalKey<ShakeWidgetState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => infoDialog(context));
    });
    cipherText =
        VigenereCipher().cipheredTextList[Random().nextInt(7)].toUpperCase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary_3,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          automaticallyImplyLeading: false,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          title: CustomButton(
            buttonText: 'Playfair Ciphere',
            color: accent_3,
            buttonHeight: 0.05,
            buttonWidth: 0.4,
            onPressed: () {
              Uri url = Uri.parse(
                  'https://www.geeksforgeeks.org/playfair-cipher-with-examples/');
              launchUrl(url);
            },
          ),
          actions: [
            CustomButton(
              buttonText: 'Quit',
              buttonHeight: 0.05,
              buttonWidth: 0.2,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'Lives : $lives',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.amber, fontFamily: 'Kod', fontSize: 30),
                  ),
                  SpacingConsts().smallHeightBetweenFields(context),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                        vertical: MediaQuery.of(context).size.height * 0.01),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        AutoSizeText(
                          'Cipher Text : $cipherText',
                          textAlign: TextAlign.center,
                          maxLines: 4,
                          style:
                              const TextStyle(fontSize: 20, fontFamily: 'Kod'),
                        ),
                        const AutoSizeText(
                          'Key : DEAD',
                          textAlign: TextAlign.center,
                          maxLines: 4,
                          style: TextStyle(fontSize: 20, fontFamily: 'Kod'),
                        ),
                      ],
                    ),
                  ),
                  SpacingConsts().smallHeightBetweenFields(context),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.62,
                        child: TextFormField(
                          controller: controller,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      CustomButton(
                        buttonText: 'Unlock',
                        color: Colors.amber,
                        buttonHeight: 0.05,
                        buttonWidth: 0.2,
                        onPressed: () {
                          String plainText = VigenereCipher()
                              .decryptVigenere(cipherText, 'code');

                          if (plainText.toLowerCase() ==
                              controller.text.toLowerCase()) {
                            FirebaseFunctions().updateLevelComplete('3');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LevelCompleted()));
                          } else {
                            if (lives > 0) {
                              setState(() {
                                lives--;
                              });
                            }
                            if (lives == 0) {
                              showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (context) => gameOver(context));
                            }
                            shakeKey.currentState?.shakeWidget();
                          }
                        },
                      )
                    ],
                  ),
                  SpacingConsts().mediumHeightBetweenFields(context),
                  Stack(
                    children: [
                      ShakeWidget(
                        key: shakeKey,
                        shakeDuration: const Duration(milliseconds: 500),
                        shakeCount: 3,
                        shakeOffset: 20,
                        child:
                            Image.asset('assets/level_assets/l3_b/l3_b3.jpeg'),
                      )
                    ],
                  ),
                  SpacingConsts().mediumHeightBetweenFields(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget infoDialog(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        color: primary_3,
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AutoSizeText(
                'Solve the code using playfair cipher for given text and code and you have 3 attempts.',
                maxLines: 3,
                style: TextStyle(
                    fontFamily: 'Kod', color: Colors.amber, fontSize: 18.0),
              ),
              SpacingConsts().smallHeightBetweenFields(context),
              const AutoSizeText(
                "Three wrong tries at the lab door, and you'll meet the violent experiment subjects, ready to take you down.",
                style: TextStyle(
                    fontFamily: 'Kod', color: Colors.amber, fontSize: 18.0),
              ),
              SpacingConsts().mediumHeightBetweenFields(context),
              CustomButton(
                color: Colors.amber,
                buttonText: 'Start Game',
                buttonHeight: 0.06,
                buttonWidth: 0.6,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SpacingConsts().smallHeightBetweenFields(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget gameOver(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: primary_3,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.02),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AutoSizeText(
                'Game Over!!!',
                style: TextStyle(
                    fontFamily: 'Kod', fontSize: 30, color: Colors.amber),
              ),
              SpacingConsts().smallHeightBetweenFields(context),
              Image.asset('assets/level_assets/l3_a/l3_a2.jpeg'),
              SpacingConsts().smallHeightBetweenFields(context),
              CustomButton(
                buttonText: 'Home Page',
                buttonHeight: 0.07,
                buttonWidth: 0.5,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
              SpacingConsts().smallHeightBetweenFields(context),
            ],
          ),
        ),
      ),
    );
  }
}

// List<String> decipherText = [
//     'tickingtime',
//     'deadpoet',
//     'lostlab',
//     'lastescape',
//     'maingate',
//     'violent'
//   ];