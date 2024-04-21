import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/cipher_functions/ceaser_cipher.dart';
import 'package:cipher_affair/components/shake_widget.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:cipher_affair/screens/home/home_page.dart';
import 'package:flutter/material.dart';

class Level1Page extends StatefulWidget {
  const Level1Page({super.key});

  @override
  State<Level1Page> createState() => _Level1PageState();
}

class _Level1PageState extends State<Level1Page> {
  late String cipherText = '';
  final shakeKey = GlobalKey<ShakeWidgetState>();
  TextEditingController _plainController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Random random = Random();
    cipherText = CeaserCipher().cipherTexts[random.nextInt(3)];
  }

  @override
  Widget build(BuildContext context) {
    print(cipherText);
    return SafeArea(
      minimum: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
      top: true,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.amber,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          leading: null,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: const AutoSizeText('Quit'),
            )
          ],
        ),
        backgroundColor: primary_3,
        body: Container(
          color: primary_3,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.03),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                        vertical: MediaQuery.of(context).size.height * 0.01),
                    color: Colors.white,
                    child: AutoSizeText(
                      'Decipher the code using for the cipher text "$cipherText" and key 5',
                      maxLines: 2,
                      style: const TextStyle(fontSize: 20, fontFamily: 'Kod'),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: TextFormField(
                          controller: _plainController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            String plainText =
                                CeaserCipher().decryptCaesar('Rnsfyzx', 5);

                            String cipherTect =
                                CeaserCipher().encryptCaesarCipher('', 5);

                            print(cipherTect);
                            if (plainText.toLowerCase() ==
                                _plainController.text.toLowerCase()) {
                              debugPrint('plain text is $plainText');
                            } else {
                              shakeKey.currentState?.shakeWidget();
                            }
                          },
                          child: AutoSizeText('Unlock'))
                    ],
                  ),
                ),
                SpacingConsts().smallHeightBetweenFields(context),
                ShakeWidget(
                  key: shakeKey,
                  shakeDuration: const Duration(milliseconds: 1000),
                  shakeCount: 3,
                  shakeOffset: 20,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage('assets/level_1_lock.jpeg'),
                            fit: BoxFit.cover)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
