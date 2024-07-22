import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_using/screens/first_screen.dart';
import 'package:getx_using/screens/second_screen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Firstscreen(),
    getPages: [
      GetPage(name: Secondscreen.id, page: () => Secondscreen()),
      GetPage(name: Firstscreen.id, page: () => Firstscreen()),
    ],
  ));
}
