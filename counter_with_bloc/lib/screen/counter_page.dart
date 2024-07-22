import 'package:counter_bloc/bloc/counterbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final Counterbloc bloc = Counterbloc();
  final TextEditingController textEditingController = TextEditingController();
  bool emptycheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Counter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            BlocBuilder<Counterbloc, int>(
              bloc: bloc,
              builder: (context, state) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      (bloc.state == 0) ? null : bloc.decreament();
                    },
                    icon: Icon(
                      color: Colors.white,
                      Icons.remove,
                      size: 30,
                    ),
                  ),
                  Center(
                      child: (bloc.state == 0)
                          ? Text("")
                          : Text(
                              "${bloc.state - 1}",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 25),
                            )),
                  Center(
                    child: Text(
                      "${bloc.state}",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  Center(
                    child: Text(
                      "${bloc.state + 1}",
                      style: TextStyle(color: Colors.white70, fontSize: 25),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      bloc.increament();
                    },
                    icon: Icon(
                      color: Colors.white,
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () {
                bloc.reset();
              },
              child: const Icon(
                Icons.refresh,
                size: 45,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: TextFormField(
                maxLength: 4,
                onChanged: (value) {
                  if (textEditingController.text.isEmpty) {
                    setState(() {
                      emptycheck = true;
                    });
                  } else
                    setState(() {
                      emptycheck = false;
                    });
                },
                controller: textEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (emptycheck)
                    ? null
                    : () {
                        bloc.refresh(
                            int.tryParse(textEditingController.text) ?? 0);
                      },
                style: ElevatedButton.styleFrom(
                  elevation: 8,
                  shadowColor: Colors.white,
                  fixedSize: const Size(200, 50),
                  shape: const StadiumBorder(),
                ),
                child: const Text("Submit")),
          ],
        ),
      ),
    );
  }
}
