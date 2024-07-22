import 'package:flutter/material.dart';
import 'package:web_with_getx/screens/achievements.dart';
import 'package:web_with_getx/screens/background.dart';
import 'package:get/get.dart';
import 'package:web_with_getx/screens/homescreen.dart';
import 'package:web_with_getx/screens/publication.dart';
import 'package:web_with_getx/widgets/custom_show.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: Homescreen.id,
      getPages: [
        GetPage(name: Homescreen.id, page: () => const Homescreen()),
        GetPage(name: Background.id, page: () => const Background()),
        GetPage(name: Achievements.id, page: () => const Achievements()),
        GetPage(name: Publication.id, page: () => const Publication()),
      ],
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
    ),
  );
}
