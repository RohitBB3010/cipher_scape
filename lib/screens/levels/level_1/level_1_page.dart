import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:flutter/material.dart';

class Level1Page extends StatefulWidget {
  const Level1Page({super.key});

  @override
  State<Level1Page> createState() => _Level1PageState();
}

class _Level1PageState extends State<Level1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_3,
      body: Container(
        color: primary_3,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.height * 0.01),
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: AutoSizeText('Decipher the code using '))
          ],
        ),
      ),
    );
  }
}
