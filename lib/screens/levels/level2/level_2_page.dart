import 'package:cipher_affair/cipher_functions/vignere_cipher.dart';
import 'package:cipher_affair/components/custom_button.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:flutter/material.dart';

class Level2Page extends StatefulWidget {
  const Level2Page({super.key});

  @override
  State<Level2Page> createState() => _Level2PageState();
}

class _Level2PageState extends State<Level2Page> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          automaticallyImplyLeading: false,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          title: CustomButton(
            buttonText: 'Quit',
            buttonHeight: 0.05,
            buttonWidth: 0.2,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
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
                            .encryptVigenere('saintgermain', 'code');
                        print(decipheredText);
                      },
                    )
                  ],
                ),
                SpacingConsts().mediumHeightBetweenFields(context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage('assets/level_2_lock.jpg'),
                          fit: BoxFit.cover)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}