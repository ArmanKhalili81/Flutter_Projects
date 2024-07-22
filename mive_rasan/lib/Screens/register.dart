import 'package:flutter/material.dart';
import 'package:mive_rasan/colors/colorpage.dart';
import 'package:styled_widget/styled_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              radius: 170,
              backgroundImage: AssetImage("assets/images/Miveresan_logo.jpg"),
            ),
            SizedBox(
              height: 70,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.right,
              cursorHeight: 30,
              decoration: InputDecoration(
                filled: true,
                fillColor: kwhite,
                alignLabelWithHint: true,
                hintText: "نــام",
                hintTextDirection: TextDirection.rtl,
                prefixIcon:
                    Icon(Icons.person_outline_sharp).iconColor(kpurple).iconSize(38),
                prefixStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ).padding(left: 35, right: 35),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.right,
              cursorHeight: 30,
              decoration: InputDecoration(
                filled: true,
                fillColor: kwhite,
                alignLabelWithHint: true,
                hintText: "نــام خانوادگی",
                hintTextDirection: TextDirection.rtl,
                prefixIcon:
                    Icon(Icons.person_outline_sharp).iconColor(kpurple).iconSize(38),
                prefixStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ).padding(left: 35, right: 35),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.right,
              cursorHeight: 30,
              decoration: InputDecoration(
                filled: true,
                fillColor: kwhite,
                alignLabelWithHint: true,
                hintText: "شماره صنفی",
                hintTextDirection: TextDirection.rtl,
                prefixIcon:
                    Icon(Icons.location_pin).iconColor(kred).iconSize(35),
                prefixStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ).padding(left: 35, right: 35),
            SizedBox(
              height: 70,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("ثبت نام").textStyle(
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
