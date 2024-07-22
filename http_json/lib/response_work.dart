import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_json/gitinform.dart';

class GitHubInformation extends StatefulWidget {
  const GitHubInformation({Key? key}) : super(key: key);

  @override
  State<GitHubInformation> createState() => _GitHubInformationState();
}

class _GitHubInformationState extends State<GitHubInformation> {
  List<Github> _member = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Git Member Information"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Github>>(
        future: _loaddata(),
        builder: (context, snapshot) => snapshot.hasData
            ? GridView.builder(
                padding: EdgeInsets.all(5),
                itemCount: _member.length,
                itemBuilder: (context, index) => InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (context) => showalert(snapshot, index));
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          width: 3, color: Color.fromARGB(255, 249, 190, 14)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(
                              "${snapshot.data![index].avatar}"),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${snapshot.data![index].first_name}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5, crossAxisCount: 3, mainAxisSpacing: 8),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Future<List<Github>> _loaddata() async {
    const dataUrl = 'https://api.github.com/orgs/raywenderlich/members';
    final response = await http.get(Uri.parse(dataUrl));
    List l = json.decode(response.body);
    _member = l.map<Github>((e) => Github.fromJson(e)).toList();
    return _member;
  }

  showalert(AsyncSnapshot<List<Github>> snapshot, index) {}
}
