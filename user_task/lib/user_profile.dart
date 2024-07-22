import 'package:flutter/material.dart';
import 'package:user_task/show_information.dart';

class User_Profile extends StatefulWidget {
  String? firsname = "";
  String? firsemail = "";
  User_Profile({Key? key, @required String? name, @required String? email})
      : super(key: key) {
    firsname = name;
    firsemail = email;
  }
  @override
  State<User_Profile> createState() => _User_ProfileState(firsname, firsemail);
}

class _User_ProfileState extends State<User_Profile> {
  TextEditingController name = TextEditingController();
  TextEditingController gmail = TextEditingController();
  String? _user_name = "";
  String? _gmail = "";
  var _gender;
  _User_ProfileState(String? firsname, String? firsemail) {
    _user_name = firsname;
    _gmail = firsemail;
  }
  @override
  Widget build(BuildContext context) {
    name.text = _user_name!;
    gmail.text = _gmail!;
    return Scaffold(
      appBar: AppBar(
        shape: StadiumBorder(),
        title: Text("Edit Information"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(222, 11, 119, 149),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Spacer(),
              Expanded(
                flex: 6,
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "Enter Your Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onChanged: (String text) {
                    setState(
                      () {
                        _user_name = text;
                      },
                    );
                  },
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Spacer(),
              Expanded(
                flex: 6,
                child: TextField(
                  controller: gmail,
                  decoration: InputDecoration(
                    labelText: "Gmail",
                    hintText: "Enter Your Gmail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onChanged: (String text) {
                    setState(
                      () {
                        _gmail = text;
                      },
                    );
                  },
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 50),
            child: DropdownButtonFormField(
              iconSize: 25,
              decoration: InputDecoration(
                hintText: "Gender",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              value: _gender,
              items: [
                DropdownMenuItem(
                    child: Row(
                      children: [
                        Icon(
                          Icons.man_outlined,
                          size: 25,
                          color: Color.fromARGB(255, 8, 166, 215),
                        ),
                        Text("Male"),
                      ],
                    ),
                    value: "Male"),
                DropdownMenuItem(
                    child: Row(
                      children: [
                        Icon(
                          Icons.woman_outlined,
                          size: 25,
                          color: Color.fromARGB(255, 249, 16, 136),
                        ),
                        Text("Female"),
                      ],
                    ),
                    value: "Female"),
              ],
              onChanged: (newvalue) {
                setState(
                  () {
                    _gender = newvalue;
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 45,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              elevation: 8,
              fixedSize: Size(130, 50),
              primary: Color.fromARGB(237, 77, 2, 240),
            ),
            onPressed: () {
              move();
            },
            child: Text(
              "Next",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }

  void move() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Information(
                name: _user_name,
                email: _gmail,
                gender: _gender,
              )),
    );
  }
}
