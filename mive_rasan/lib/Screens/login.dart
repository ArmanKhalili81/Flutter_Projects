import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mive_rasan/colors/colorpage.dart';
import 'package:styled_widget/styled_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneEditingController = TextEditingController();
  bool _enablebutton = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kgrey,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              CircleAvatar(
                radius: 170,
                backgroundImage: AssetImage("assets/images/Miveresan_logo.jpg"),
              ),
              SizedBox(
                height: 120,
              ),
              TextField(
                controller: phoneEditingController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                onChanged: ((value) {
                  if (value.length == 10)
                    setState(() {
                      _enablebutton = !_enablebutton;
                    });
                  else if (value.length < 10)
                    setState(() {
                      _enablebutton = false;
                    });
                }),
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kwhite,
                  alignLabelWithHint: true,
                  hintTextDirection: TextDirection.rtl,
                  prefixText: "+98 ",
                  prefixIcon: Icon(Icons.phone).iconColor(kgreen).iconSize(28),
                  prefixStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ).padding(left: 35, right: 35),
              SizedBox(
                height: 120,
              ),
              ElevatedButton(
                onPressed: (_enablebutton) ? () {} : null,
                child: Text("ورود به میوه رسان").textStyle(
                  TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
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
      ),
    );
  }
}
