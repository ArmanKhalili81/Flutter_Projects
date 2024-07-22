import 'package:flutter/material.dart';

class Footbar extends StatelessWidget {
  const Footbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: Colors.grey[100],
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.email,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            const Text(
              "armanbrave456@gmail.com",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
