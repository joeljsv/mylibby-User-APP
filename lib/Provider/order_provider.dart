import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mylibby/models/orders.dart';
import 'package:http/http.dart' as http;
import 'package:mylibby/utils/apis/API.dart';

class OrderProvider with ChangeNotifier {
  int count;
  String status;
  List<Orders> orders;
  final String url = API_URL;

  Future<List<Orders>> getOrders(String userID) async {
    final response = await http.get(url + "orders/$userID");
    final json = jsonDecode(response.body);
    List<Orders> order = [];
    count = json['count'];
    status = json['status'];
    if (json['orders'] != null) {
      orders = new List<Orders>();
      json['orders'].forEach((v) {
        order.add(new Orders.fromJson(v));
      });
    }
    orders = order.toList();
    return orders;
  }

  takeBook({String uid, String bookId, String userName}) async {
    try {
      final response = await http.post(url + "orders", body: {
        "userid": "$uid",
        "bookId": "$bookId",
        "username": "$userName",
      });
      if (response.statusCode != 201) throw "An error Occured";
    } catch (e) {
      throw e;
    }
  }
}
