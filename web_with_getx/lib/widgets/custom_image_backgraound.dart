import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MakeImage extends StatelessWidget {
  MakeImage({Key? key}) : super(key: key);
  final List<String> listimage = [
    'image/me.jpg',
    'image/me1.jpg',
    'image/me3.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider.builder(
        itemCount: listimage.length,
        itemBuilder: (context, index, realIndex) =>
            Image(image: AssetImage(listimage[index])),
        options: CarouselOptions(height: 500, autoPlay: true),
      ),
    );
  }
}
