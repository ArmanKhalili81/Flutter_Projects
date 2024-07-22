import 'package:flutter/material.dart';

class StackUsing extends StatefulWidget {
  const StackUsing({Key? key}) : super(key: key);

  @override
  State<StackUsing> createState() => _StackUsingState();
}

class _StackUsingState extends State<StackUsing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/paeez.jpg"), fit: BoxFit.cover),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/paeez.jpg",
                        image: "https://picsum.photos/200/300",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 250,
                      height: 150,
                      color: Colors.black.withOpacity(.5),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: style1(),
                          children: [
                            TextSpan(
                              text: "اشتیاقی که به دیدار تو دارد",
                            ),
                            TextSpan(
                              text: " دل",
                              style: style2(),
                            ),
                            TextSpan(text: "  من"),
                            TextSpan(
                              text: "\nدل",
                              style: style2(),
                            ),
                            TextSpan(
                                text: "  من داند و من دانم و", style: style1()),
                            TextSpan(
                              text: "  دل",
                              style: style2(),
                            ),
                            TextSpan(text: "  داند و من"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle style1() {
    return TextStyle(
        fontFamily: "Thuluth", fontSize: 20, fontWeight: FontWeight.bold);
  }

  TextStyle style2() {
    return TextStyle(
        fontFamily: "IranNastaliq", color: Colors.amber, fontSize: 25);
  }
}
