import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_using/screens/second_screen.dart';
import '../controller/firstcontroller.dart';

class Firstscreen extends StatefulWidget {
  Firstscreen({Key? key}) : super(key: key);
  static String id = '/firstpage';

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  final Firstcontroller firstcontroller = Get.put(Firstcontroller());

  final TextEditingController textEditingController = TextEditingController();

  bool emptycheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Text(
            "Counter",
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  firstcontroller.decrement();
                },
                icon: Icon(
                  color: Colors.white,
                  Icons.remove,
                  size: 30,
                ),
              ),
              Obx(() => Center(
                      child: GestureDetector(
                    onTap: () {
                      firstcontroller.ontap('/previous');
                    },
                    child: Text(
                      (firstcontroller.current.value == 0)
                          ? ""
                          : "${firstcontroller.previousvalue}",
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white70),
                    ),
                  ))),
              Obx(() => Center(
                      child: Text(
                    "${firstcontroller.current}",
                    style: const TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ))),
              Obx(() => Center(
                      child: GestureDetector(
                    onTap: () {
                      firstcontroller.ontap('/future');
                    },
                    child: Text(
                      (firstcontroller.current.value == 0)
                          ? "1"
                          : "${firstcontroller.futurevalue}",
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white70),
                    ),
                  ))),
              IconButton(
                onPressed: () {
                  firstcontroller.increment();
                },
                icon: Icon(
                  color: Colors.white,
                  Icons.add,
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () => firstcontroller.reset(),
            child: const Icon(
              Icons.refresh,
              size: 45,
              color: Colors.white,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          TextFormField(
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
                    borderRadius: BorderRadius.circular(25))),
          ).paddingAll(25),
          ElevatedButton(
              onPressed: (emptycheck)
                  ? null
                  : () {
                      firstcontroller
                          .submit(int.tryParse(textEditingController.text));
                    },
              style: ElevatedButton.styleFrom(
                elevation: 8,
                shadowColor: Colors.white,
                fixedSize: Size(200, 50),
                shape: StadiumBorder(),
              ),
              child: const Text("Submit")),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.move_up_outlined),
        onPressed: () {
          Get.toNamed(Secondscreen.id);
        },
      ),
    );
  }
}
