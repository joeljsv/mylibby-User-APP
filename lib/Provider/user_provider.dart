import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mylibby/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:mylibby/utils/apis/API.dart';

class AuthUser with ChangeNotifier {
  String message;
  String token;
  User user;
  final String url = API_URL;
  AuthUser({this.message, this.token, this.user});

  loginUser(String email, String pass) async {
    final response = await http.post(url + "user/login", body: {
      "email": "$email",
      "password": "$pass",
    });
    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      message = json['message'];
      token = json['token'];
      user = json['user'] != null ? new User.fromJson(json['user']) : null;
    } else if (response.statusCode == 501) {
      message = json['message'];
      throw message;
    } else {
      throw "An Error Occured";
    }
  }
  User get usr=>user;
}
