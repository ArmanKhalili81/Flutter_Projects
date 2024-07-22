import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_using/controller/firstcontroller.dart';

class Secondscreen extends StatelessWidget {
  Secondscreen({Key? key}) : super(key: key);
  static String id = '/secondpage';
  final Firstcontroller firstcontroller = Get.find<Firstcontroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
          child: Text(
        "${firstcontroller.current}",
        style: const TextStyle(
            fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
      )),
    );
  }
}
