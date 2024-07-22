import 'package:flutter/material.dart';
import 'package:web_with_getx/constants.dart';
import 'package:web_with_getx/screens/achievements.dart';
import 'package:web_with_getx/screens/background.dart';
import 'package:web_with_getx/screens/homescreen.dart';
import 'package:web_with_getx/screens/publication.dart';
import 'package:web_with_getx/widgets/custom_tab_option.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TabOption(
            onpressed: () {
              knavigate(Homescreen.id);
            },
            text: "Home"),
        TabOption(
            onpressed: () {
              knavigate(Achievements.id);
            },
            text: "Achievements"),
        TabOption(
            onpressed: () {
              knavigate(Background.id);
            },
            text: "Background"),
        TabOption(
            onpressed: () {
              knavigate(Publication.id);
            },
            text: "Publication & Project"),
      ],
    );
  }
}
