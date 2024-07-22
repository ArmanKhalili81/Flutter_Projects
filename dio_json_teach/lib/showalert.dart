import 'package:dio_json_teach/Newuser.dart';
import 'package:flutter/material.dart';

class ShowAlert extends StatefulWidget {
  NewUser? newUser;
  ShowAlert(
    this.newUser, {
    Key? key,
  }) : super(key: key);

  @override
  State<ShowAlert> createState() => _ShowAlertState();
}

class _ShowAlertState extends State<ShowAlert> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: StadiumBorder(),
      child: Container(
        height: 150,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Name : ${widget.newUser!.name!.toUpperCase()}",
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Text(
            "Job : ${widget.newUser!.job}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text("CratedAt : ${widget.newUser!.createdAt}",
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Text("ID : ${widget.newUser!.id}",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }
}
