import 'package:flutter/material.dart';
import 'package:web_with_getx/screens/basescreen.dart';

class Publication extends StatelessWidget {
  const Publication({Key? key}) : super(key: key);
  static String id = '/pub';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Basescreen(text: 'Publication and Projects',size: MediaQuery.of(context).size,mychild: Container(),),
    );
  }
}