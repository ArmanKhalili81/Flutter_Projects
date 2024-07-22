import 'package:dio/dio.dart';
import 'package:dio_json_teach/Newuser.dart';
import 'package:flutter/material.dart';
import 'User.dart';

class Dioclient {
  Dio dio = Dio(BaseOptions(baseUrl: "https://reqres.in/api"));

  Future<User> getuserdata(String? id) async {
    Response response = await dio.get('/users/$id');
    User user = User.fromJson(response.data);
    print(response.data);

    return user;
  }

  Future<NewUser> postuserdata(NewUser newUser) async {
    Response response = await dio.post('/users', data: newUser.toJson());
    NewUser userinformation = NewUser.fromJson(response.data);
    print(response.data);

    return userinformation;
  }

  Future<User?> getAlluserdata() async {
    Response response = await dio.get('/users');
    User users = User.fromJson(response.data);
    return users;
  }
}
