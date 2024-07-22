import 'package:dio_json_teach/DioClient.dart';
import 'package:dio_json_teach/Newuser.dart';
import 'package:dio_json_teach/dioTest.dart';
import 'package:dio_json_teach/showalert.dart';
import 'package:flutter/material.dart';

class Postinform extends StatefulWidget {
  const Postinform({Key? key}) : super(key: key);

  @override
  State<Postinform> createState() => _PostinformState();
}

class _PostinformState extends State<Postinform> {
  NewUser? retrievedUser;
  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();
  bool inputcheck = false;
  String text = "Job";
  Dioclient _dioclient = Dioclient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create User")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              (inputcheck)
                  ? Text(
                      "!! Wrong !!",
                      style: TextStyle(color: Colors.red, fontSize: 30),
                    )
                  : Text(""),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              TextField(
                controller: job,
                decoration: InputDecoration(
                  hintText: "Job",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    fixedSize: Size(200, 40),
                    shape: StadiumBorder(),
                    primary: Color.fromARGB(255, 12, 150, 160)),
                onPressed: () async {
                  if (job.text.isEmpty || name.text.isEmpty) {
                    setState(() {
                      inputcheck = !inputcheck;
                    });
                  } else {
                    if (inputcheck == true)
                      setState(() {
                        inputcheck = !inputcheck;
                      });
                    NewUser newUser = NewUser(name: name.text, job: job.text);
                    retrievedUser = await _dioclient.postuserdata(newUser);
                    showDialog(
                        context: context,
                        builder: (context) => ShowAlert(retrievedUser));
                  }
                },
                child: Text("Create User",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
