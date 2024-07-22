import 'package:flutter/material.dart';
import 'user_data.dart';

class Forgotpass extends StatefulWidget {
  List<Userdata> userData = [];
  Forgotpass(List<Userdata> userdata, {Key? key}) : super(key: key) {
    userData = userdata;
  }
  @override
  State<Forgotpass> createState() => _ForgotpassState(userData);
}

class _ForgotpassState extends State<Forgotpass> {
  List<Userdata> userData = [];
  Userdata? information;
  _ForgotpassState(List<Userdata> data) {
    userData = data;
  }
  bool _obsecure1 = true;
  bool _obsecure2 = true;
  bool condition = false; // for check correctness gmail
  bool showerrortext = false; // for show error while there isn't gmail
  TextEditingController password = TextEditingController();
  TextEditingController passwordconfirm = TextEditingController();
  TextEditingController gmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 26, 138, 243),
        title: Text(
          "Password Recovery",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 8,
        shape: StadiumBorder(),
      ),
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            TextField(
              controller: gmail,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                label: Text("Gmail"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  condition = checkgmail();
                  (condition) ? null : showerrortext = true;
                });
              },
              child: Text(
                "Check",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                elevation: 10,
                fixedSize: Size(130, 50),
                primary: Color.fromARGB(153, 24, 87, 224),
                onPrimary: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Spacer(),
            (condition)
                ? Column(
                    children: [
                      TextField(
                        obscureText: _obsecure1,
                        obscuringCharacter: "*",
                        controller: password,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          suffixIcon: (_obsecure1)
                              ? GestureDetector(
                                  child: IconButton(
                                    icon: Icon(Icons.visibility_off),
                                    onPressed: (() {
                                      setState(() {
                                        _obsecure1 = !_obsecure1;
                                      });
                                    }),
                                  ),
                                )
                              : GestureDetector(
                                  child: Icon(Icons.visibility),
                                  onTap: () {
                                    setState(() {
                                      _obsecure1 = !_obsecure1;
                                    });
                                  },
                                ),
                          labelText: "Password",
                          hintText: "New Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        obscureText: _obsecure2,
                        obscuringCharacter: "*",
                        controller: passwordconfirm,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          suffixIcon: (_obsecure2)
                              ? GestureDetector(
                                  child: IconButton(
                                    icon: Icon(Icons.visibility_off),
                                    onPressed: (() {
                                      setState(() {
                                        _obsecure2 = !_obsecure2;
                                      });
                                    }),
                                  ),
                                )
                              : GestureDetector(
                                  child: Icon(Icons.visibility),
                                  onTap: () {
                                    setState(() {
                                      _obsecure2 = !_obsecure2;
                                    });
                                  },
                                ),
                          label: Text("Re-password"),
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          elevation: 10,
                          fixedSize: Size(130, 50),
                          primary: Color.fromARGB(255, 19, 215, 196),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  )
                : Text(
                    (showerrortext) ? "Email dosen't exist" : "",
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  bool checkgmail() {
    // userData.firstWhere(
    //     (element) => element.check_information(email.text, password.text));
    for (int count = 0; count < userData.length; count++) {
      if (userData[count].gmail == gmail.text) {
        return true;
      }
    }
    return false;
  }

  // save_and_move() {
  //   Navigator.pop(context);
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => Login(),
  //     ),
  //   );
  // }
}
