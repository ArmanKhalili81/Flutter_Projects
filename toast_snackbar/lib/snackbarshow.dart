import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SnackbarShow extends StatefulWidget {
  const SnackbarShow({Key? key}) : super(key: key);

  @override
  State<SnackbarShow> createState() => _SnackbarShowState();
}

class _SnackbarShowState extends State<SnackbarShow> {
  bool istryclicked = false;
  FToast fToast = FToast();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Snack Bar"),
        ),
        body: Center(
          child: Container(
            child: (istryclicked)
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: Text("Show Snack"),
                        onPressed: () {
                          _showsnack();
                        },
                      ),
                      ElevatedButton(
                          child: Text("Show Toast"),
                          onPressed: () {
                            fToast.showToast(
                                child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.greenAccent,
                              ),
                              child: Text("ممنون که منو انتخاب کردی"),
                            ));
                          }),
                    ],
                  ),
          ),
        ));
  }

  _showsnack() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  change();
                },
                child: Text(
                  "تلاش مجدد",
                )),
            Text(
              "سلام ، خوش اومدی ...",
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }

  change() {
    setState(() {
      istryclicked = !istryclicked;
    });
  }
}
