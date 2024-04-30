import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/cipher_functions/vignere_cipher.dart';
import 'package:cipher_affair/components/custom_button.dart';
import 'package:cipher_affair/components/shake_widget.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:cipher_affair/firebase_functions.dart';
import 'package:cipher_affair/screens/levels/level_2/locker_unlocked.dart';
import 'package:cipher_affair/screens/levels/level_2/timer_over.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
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
  final timerController = CountDownController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => descriptionDialog(context));
    });
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
                  child: Column(
                    children: [
                      AutoSizeText(
                        'Cipher Text : $cipherText',
                        textAlign: TextAlign.center,
                        maxLines: 4,
                        style: const TextStyle(fontSize: 20, fontFamily: 'Kod'),
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
                CircularCountDownTimer(
                  controller: timerController,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.3,
                  duration: 180,
                  fillColor: accent_2,
                  ringColor: Colors.amber,
                  textStyle:
                      const TextStyle(color: Colors.white, fontSize: 30.0),
                  isReverse: true,
                  autoStart: false,
                  onComplete: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TimerOver()));
                  },
                ),
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
                ),
                SpacingConsts().mediumHeightBetweenFields(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget descriptionDialog(BuildContext context) {
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
                'Solve the code using vignere cipher for given text and code within 3 minutes.',
                maxLines: 3,
                style: TextStyle(
                    fontFamily: 'Kod', color: Colors.amber, fontSize: 18.0),
              ),
              SpacingConsts().smallHeightBetweenFields(context),
              const AutoSizeText(
                'Within 3 minutes, poison will take over your limbs and you will be doomed to die here',
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
                  timerController.start();
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
