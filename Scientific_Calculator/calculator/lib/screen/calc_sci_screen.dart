import 'package:calculator/constants/color.dart';
import 'package:calculator/screen/unit_convertor_screen.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:calculator/screen/calc_ordinary_screen.dart';
import 'package:calculator/flutter-icons-5eb243ce/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class Calc_sci extends StatefulWidget {
  const Calc_sci({super.key});
  @override
  State<Calc_sci> createState() => _Calc_sciState();
}

class _Calc_sciState extends State<Calc_sci> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
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
  onclick(String value) {
    setState(() {
      if (_input.text.isEmpty &&
          (value == '+' ||
              value == '-' ||
              value == '×' ||
              value == '÷' ||
              value == 'x²')) {
        return;
      }

      if (value == "C") {
        _input.clear();
        output = "";
      } else if (value == "=") {
        if (_input.text.isEmpty) {
          return;
        }
        try {
          var userinput = _input.text;
          Parser parser = Parser();
          userinput = userinput
              .replaceAll("×", "*")
              .replaceAll("÷", "/")
              .replaceAll('x²', '^')
              .replaceAll('π', '${math.pi}');
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
      } else if (value == "+/-") {
        if (_input.text[0] != '-') {
          _input.text = '(-${_input.text}';
        } else {
          _input.text = _input.text.substring(1);
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
        switch (value) {
          case 'sin':
            _input.text += 'sin(';
            break;
          case 'cos':
            _input.text += 'cos(';
            break;
          case 'tan':
            _input.text += 'tan(';
            break;
          case '√':
            _input.text += 'sqrt(';
            break;
          case '1/x':
            _input.text += '1 ÷ ';
            break;
          case 'x²':
            _input.text += '^(2)';
          case '|x|':
            _input.text += 'abs(';
          case 'ln':
            _input.text += 'ln(';
          case 'Asin':
            _input.text += 'arcsin(';
          case 'Acos':
            _input.text += 'arccos(';
          default:
            _input.text += value;
        }
      }
    });
  }

  Widget cal_button(String text, Color f_color, Color b_color,
      {double fontsize = 15}) {
    return Expanded(
      child: Center(
        child: Container(
          width: 100,
          height: 40,
          padding: const EdgeInsets.all(5),
          child: OutlinedButton(
            onPressed: () => onclick(text),
            style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 0),
                foregroundColor: f_color,
                backgroundColor: b_color),
            child: Text(
              text,
              style: TextStyle(fontSize: fontsize, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFormField(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        textAlign: TextAlign.end,
                        controller: _input,
                        cursorHeight: 25,
                        readOnly: true,
                        autofocus: true,
                        style: const TextStyle(color: kwhite, fontSize: 20),
                        showCursor: true,
                        cursorColor: kgreen,
                      ),
                      Text(
                        output,
                        style: const TextStyle(color: kwhite54, fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 45),
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
                                  builder: (context) =>
                                      const Calc_ord_screen()));
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
                color: Colors.white30,
              ),
            ),
            Row(
              children: [
                cal_button("√", kwhite, kwhite12),
                cal_button("x²", kwhite, kwhite12),
                cal_button("C", kred, kwhite12),
                cal_button("( )", kgreen, kwhite12),
                cal_button("%", kgreen, kwhite12),
                cal_button("÷", kgreen, kwhite12, fontsize: 18),
              ],
            ),
            Row(
              children: [
                cal_button("Asin", kwhite, kwhite12),
                cal_button("sin", kwhite, kwhite12),
                cal_button("7", kwhite, kwhite12),
                cal_button("8", kwhite, kwhite12),
                cal_button("9", kwhite, kwhite12),
                cal_button("×", kgreen, kwhite12, fontsize: 18),
              ],
            ),
            Row(
              children: [
                cal_button("Acos", kwhite, kwhite12),
                cal_button("cos", kwhite, kwhite12),
                cal_button("4", kwhite, kwhite12),
                cal_button("5", kwhite, kwhite12),
                cal_button("6", kwhite, kwhite12),
                cal_button("-", kgreen, kwhite12, fontsize: 25),
              ],
            ),
            Row(
              children: [
                cal_button("|x|", kwhite, kwhite12),
                cal_button("tan", kwhite, kwhite12),
                cal_button("1", kwhite, kwhite12),
                cal_button("2", kwhite, kwhite12),
                cal_button("3", kwhite, kwhite12),
                cal_button("+", kgreen, kwhite12, fontsize: 18),
              ],
            ),
            Row(
              children: [
                cal_button("π", kwhite, kwhite12),
                cal_button("1/x", kwhite, kwhite12),
                cal_button("+/-", kwhite, kwhite12, fontsize: 15),
                cal_button("0", kwhite, kwhite12),
                cal_button(".", kwhite, kwhite12),
                cal_button("=", kblack, kgreen, fontsize: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
