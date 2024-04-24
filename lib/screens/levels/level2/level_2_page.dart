import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/cipher_functions/vignere_cipher.dart';
import 'package:cipher_affair/components/custom_button.dart';
import 'package:cipher_affair/components/shake_widget.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:cipher_affair/firebase_functions.dart';
import 'package:cipher_affair/screens/levels/level2/locker_unlocked.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Level2Page extends StatefulWidget {
  const Level2Page({super.key});

  @override
  State<Level2Page> createState() => _Level2PageState();
}

class _Level2PageState extends State<Level2Page> {
  TextEditingController controller = TextEditingController();
  final shakeKey = GlobalKey<ShakeWidgetState>();
  late String cipherText;

  @override
  void initState() {
    cipherText =
        VigenereCipher().cipheredTextList[Random().nextInt(7)].toUpperCase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          automaticallyImplyLeading: false,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          title: CustomButton(
            buttonText: 'Vignere Ciphere',
            color: accent_3,
            buttonHeight: 0.05,
            buttonWidth: 0.4,
            onPressed: () {
              Uri url =
                  Uri.parse('https://www.geeksforgeeks.org/vigenere-cipher/');
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
        backgroundColor: primary_3,
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SpacingConsts().mediumHeightBetweenFields(context),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: AutoSizeText(
                    'Decipher the code using Vigenere Cipher for cipher text "${cipherText.toUpperCase()}" and key is "code" to save your life',
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    style: const TextStyle(fontSize: 20, fontFamily: 'Kod'),
                  ),
                ),
                SpacingConsts().smallHeightBetweenFields(context),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
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
                        String decipheredText = VigenereCipher()
                            .decryptVigenere(cipherText, 'code');

                        if (decipheredText.toLowerCase() ==
                            controller.text.toLowerCase()) {
                          FirebaseFunctions().updateLevelComplete('2');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LockerUnlocked()));
                        } else {
                          debugPrint('shake called');
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
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage('assets/level_2_lock.jpg'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
