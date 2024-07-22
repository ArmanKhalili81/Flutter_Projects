import 'package:flutter/material.dart';
import 'package:web_with_getx/widgets/custom_foot_bar.dart';
import 'package:web_with_getx/widgets/custom_nav_bar.dart';
import '../widgets/custom_card_profile.dart';

class Basescreen extends StatelessWidget {
  const Basescreen(
      {Key? key, required this.text, required this.size, required this.mychild})
      : super(key: key);
  final String text;
  final Size size;
  final Widget mychild;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Navbar(
          size: size,
        ),
        creatspace(),
        Text(
          text,
          style:const TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: text.length * 8,
          height: 2,
          color: Colors.black,
        ),
        creatspace(),
        mychild,
        creatspace(),
        const Footbar(),
      ],
    );
  }

  Widget creatspace() {
    return const SizedBox(
      height: 25,
    );
  }
}
