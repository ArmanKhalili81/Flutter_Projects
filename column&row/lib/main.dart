import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: Me()));
}

class Me extends StatelessWidget {
  const Me({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 229, 147),
      appBar: AppBar(
        title: Center(child: Text("Who Am I")),
        elevation: 20,
        backgroundColor: Color.fromARGB(255, 31, 101, 171),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/ali.jpeg"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 300,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 236, 232, 232),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(90)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.account_circle,
                      size: 60,
                      color: Color.fromARGB(255, 34, 192, 179),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "S.M.A.KH",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.mobile_friendly,
                      size: 55,
                      color: Colors.greenAccent[400],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "+989130728277",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.work,
                      size: 55,
                      color: Colors.indigoAccent[100],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Flutter Developer",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
