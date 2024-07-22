import 'package:flutter/material.dart';
import 'package:web_with_getx/screens/basescreen.dart';
import 'package:web_with_getx/widgets/custom_card_profile.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);
  static String id = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Basescreen(
        text: 'Home',
        size: MediaQuery.of(context).size,
        mychild: CardProfile(size: MediaQuery.of(context).size),
      ),
    );
  }
}
