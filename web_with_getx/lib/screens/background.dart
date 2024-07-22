import 'package:flutter/material.dart';
import 'package:web_with_getx/screens/basescreen.dart';
import 'package:web_with_getx/widgets/custom_image_backgraound.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);
  static String id = '/background';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Basescreen(
        text: 'Background',
        size: MediaQuery.of(context).size,
        mychild: MakeImage(),
      ),
    );
  }
}
