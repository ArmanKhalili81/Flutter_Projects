import 'package:flutter/material.dart';
import 'package:sms_advanced/sms_advanced.dart';
void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final SmsQuery smsQuery = SmsQuery();
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> _sendmessage() async {
    List<SmsMessage> _result = await smsQuery.getAllSms;
    print(_result);
  }
}