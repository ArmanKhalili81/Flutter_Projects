import 'package:flutter/material.dart';
import 'package:web_with_getx/screens/basescreen.dart';
import 'package:web_with_getx/widgets/custom_image_achievements.dart';

class Achievements extends StatelessWidget {
  const Achievements({Key? key}) : super(key: key);
  static String id = '/achievements';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Basescreen(
        text: 'Achievements',
        size: MediaQuery.of(context).size,
        mychild: DocumentOfAchievements(),
      ),
    );
  }
}
