import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/cipher_functions/vignere_cipher.dart';
import 'package:cipher_affair/components/custom_button.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Level3Page extends StatefulWidget {
  const Level3Page({super.key});

  @override
  State<Level3Page> createState() => _Level3PageState();
}

class _Level3PageState extends State<Level3Page> {
  late String cipherText;
  int lives = 3;

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
                          'Key : CODE',
                          textAlign: TextAlign.center,
                          maxLines: 4,
                          style: TextStyle(fontSize: 20, fontFamily: 'Kod'),
                        ),
                      ],
                    ),
                  ),
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
}
