import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Color.fromARGB(255, 22, 94, 54),
        title: Text("App",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        centerTitle: true,
        shape: StadiumBorder(),
      ),
      bottomNavigationBar: ConvexAppBar(
        height: 55,
        elevation: 10,
        gradient: LinearGradient(colors: [Colors.pink, Colors.orange.shade400]),
        items: [
          TabItem(
              icon: Icons.email_outlined,
              title: "Gmail",
              activeIcon: Icons.email),
          TabItem(
              icon: Icons.map_outlined, title: "Map", activeIcon: Icons.map),
          TabItem(
              icon: Icons.home_outlined, title: "Home", activeIcon: Icons.home),
          TabItem(
              icon: Icons.phone_outlined,
              title: "Phone",
              activeIcon: Icons.phone),
          TabItem(
              icon: Icons.person_outline,
              title: "Information",
              activeIcon: Icons.person)
        ],
        initialActiveIndex: 2,
        style: TabStyle.reactCircle,
        activeColor: Colors.white,
        color: Colors.white,
        backgroundColor: Color.fromARGB(255, 248, 57, 4),
        onTap: (int i) {
          Switch(i);
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/paeez.jpg"), fit: BoxFit.cover),
        ),
      ),
    );
  }

  void Switch(int num) {
    // switch (num) {
    //   case 0:
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => Scaffold(
    //           appBar: AppBar(
    //             title: Text("Gmail"),
    //             centerTitle: true,
    //           ),
    //         ),
    //       ),
    //     );
    //     break;
    //   case 1:
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => Scaffold(
    //           appBar: AppBar(
    //             title: Text("Map"),
    //             centerTitle: true,
    //           ),
    //         ),
    //       ),
    //     );
    //     break;
    //   case 2:
    //     break;
    //   case 3:
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => Scaffold(
    //           appBar: AppBar(
    //             title: Text("Phone"),
    //             centerTitle: true,
    //           ),
    //         ),
    //       ),
    //     );
    //     break;
    //   case 4:
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => Scaffold(
    //           appBar: AppBar(
    //             title: Text("Information"),
    //             centerTitle: true,
    //           ),
    //         ),
    //       ),
    //     );
    //     break;
    // }
  }
}
