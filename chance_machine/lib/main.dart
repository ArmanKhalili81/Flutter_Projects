import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Chance_Machine(),
    ),
  );
}

class Chance_Machine extends StatefulWidget {
  const Chance_Machine({Key? key}) : super(key: key);

  @override
  State<Chance_Machine> createState() => _Chance_MachineState();
}

class _Chance_MachineState extends State<Chance_Machine> {
  int num_1 = 0,
      num_2 = 0,
      num_3 = 0,
      num_4 = 0,
      num_5 = 0,
      num_6 = 0,
      num_7 = 0,
      num_8 = 0,
      num_9 = 0;
  bool won = false;
  int notp = 0; //number of times played
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Made();
  }

  Widget Made() {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "𝘾𝙝𝙖𝙣𝙘𝙚 𝙈𝙖𝙘𝙝𝙞𝙣𝙚",
          style: TextStyle(
            fontSize: 25,
            shadows: [
              Shadow(
                  color: Color.fromARGB(255, 1, 1, 1),
                  blurRadius: 5,
                  offset: Offset(1, 5))
            ],
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 6, 110, 255),
            Color.fromARGB(220, 206, 83, 83),
            Colors.purple,
            Colors.black
          ], begin: Alignment.bottomRight, end: Alignment.bottomLeft),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromARGB(255, 253, 86, 9)),
              child: Center(
                child: Text(
                  "Chance : $notp/3",
                  style: TextStyle(
                    shadows: [
                      Shadow(
                          color: Color.fromARGB(255, 1, 1, 1),
                          blurRadius: 5,
                          offset: Offset(1, 5))
                    ],
                    fontFamily: "DeathMarkersDrip",
                    fontSize: 30,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: table(),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: (notp == 3)
                    ? Colors.green
                    : Color.fromARGB(245, 246, 182, 44),
                minimumSize: Size(150, 50),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                notp++;
                if (notp <= 3) {
                  change_picture();
                } else {
                  change_page();
                }
              },
              child: Text(
                (notp == 3) ? "Result" : "𝙍𝙤𝙡𝙡",
                style: TextStyle(shadows: [
                  Shadow(
                      color: Color.fromARGB(255, 0, 0, 0),
                      blurRadius: 2,
                      offset: Offset(5, 2))
                ], fontSize: 25, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }

  Widget table() {
    return Table(
      border: TableBorder.all(
          width: 3,
          borderRadius: BorderRadius.circular(50),
          color: Color.fromARGB(209, 255, 255, 255)),
      children: [
        TableRow(
          children: [
            Container(
              child: Image(
                image: AssetImage('assets/number$num_1.png'),
              ),
              height: 90,
            ),
            Container(
              child: Image(
                image: AssetImage('assets/number$num_2.png'),
              ),
              height: 90,
            ),
            Container(
              child: Image(
                image: AssetImage('assets/number$num_3.png'),
              ),
              height: 90,
            ),
          ],
        ),
      ],
    );
  }

  void change_picture() {
    setState(
      () {
        num_1 = random.nextInt(5);
        num_2 = random.nextInt(5);
        num_3 = random.nextInt(5);
        if (num_1 == num_2 && num_2 == num_3) {
          change_page();
          won = true;
        }
      },
    );
    if (notp == 1) {
      num_4 = num_1;
      num_5 = num_2;
      num_6 = num_3;
    } else if (notp == 2) {
      num_7 = num_1;
      num_8 = num_2;
      num_9 = num_3;
    }
  }

  void change_page() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(248, 255, 234, 98),
                  Color.fromARGB(248, 4, 166, 236),
                  Color.fromARGB(213, 158, 3, 248),
                  Color.fromARGB(248, 255, 234, 98)
                ], begin: Alignment.bottomRight, end: Alignment.bottomLeft),
              ),
              child: Scaffold(
                extendBodyBehindAppBar: true,
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(50))),
                  backgroundColor: Color.fromARGB(250, 5, 154, 247),
                  title: Text(
                    " 𝐅𝐢𝐧𝐢𝐬𝐡 ",
                    style: TextStyle(
                        fontSize: 35,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  centerTitle: true,
                  elevation: 25,
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (won == true)
                        ? Column(children: [
                            Center(
                              child: Container(
                                height: 350,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        blurRadius: 30,
                                        offset: Offset(5, 5)),
                                  ],
                                  gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(228, 11, 129, 239),
                                        Color.fromARGB(244, 255, 213, 0),
                                        Color.fromARGB(221, 248, 3, 130),
                                        Color.fromARGB(255, 252, 157, 15)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.centerRight),
                                  shape: BoxShape.circle,
                                ),
                                child: Image(
                                  image: AssetImage("assets/applause.gif"),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                " Congratulation ",
                                style: TextStyle(
                                    shadows: [
                                      Shadow(
                                          color: Color.fromARGB(255, 1, 1, 1),
                                          blurRadius: 5,
                                          offset: Offset(10, 8))
                                    ],
                                    fontSize: 55,
                                    fontFamily: "DeathMarkersDrip",
                                    color: Color.fromARGB(255, 252, 214, 0)),
                              ),
                            )
                          ])
                        : Column(
                            children: [
                              Center(
                                child: Container(
                                  child: Text(
                                    "﹏﹏ 𝙔𝙤𝙪𝙧 𝙀𝙛𝙛𝙤𝙧𝙩𝙨 ﹏﹏",
                                    style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              blurRadius: 10,
                                              offset: Offset(8, 4)),
                                        ],
                                        fontSize: 30,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          blurRadius: 25,
                                          offset: Offset(-5, 20)),
                                    ],
                                    gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 6, 110, 255),
                                          Color.fromARGB(220, 255, 63, 63),
                                          Colors.purple,
                                          Colors.black
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight),
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white),
                                child: Table(
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment
                                          .middle, // for middle of china
                                  border: TableBorder.all(
                                    width: 5,
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  children: [
                                    TableRow(children: [
                                      Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Center(
                                            child: Text(
                                          "①",
                                          style: TextStyle(
                                              fontSize: 55,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        )),
                                      ),
                                      Container(
                                        child: Image(
                                          image: AssetImage(
                                              'assets/number$num_4.png'),
                                        ),
                                        height: 90,
                                      ),
                                      Container(
                                        child: Image(
                                          image: AssetImage(
                                              'assets/number$num_5.png'),
                                        ),
                                        height: 90,
                                      ),
                                      Container(
                                        child: Image(
                                          image: AssetImage(
                                              'assets/number$num_6.png'),
                                        ),
                                        height: 90,
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Center(
                                            child: Text(
                                          "②",
                                          style: TextStyle(
                                              fontSize: 55,
                                              fontFamily: "FakeHopeFilled",
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        )),
                                      ),
                                      Container(
                                        child: Image(
                                          image: AssetImage(
                                              'assets/number$num_7.png'),
                                        ),
                                        height: 90,
                                      ),
                                      Container(
                                        child: Image(
                                          image: AssetImage(
                                              'assets/number$num_8.png'),
                                        ),
                                        height: 90,
                                      ),
                                      Container(
                                        child: Image(
                                          image: AssetImage(
                                              'assets/number$num_9.png'),
                                        ),
                                        height: 90,
                                      ),
                                    ]),
                                    TableRow(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Center(
                                              child: Text(
                                            "③",
                                            style: TextStyle(
                                                fontSize: 55,
                                                fontFamily: "FakeHopeFilled",
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          )),
                                        ),
                                        Container(
                                          child: Image(
                                            image: AssetImage(
                                                'assets/number$num_1.png'),
                                          ),
                                          height: 90,
                                        ),
                                        Container(
                                          child: Image(
                                            image: AssetImage(
                                                'assets/number$num_2.png'),
                                          ),
                                          height: 90,
                                        ),
                                        Container(
                                          child: Image(
                                            image: AssetImage(
                                                'assets/number$num_3.png'),
                                          ),
                                          height: 90,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: FloatingActionButton.large(
                  backgroundColor: Color.fromARGB(246, 249, 12, 12),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => Chance_Machine()),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.refresh,
                    size: 60,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}