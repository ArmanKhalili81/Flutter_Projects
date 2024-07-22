import 'package:flutter/material.dart';

class ShowHero extends StatelessWidget {
  const ShowHero({Key? key, required this.imageaddress}) : super(key: key);
  final String imageaddress;
  static String id = '/heropage';
  @override
  Widget build(BuildContext context) {
    print(imageaddress);
    return Hero(
      tag: 'me1',
      child: Image(
        height: 800,
        image: AssetImage(imageaddress),
      ),
    );
  }
}
