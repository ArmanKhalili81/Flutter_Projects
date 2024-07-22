import 'package:darwer/main.dart';
import 'package:flutter/material.dart';

class DrawerUsing extends StatefulWidget {
  const DrawerUsing({Key? key}) : super(key: key);

  @override
  State<DrawerUsing> createState() => _DrawerUsingState();
}

class _DrawerUsingState extends State<DrawerUsing> {
  bool _switch = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Drawer"),
          centerTitle: true,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(226, 41, 132, 206),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/me.jpg"),
                    ),
                    Text(
                      "S.M.A.KH",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Text(
                      "+989130728277",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 243, 243)),
                    ),
                  ],
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 20),
                minLeadingWidth: 15,
                leading: Icon(
                  Icons.groups,
                  color: Color.fromARGB(245, 255, 139, 6),
                  size: 30,
                ),
                title: Text(
                  "New Group",
                  style: TextStyle(fontSize: 17, color: Colors.black54),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 20),
                minLeadingWidth: 15,
                leading: Icon(
                  Icons.speaker,
                  color: Color.fromARGB(255, 28, 137, 184),
                  size: 30,
                ),
                title: Text(
                  "New Channel",
                  style: TextStyle(fontSize: 17, color: Colors.black54),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 20),
                minLeadingWidth: 15,
                leading: Icon(
                  Icons.settings,
                  color: Color.fromARGB(255, 0, 0, 0),
                  size: 30,
                ),
                title: Text(
                  "Setting",
                  style: TextStyle(fontSize: 17, color: Colors.black54),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 20),
                minLeadingWidth: 15,
                leading: Icon(
                  Icons.contacts_rounded,
                  color: Color.fromARGB(171, 10, 207, 145),
                  size: 30,
                ),
                title: Text(
                  "Contacts",
                  style: TextStyle(fontSize: 17, color: Colors.black54),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 20),
                minLeadingWidth: 15,
                leading: Icon(
                  Icons.call,
                  color: Color.fromARGB(255, 30, 239, 37),
                  size: 30,
                ),
                title: Text(
                  "Calls",
                  style: TextStyle(fontSize: 17, color: Colors.black54),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 20),
                minLeadingWidth: 15,
                leading: Icon(
                  Icons.bookmark,
                  color: Color.fromARGB(255, 8, 191, 247),
                  size: 30,
                ),
                title: Text(
                  "Saved Messages",
                  style: TextStyle(fontSize: 17, color: Colors.black54),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 20),
                minLeadingWidth: 15,
                onTap: () {
                  setState(() {
                    _switch = !_switch;
                  });
                },
                leading: Icon(
                  Icons.nights_stay_rounded,
                  color: Color.fromARGB(255, 33, 98, 238),
                  size: 30,
                ),
                title: Text(
                  "Night Mode",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Switch(
                  value: _switch,
                  onChanged: (value) {
                    setState(
                      () {
                        _switch = value;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
