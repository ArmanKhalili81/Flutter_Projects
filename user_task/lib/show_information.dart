import 'package:flutter/material.dart';
import 'package:user_task/login.dart';

class Information extends StatefulWidget {
  String? name;
  String? email;
  String? gender;
  Information(
      {Key? key,
      @required String? name,
      @required String? email,
      @required String? gender})
      : super(key: key) {
    this.name = name;
    this.email = email;
    this.gender = gender;
  }

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: StadiumBorder(),
        backgroundColor: Color.fromARGB(222, 11, 119, 149),
        centerTitle: true,
        title: Text("Information"),
        leading: IconButton(
          iconSize: 30,
          icon: Icon(Icons.home_rounded),
          onPressed: () {
            move();
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            shape: BoxShape.rectangle,
            boxShadow: [BoxShadow(blurRadius: 10, offset: Offset(0, 5))],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Colors.red, Colors.pink],
            ),
          ),
          child: Column(
            children: [
              Spacer(),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 50,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Text(
                    "Name : ${widget.name}",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 50,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Text(
                    "Gmail : ${widget.email}",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 50,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Text(
                    "Gender : ${widget.gender}",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  void move() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
}
