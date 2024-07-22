import 'package:flutter/material.dart';
import 'package:mive_rasan/colors/colorpage.dart';
import 'package:styled_widget/styled_widget.dart';

class ActivationCode extends StatelessWidget {
  const ActivationCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kgrey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 170,
              backgroundImage: AssetImage("assets/images/Miveresan_logo.jpg"),
            ),
            TextField(
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.center,
              cursorHeight: 30,
              decoration: InputDecoration(
                filled: true,
                fillColor: kwhite,
                alignLabelWithHint: true,
                hintText: "کد فعالسازی",
                hintTextDirection: TextDirection.rtl,
                prefixIcon: Icon(Icons.message).iconColor(korange).iconSize(28),
                prefixStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ).padding(left: 35, right: 35),
            SizedBox(
              height: 120,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("تایید").textStyle(
                TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kwhite,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                fixedSize: Size(380, 55),
                elevation: 10,
                primary: kblue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
