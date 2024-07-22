import 'package:dio_json_teach/DioClient.dart';
import 'package:dio_json_teach/User.dart';
import 'package:dio_json_teach/getinform.dart';
import 'package:dio_json_teach/postinform.dart';
import 'package:flutter/material.dart';

class DioTest extends StatefulWidget {
  const DioTest({Key? key}) : super(key: key);

  @override
  State<DioTest> createState() => _DioTestState();
}

class _DioTestState extends State<DioTest> {
  Dioclient _dioclient = Dioclient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All User Information"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          FutureBuilder<User?>(
              future: _dioclient.getAlluserdata(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return showlist(snapshot);
                } else {
                  return ElevatedButton(
                    child: Text("Try"),
                    onPressed: () {},
                  );
                }
              }),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 10,
                fixedSize: Size(200, 40),
                shape: StadiumBorder(),
                primary: Color.fromARGB(255, 12, 150, 160)),
            onPressed: () {
              postinform();
            },
            child: Text(
              "Create User",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  getinform(String? id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Getinform(id),
      ),
    );
  }

  postinform() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Postinform(),
      ),
    );
  }

  showlist(AsyncSnapshot snapshot) {
    return (snapshot.hasData)
        ? Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(5),
              itemCount: snapshot.data!.dataList!.length,
              itemBuilder: (context, index) => InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  getinform("${snapshot.data!.dataList![index]!.id}");
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 3, color: Color.fromARGB(255, 248, 201, 16)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                            "${snapshot.data!.dataList![index]!.avatar}"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "${snapshot.data!.dataList![index]!.first_name}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 251, 77, 67)),
                      ),
                    ],
                  ),
                ),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 5, crossAxisCount: 3, mainAxisSpacing: 8),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
