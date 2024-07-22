import 'package:flutter/material.dart';
import 'package:mive_rasan/colors/colorpage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kgrey,
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                height: 130,
                decoration: BoxDecoration(
                    color: kpurple,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundImage: AssetImage("assets/images/nandagh.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("سید محمد آرمان خلیلی", style: style()),
                          Text("خریدار", style: style()),
                          Text("شماره صنفی", style: style()),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.newspaper_rounded,
                            color: kwhite,
                          ),
                          Icon(
                            Icons.person_add_alt_1_sharp,
                            color: kwhite,
                          ),
                          Icon(
                            Icons.room_service,
                            color: kwhite,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage("assets/images/shop.jpg"),
                      ),
                      Text(
                        "خرید بر اساس میدان",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.green.shade200,
                        backgroundImage: AssetImage("assets/images/fruit.png"),
                      ),
                      Text(
                        "خرید بر اساس میوه",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {},
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage("assets/images/call.png"),
                      ),
                      Text(
                        "تماس با ما",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {},
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.green.shade200,
                        backgroundImage:
                            AssetImage("assets/images/notification.jpg"),
                      ),
                      Text(
                        "اعلانات",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.maxFinite, 48)),
                child: Text(
                  "خروج از حساب کاربری",
                  style: style(),
                ))
          ],
        ),
      ),
    );
  }

  TextStyle style() {
    return TextStyle(
      fontSize: 18,
      color: kwhite,
      fontWeight: FontWeight.bold,
    );
  }
}
