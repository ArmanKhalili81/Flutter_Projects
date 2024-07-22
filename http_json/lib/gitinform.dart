import 'dart:convert';

class Github {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;
  Github({
    this.id,
    this.email,
    this.first_name,
    this.last_name,
    this.avatar
  });

  Github.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    first_name = json['node_id'];
    last_name = json['avatar_url'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map();
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['avatar'] = avatar;
    return data;
  }
}
