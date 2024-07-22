import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Exp_flex(),
    ),
  );
}

class Exp_flex extends StatefulWidget {
  const Exp_flex({Key? key}) : super(key: key);

  @override
  State<Exp_flex> createState() => _Exp_flexState();
}

class _Exp_flexState extends State<Exp_flex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Expand && Flex"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.blueAccent,
                    ),
                    child: Center(
                      child: Text(
                        "A",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    margin: EdgeInsets.all(8),
                    color: Colors.amber,
                    child: Center(
                      child: Text(
                        "B",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 60,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blueAccent,
                  ),
                  child: Center(
                      child: Text(
                    "A",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    color: Colors.amber,
                    child: Center(
                      child: Text(
                        "B",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.blueAccent,
                    ),
                    child: Center(
                        child: Text(
                      "A",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    color: Colors.amber,
                    child: Center(
                      child: Text(
                        "B",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        "C",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.blueAccent,
                    ),
                    child: Center(
                      child: Text(
                        "A",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    color: Colors.amber,
                    child: Center(
                      child: Text(
                        "B",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        "C",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 120,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blueAccent,
                  ),
                  child: Center(
                      child: Text(
                    "A",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                Container(
                  width: 30,
                  height: 120,
                  margin: EdgeInsets.all(8),
                  color: Colors.amber,
                  child: Center(
                    child: Text(
                      "B",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 120,
                  margin: EdgeInsets.all(8),
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      "C",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blueAccent,
                  ),
                  child: Center(
                    child: Text(
                      "A",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    color: Colors.amber,
                    child: Center(
                      child: Text(
                        "B",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  margin: EdgeInsets.all(8),
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      "C",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blueAccent,
                  ),
                  child: Center(
                      child: Text(
                    "A",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                Container(
                  width: 130,
                  margin: EdgeInsets.all(8),
                  color: Colors.amber,
                  child: Center(
                      child: Text(
                    "B",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ],
            ),
          ),
          Expanded(
            child: FractionallySizedBox(
              //for set fractional size widget
              widthFactor: 0.5,
              child: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blueAccent,
                ),
                child: Center(
                  child: Text(
                    "A",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.blueAccent,
                    ),
                    child: Center(
                      child: Text(
                        "A",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30,
                    margin: EdgeInsets.all(8),
                    color: Colors.amber,
                    child: Center(
                      child: Text(
                        "B",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
