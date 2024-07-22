import 'package:flutter/material.dart';

class TabOption extends StatelessWidget {
  TabOption({Key? key, required this.onpressed, required this.text})
      : super(key: key);
  final VoidCallback onpressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onpressed,
        child: Text(
          text,
          style:const TextStyle(color: Colors.white),
        ));
  }
}
