import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Level2Carousel extends StatefulWidget {
  const Level2Carousel({super.key});

  @override
  State<Level2Carousel> createState() => _Level2CarouselState();
}

class _Level2CarouselState extends State<Level2Carousel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AutoSizeText('Coming soon'),
      ),
    );
  }
}
