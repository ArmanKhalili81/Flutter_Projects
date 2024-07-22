import 'package:flutter/material.dart';
import 'package:web_with_getx/constants.dart';
import 'package:web_with_getx/widgets/custom_tab_bar.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: kblack,
      child: loaddata(),
    );
  }

  Widget loaddata() {
    if (size.width < kMediumsize) {
      return Row(
        children: [
          const Spacer(),
          Image.asset("image/logo_lg.png"),
          const Spacer(
            flex: 3,
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
            color: Colors.white,
          ),
          const Spacer(),
        ],
      );
    } else if (size.width < kLargesize) {
      return Row(
        children: [
          const Spacer(),
          Image.asset("image/logo_lg.png"),
          const Spacer(
            flex: 2,
          ),
          const Tabbar(),
          const Spacer(),
        ],
      );
    } else {
      return Row(
        children: [
          const Spacer(),
          Image.asset("image/logo_lg.png"),
          const Spacer(
            flex: 3,
          ),
          const Tabbar(),
          const Spacer(),
        ],
      );
    }
  }
}
