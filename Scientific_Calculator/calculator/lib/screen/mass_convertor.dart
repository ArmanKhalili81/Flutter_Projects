import 'package:calculator/constants/color.dart';
import 'package:calculator/screen/calc_ordinary_screen.dart';
import 'package:flutter/material.dart';

class MassConvertor extends StatefulWidget {
  const MassConvertor({super.key});

  @override
  State<MassConvertor> createState() => _MassConvertorState();
}

const List<String> list_mass = <String>['Grams', 'Kilograms', 'Tons', 'Pounds'];

class _MassConvertorState extends State<MassConvertor> {
  String dropdownValue_1 = list_mass.first;
  String dropdownValue_2 = list_mass.first;

  final TextEditingController _input = TextEditingController();
  final TextEditingController _output = TextEditingController();
  String to = list_mass.first;
  String from = list_mass.first;
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
                        list_mass.map<DropdownMenuItem<String>>((String value) {
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
                        list_mass.map<DropdownMenuItem<String>>((String value) {
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
    //['Grams', 'Kilograms', 'Tons', 'Pounds']

    setState(() {
      if (value.isNotEmpty) {
        val = double.parse(value);
      } else {
        return;
      }
      //Gr to Kg and reverse
      if (from == 'Grams' && to == 'Kilograms') {
        val /= 1000;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      } else if (from == 'Kilograms' && to == 'Grams') {
        val *= 1000;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      }
      //Kg to Tons and reverse
      if (from == 'Kilograms' && to == 'Tons') {
        val /= 1000;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      } else if (from == 'Tons' && to == 'Kilograms') {
        val *= 1000;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      }
      //Gr to Tons and reverse
      if (from == 'Grams' && to == 'Tons') {
        val /= 1000000;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      } else if (from == 'Tons' && to == 'Grams') {
        val *= 1000000;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      }
      //Gr to Pounds and reverse
      if (from == 'Grams' && to == 'Pounds') {
        val *= 0.0022046226;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      } else if (from == 'Pounds' && to == 'Grams') {
        val *= 453.59237;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      }
      //Kg to Pounds and reverse
      if (from == 'Kilograms' && to == 'Pounds') {
        val *= 2.2046226218;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      } else if (from == 'Pounds' && to == 'Kilograms') {
        val *= 0.45359237;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      }
      //Pounds to Tons and reverse
      if (from == 'Pounds' && to == 'Tons') {
        val *= 0.00045;
        if (val.toString().endsWith('.0')) {
          _output.text = '$val'.substring(0, '$val'.length - 2);
        } else {
          _output.text = '$val';
        }
      } else if (from == 'Tons' && to == 'Pounds') {
        val *= 2204.622;
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
