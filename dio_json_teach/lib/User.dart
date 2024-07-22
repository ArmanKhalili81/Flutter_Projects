import 'Data.dart';

class User {
  Data? data;
  List<Data?>? dataList;
  User({
    this.data,
  });
  User.fromJson(Map<String, dynamic> json) {
    if (json["data"] is List) {
      dataList = json["data"].map<Data>((e) => Data.fromJson(e)).toList();
    } else {
      data = Data.fromJson(json["data"]);
    }
  }
  Map<String, dynamic> toJson() => {"data": data!.toJson()};
}
