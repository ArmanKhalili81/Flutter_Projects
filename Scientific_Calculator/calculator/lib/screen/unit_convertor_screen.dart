import 'package:calculator/constants/color.dart';
import 'package:calculator/screen/calc_ordinary_screen.dart';
import 'package:calculator/screen/length_convertor.dart';
import 'package:calculator/screen/mass_convertor.dart';
import 'package:calculator/screen/time_convertor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Unitconvertor extends StatefulWidget {
  const Unitconvertor({super.key});

  @override
  State<Unitconvertor> createState() => _UnitconvertorState();
}

class _UnitconvertorState extends State<Unitconvertor>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  String to = list_mass.first;
  String from = list_mass.first;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: kblack,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Calc_ord_screen()));
            },
            color: kwhite,
          ),
          backgroundColor: Colors.transparent,
          bottom: const TabBar(
            unselectedLabelColor: kwhite38,
            dividerColor: kwhite30,
            labelColor: kwhite,
            indicatorColor: kwhite,
            tabs: [
              Tab(
                text: "Mass",
              ),
              Tab(
                text: "Length",
              ),
              Tab(
                text: "Time",
              ),
            ],
          ),
          title: const Text(
            'Unit convertor',
            style: TextStyle(color: kwhite),
          ),
        ),
        body: TabBarView(
          children: [MassConvertor(), LengthConvertor(), TimeConvertor()],
        ),
      ),
    );
  }
}
