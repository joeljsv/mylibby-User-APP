import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mylibby/models/books.dart';
import 'package:mylibby/utils/apis/API.dart';

class BookProvider with ChangeNotifier {
  final String url = API_URL;
  int count;
  List books = [];

  BookProvider({this.count, this.books});

  Future<List<Books>> getBook() async {
    final response = await http.get(url + "books");

    final data = jsonDecode(response.body);
    List<Books> book = [];
    count = data['count'];
    if (data['books'] != null) {
      data['books'].forEach(
        (v) {
          print(v);
          book.add(Books(
            avilable: v['avilable'],
            sId: v['_id'],
            name: v['name'],
            price: v['price'],
            author: v['author'],
            cat: v['cat'],
            addeddate: v['addeddate'],
            takenby: v['takenby'],
          ));
        },
      );
    }
    books = book.toList();
    return books;
  }
}
