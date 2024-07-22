import 'package:flutter/material.dart';
import 'forgotpassword.dart';
import 'user_profile.dart';
import 'user_data.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  Userdata _userdata1 =
      Userdata("Arman", "armanbrave456@gmail.com", "171617168184Mm");
  Userdata _userdata2 = Userdata("Boss", "adamant@gmail.com", "adamant.co");
  Userdata _userdata3 =
      Userdata("Mohsen", "mohsen1356@gmail.com", "123456789a");
  Userdata _userdata4 =
      Userdata("Mohammad", "mohammad1381@gmail.com", "17161716@");
  Userdata _userdata5 = Userdata("Ali", "aliyari@gmail.com", "15381538!");
  Userdata? current_information_user;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  List<Userdata> user = [];
  bool showerrortext = false;
  bool? condition;

  @override
  void initState() {
    //For initialize variables that we want .
    user.addAll(
      [
        _userdata1,
        _userdata2,
        _userdata3,
        _userdata4,
        _userdata5,
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return page();
  }

  Widget page() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Login"),
        centerTitle: true,
        elevation: 20,
        shape: StadiumBorder(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 180, 40, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ((showerrortext) ? "Invalid Information" : ""),
                style: TextStyle(fontSize: 25, color: Colors.red),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: email,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: "Email",
                  hintText: "Enter Your Email",
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: password,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: "Password",
                  hintText: "Enter Your Password",
                ),
                obscureText: true,
                obscuringCharacter: "*",
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Colors.deepPurple,
                    fixedSize: Size(130, 50)),
                onPressed: () {
                  condition = situation();
                  (condition!) ? move() : {showerrortext = true, error()};
                },
                child: Text("Login"),
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  passwordrecoverypage();
                },
                child: Text(
                  "Forgot Your Password ?",
                  style: TextStyle(
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void error() {
    setState(() {});
  }

  bool situation() {
    bool result = false;
    // user.firstWhere(
    //     (element) => element.check_information(email.text, password.text));
    for (int count = 0; count < user.length; count++) {
      result = user[count].check_information(email.text, password.text);
      if (result) {
        current_information_user = user[count];
        return result;
      }
    }
    return result;
  }

  void move() {
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => User_Profile(
            name: current_information_user?.name,
            email: current_information_user?.gmail,
          ),
        ));
  }

  void passwordrecoverypage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Forgotpass(user),
      ),
    );
  }
}
