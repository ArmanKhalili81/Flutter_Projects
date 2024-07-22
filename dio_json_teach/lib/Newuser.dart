class NewUser {
  NewUser({
    required this.name,
    required this.job,
    this.id,
    this.createdAt,
    this.updatedAt,
  });
  String? id;
  String? name;
  String? job;
  String? createdAt;
  String? updatedAt;
  NewUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
