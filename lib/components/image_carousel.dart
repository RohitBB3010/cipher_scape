import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> carouselItems = [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/carousel/cypher_slide1.jpeg'),
                fit: BoxFit.cover,
                opacity: 0.5)),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/carousel/cypher_slide2.jpeg'),
              fit: BoxFit.cover,
              opacity: 0.5),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/carousel/cypher_slide3.jpeg'),
                fit: BoxFit.fitHeight,
                opacity: 0.5)),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/carousel/cypher_slide4.jpeg'),
                fit: BoxFit.cover,
                opacity: 0.5)),
      ),
    ];

    return CarouselSlider(
      items: carouselItems,
      options: CarouselOptions(
          autoPlay: true,
          height: MediaQuery.of(context).size.height,
          viewportFraction: 1,
          aspectRatio: MediaQuery.of(context).size.width /
              MediaQuery.of(context).size.height,
          enlargeCenterPage: false,
          padEnds: false),
    );
  }
}
