import 'package:dio_json_teach/Data.dart';
import 'package:dio_json_teach/dioTest.dart';
import 'package:flutter/material.dart';
import 'package:dio_json_teach/User.dart';

import 'package:dio_json_teach/DioClient.dart';

class Getinform extends StatefulWidget {
  String? id;
  Getinform(
    this.id, {
    Key? key,
  }) : super(key: key);

  @override
  State<Getinform> createState() => _GetinformState();
}

class _GetinformState extends State<Getinform> {
  Dioclient _dioclient = Dioclient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FutureBuilder<User>(
            future: _dioclient.getuserdata("${widget.id}"),
            builder: (context, snapshot) {
              Data? userdata = snapshot.data?.data;
              if (snapshot.hasData) {
                return Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      border: Border.all(
                          width: 25, color: Color.fromARGB(231, 81, 163, 88)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage("${userdata!.avatar}"),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${userdata.email}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black54),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${userdata.first_name}" + " ${userdata.last_name}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black54),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 10,
              fixedSize: Size(200, 40),
              shape: StadiumBorder(),
              primary: Color.fromARGB(255, 12, 150, 160),
            ),
            onPressed: () {
              gotohome();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home),
                Text(" Home",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  gotohome() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DioTest(),
        ));
  }
}
