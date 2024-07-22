import 'package:define_task/taskview.dart';
import 'package:flutter/material.dart';

class DefineTask extends StatefulWidget {
  const DefineTask({Key? key}) : super(key: key);

  @override
  State<DefineTask> createState() => _DefineTaskState();
}

class _DefineTaskState extends State<DefineTask> {
  TextEditingController textAlertEditingController = TextEditingController();
  List<TaskView> box = [];
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Task"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await _showAddDialog();
            setState(() {
              if (textAlertEditingController.text.isNotEmpty) {
                box.add(
                  TaskView(task: textAlertEditingController.text, check: false),
                );
              }
              textAlertEditingController.clear();
            });
          },
          elevation: 10,
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        body: ListView.builder(
          itemCount: box.length,
          itemBuilder: (contex, index) => GestureDetector(
            onTap: () {
              setState(() {
                box[index].check = !box[index].check;
              });
            },
            child: Card(
              shape: StadiumBorder(),
              elevation: 5,
              margin: EdgeInsets.all(20),
              child: ListTile(
                title: Align(
                    alignment: Alignment.centerRight,
                    child: Text(box[index].task)),
                leading: (box[index].check)
                    ? Icon(
                        Icons.check_box,
                        color: Colors.blueAccent,
                      )
                    : Icon(Icons.check_box_outline_blank),
              ),
            ),
          ),
        ),
      );

  _showAddDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("New Task"),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        content: TextField(
          controller: textAlertEditingController,
          minLines: 1,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "Enter Your Task ...",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                TaskView(
                  task: textAlertEditingController.text,
                  check: false,
                );
              },
              child: Text("Add"),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                fixedSize: Size(100, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
