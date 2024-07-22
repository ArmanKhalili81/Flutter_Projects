import 'package:calculator/constants/color.dart';
import 'package:calculator/screen/calc_ordinary_screen.dart';
import 'package:flutter/material.dart';

class TimeConvertor extends StatefulWidget {
  const TimeConvertor({super.key});

  @override
  State<TimeConvertor> createState() => _TimeConvertorState();
}

const List<String> list_Time = <String>['Seconds', 'Minutes', 'Hourse', 'Days'];

class _TimeConvertorState extends State<TimeConvertor> {
  String dropdownValue_1 = list_Time.first;
  String dropdownValue_2 = list_Time.first;

  final TextEditingController _input = TextEditingController();
  final TextEditingController _output = TextEditingController();
  String to = list_Time.first;
  String from = list_Time.first;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: DropdownButton<String>(
                    value: dropdownValue_1,
                    icon: const Icon(
                      Icons.arrow_drop_down_rounded,
                      color: kwhite,
                    ),
                    dropdownColor: kblack,
                    alignment: AlignmentDirectional.topStart,
                    elevation: 16,
                    style: const TextStyle(color: kwhite, fontSize: 18),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        from = value!;
                        dropdownValue_1 = value;
                        Calculate(_input.text);
                      });
                    },
                    items:
                        list_Time.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.end,
                  controller: _input,
                  cursorHeight: 35,
                  readOnly: true,
                  autofocus: true,
                  style: const TextStyle(color: kwhite, fontSize: 25),
                  showCursor: true,
                  cursorColor: kgreen,
                ),
                const Divider(
                  thickness: 2,
                  color: kwhite30,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: DropdownButton<String>(
                    value: dropdownValue_2,
                    icon: const Icon(
                      Icons.arrow_drop_down_rounded,
                      color: kwhite,
                    ),
                    dropdownColor: kblack,
                    elevation: 16,
                    style: const TextStyle(color: kwhite, fontSize: 18),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        to = value!;
                        dropdownValue_2 = value;
                        Calculate(_input.text);
                      });
                    },
                    items:
                        list_Time.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.end,
                  controller: _output,
                  cursorHeight: 35,
                  readOnly: true,
                  style: const TextStyle(color: kwhite, fontSize: 20),
                  showCursor: true,
                  cursorColor: kgreen,
                ),
                const Divider(
                  thickness: 2,
                  color: kwhite30,
                ),
              ],
            ),
          ),
        ),
      ),
      Row(
        children: [
          cal_digit_button("7", kwhite, kwhite12),
          cal_digit_button("8", kwhite, kwhite12),
          cal_digit_button("9", kwhite, kwhite12),
          cal_digit_button("⌫", kgreen, kwhite12, fontsize: 25),
        ],
      ),
      Row(
        children: [
          cal_digit_button("4", kwhite, kwhite12),
          cal_digit_button("5", kwhite, kwhite12),
          cal_digit_button("6", kwhite, kwhite12),
          cal_digit_button("C", kred, kwhite12),
        ],
      ),
      Row(
        children: [
          cal_digit_button("1", kwhite, kwhite12),
          cal_digit_button("2", kwhite, kwhite12),
          cal_digit_button("3", kwhite, kwhite12),
          Expanded(
            child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Calc_ord_screen()));
                },
                style: OutlinedButton.styleFrom(
                    fixedSize: const Size(23, 75),
                    side: const BorderSide(width: 2),
                    backgroundColor: kwhite12),
                child: const Icon(
                  Icons.calculate,
                  color: kwhite,
                )),
          ),
        ],
      ),
      Row(
        children: [
          cal_digit_button(" ", kwhite, kwhite12, fontsize: 25),
          cal_digit_button("0", kwhite, kwhite12),
          cal_digit_button(".", kwhite, kwhite12),
          cal_digit_button(" ", kwhite, kwhite12),
        ],
      ),
    ]);
  }

  Widget cal_digit_button(String text, Color f_color, Color b_color,
      {double fontsize = 30}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          onPressed: () => onclick(text),
          style: OutlinedButton.styleFrom(
              fixedSize: Size(23, 75),
              side: BorderSide.none,
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

  onclick(String value) {
    setState(() {
      if (value == "C") {
        _input.clear();
        _output.clear();
      } else if (value == "⌫") {
        if (_input.text.isEmpty) {
          return;
        } else {
          _input.text = _input.text.substring(0, _input.text.length - 1);
          Calculate(_input.text);
          if (_input.text.isEmpty) {
            _output.text = "";
          }
        }
      } else {
        _input.text += value;
        Calculate(_input.text);
      }
    });
  }

  void Calculate(String value) {
    double val;
    //['Seconds','Minutes','Hourse','Days]

    setState(() {
      if (value.isNotEmpty) {
        val = double.parse(value);
      } else {
        return;
      }
      //S to M and reverse
      if (from == 'Seconds' && to == 'Minutes') {
        val *= 0.016;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      } else if (from == 'Minutes' && to == 'Seconds') {
        val *= 60;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      }
      //S to H and reverse
      if (from == 'Seconds' && to == 'Hourse') {
        val *= 0.00027;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      } else if (from == 'Hourse' && to == 'Seconds') {
        val *= 3600;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      }
      //S to Day and reverse
      if (from == 'Seconds' && to == 'Days') {
        val *= 0.0000115741;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      } else if (from == 'Days' && to == 'Seconds') {
        val *= 86400;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      }
      //M to H and reverse
      if (from == 'Minutes' && to == 'Hourse') {
        val *= 0.016;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      } else if (from == 'Hourse' && to == 'Minutes') {
        val *= 60;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      }
      //M to Day and reverse
      if (from == 'Minutes' && to == 'Days') {
        val *= 0.000694;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      } else if (from == 'Days' && to == 'Minutes') {
        val *= 1440;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      }
      //H to Day and reverse
      if (from == 'Hourse' && to == 'Days') {
        val *= 0.0416;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      } else if (from == 'Days' && to == 'Hourse') {
        val *= 24;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      } else {
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      }
    });
  }
}
