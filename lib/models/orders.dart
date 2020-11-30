import 'package:mylibby/models/books.dart';

class Orders {
  String status;
  String sId;
  Books book;

  Orders({
    this.status,
    this.sId,
    this.book,
  });
    Orders.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sId = json['_id'];
    book = json['book'] != null ? new Books.fromJson(json['book']) : null;
  }
}
