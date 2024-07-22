class Data {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;
  Data({this.id, this.email, this.first_name, this.last_name, this.avatar});
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": first_name,
        "last_name": last_name,
        "avatar": avatar
      };
}
