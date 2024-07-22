import 'package:calculator/constants/color.dart';
import 'package:calculator/flutter-icons-5eb243ce/my_flutter_app_icons.dart';
import 'package:calculator/screen/calc_sci_screen.dart';
import 'package:calculator/screen/unit_convertor_screen.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Calc_ord_screen extends StatefulWidget {
  const Calc_ord_screen({super.key});

  @override
  State<Calc_ord_screen> createState() => _Calc_ord_screenState();
}

class _Calc_ord_screenState extends State<Calc_ord_screen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  TextEditingController _input = TextEditingController();
  String output = "";
  Expression? exp;
  ContextModel cm = ContextModel();
  double? eval;
  calculate() {
    try {
      var userinput = _input.text;
      Parser parser = Parser();
      userinput = userinput.replaceAll("×", "*").replaceAll("÷", "/");
      exp = parser.parse(userinput);
      eval = exp!.evaluate(EvaluationType.REAL, cm);
      if (eval.toString() == output) {
        return;
      } else {
        output = "";
        output += eval.toString();
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Invalid Operation",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: kwhite10,
          textColor: kwhite,
          fontSize: 18.0);
    }
  }

  onclick(String value) {
    setState(() {
      if ((_input.text.isEmpty || _input.text.startsWith('(')) &&
          (value == '+' || value == '-' || value == '×' || value == '÷')) {
        return;
      }
      if (value == "C") {
        _input.clear();
        output = "";
      } else if (value == "=") {
        if (_input.text.isEmpty) {
          return;
        }
        calculate();
      } else if (value == "+/-") {
        if (_input.text[0] != '-') {
          _input.text = '(-${_input.text}';
        } else {
          _input.text = _input.text.substring(0);
        }
      } else if (value == "( )") {
        if (value.isEmpty) {
          _input.text += '($_input';
        } else if (_input.text.contains('(')) {
          _input.text += ')';
        } else {
          _input.text += '(';
        }
      } else {
        if ((_input.text.endsWith("+") ||
                _input.text.endsWith("-") ||
                _input.text.endsWith("×") ||
                _input.text.endsWith("÷") ||
                _input.text.endsWith("%")) &&
            !(value.contains(RegExp(r'[0-9]')))) {
          return;
        } else {
          _input.text += value;
        }
      }
    });
  }

  Widget cal_button(String text, Color f_color, Color b_color,
      {double fontsize = 30}) {
    return Expanded(
      child: Container(
        height: 95,
        padding: const EdgeInsets.all(5),
        child: OutlinedButton(
          onPressed: () => onclick(text),
          style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 0),
              foregroundColor: f_color,
              backgroundColor: b_color),
          child: Text(
            text,
            style: TextStyle(fontSize: fontsize, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: kblack,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(border: InputBorder.none),
                    textAlign: TextAlign.end,
                    controller: _input,
                    cursorHeight: 40,
                    readOnly: true,
                    autofocus: true,
                    style: const TextStyle(color: kwhite, fontSize: 35),
                    showCursor: true,
                    cursorColor: kgreen,
                  ),
                  Text(
                    output,
                    style: const TextStyle(
                        color: kwhite54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Calc_sci()));
                      },
                      highlightColor: kwhite54,
                      icon: const Icon(
                        Icons.calculate_outlined,
                        color: kwhite,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Unitconvertor()));
                      },
                      icon: const Icon(MyFlutterApp.ruler_horizontal),
                      color: kwhite,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (_input.text.isEmpty) {
                        return;
                      } else {
                        _input.text =
                            _input.text.substring(0, _input.text.length - 1);

                        if (_input.text.isEmpty ||
                            _input.text.endsWith("+") ||
                            _input.text.endsWith("-") ||
                            _input.text.endsWith("×") ||
                            _input.text.endsWith("÷") ||
                            _input.text.endsWith("%")) {
                          output = "";
                          return;
                        }
                        calculate();
                      }
                    });
                  },
                  highlightColor: Colors.white54,
                  icon: const Icon(Icons.backspace_outlined,
                      color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(23, 0, 23, 0),
            child: Divider(
              thickness: 2,
              color: kwhite30,
            ),
          ),
          Row(
            children: [
              cal_button("C", kred, kwhite12),
              cal_button("( )", kgreen, kwhite12),
              cal_button("%", kgreen, kwhite12),
              cal_button(
                "÷",
                kgreen,
                kwhite12,
              ),
            ],
          ),
          Row(
            children: [
              cal_button("7", kwhite, kwhite12),
              cal_button("8", kwhite, kwhite12),
              cal_button("9", kwhite, kwhite12),
              cal_button("×", kgreen, kwhite12),
            ],
          ),
          Row(
            children: [
              cal_button("4", kwhite, kwhite12),
              cal_button("5", kwhite, kwhite12),
              cal_button("6", kwhite, kwhite12),
              cal_button('-', kgreen, kwhite12, fontsize: 35),
            ],
          ),
          Row(
            children: [
              cal_button("1", kwhite, kwhite12),
              cal_button("2", kwhite, kwhite12),
              cal_button("3", kwhite, kwhite12),
              cal_button("+", kgreen, kwhite12),
            ],
          ),
          Row(
            children: [
              cal_button("+/-", kwhite, kwhite12, fontsize: 25),
              cal_button("0", kwhite, kwhite12),
              cal_button(".", kwhite, kwhite12),
              cal_button("=", kblack, kgreen, fontsize: 45),
            ],
          ),
        ],
      ),
    );
  }
}
