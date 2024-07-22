import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:web_with_getx/widgets/custom_show.dart';

class DocumentOfAchievements extends StatelessWidget {
  DocumentOfAchievements({Key? key}) : super(key: key);
  final List<String> listimage = [
    'image/me4.jpeg',
    'image/me6.jpg',
    'image/me7.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider.builder(
        itemCount: listimage.length,
        itemBuilder: (context, index, realIndex) => GestureDetector(
          child: Hero(
            tag: 'me$index',
            child: Image(
              image: AssetImage(listimage[index]),
            ),
          ),
          onTap: () {
            print(listimage[index]);
            Get.offNamed(ShowHero.id, arguments: listimage[index]);
          },
        ),
        options: CarouselOptions(
            height: 500,
            autoPlay: true,
            scrollDirection: Axis.vertical,
            aspectRatio: 5),
      ),
    );
  }
}
