import 'package:flutter/material.dart';
import 'package:mylibby/Provider/book_provider.dart';
import 'package:mylibby/Provider/order_provider.dart';
import 'package:mylibby/models/books.dart';
import 'package:mylibby/models/orders.dart';
import 'package:mylibby/utils/widgets/essentials.dart';
import 'package:mylibby/utils/widgets/list.dart';
import 'package:provider/provider.dart';

class BookList extends StatelessWidget {
  final bool isOrder;

  const BookList({Key key, this.isOrder = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Books>> getBook() async {
      final List<Books> books =
          await Provider.of<BookProvider>(context, listen: false).getBook();
      return books;
    }

    Future<List<Orders>> getOrder() async {
      final List<Orders> orders =
          await Provider.of<OrderProvider>(context, listen: false)
              .getOrders("5fafae7b2bd8e70004695557");
      return orders;
    }

    return FutureBuilder(
        future: isOrder ? getOrder() : getBook(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return loading();
          else if (snapshot.hasError)
            return error();
          else {
            return isOrder ? orderList(snapshot.data) : bookList(snapshot.data);
          }
        });
  }

  bookList(List<Books> book) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: book.length,
      itemBuilder: (ctx, i) => ListBookView(
        title: book[i].name,
        subtitle: 'Category: ${book[i].cat}\n'
            'Price on Book: ${book[i].price}',
        author: 'Author: ${book[i].author}',
        publishDate:
            'Publish Date : ${DateTime.parse(book[i].addeddate).toString().split(" ")[0]}',
        readDuration: '${book[i].avilable ? "Avilable ✅" : "Not Avilable ❌"}',
      ),
    );
  }

  orderList(List<Orders> order) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: order.length,
      itemBuilder: (ctx, i) => ListBookView(
        title: order[i].status.toUpperCase(),
        subtitle: 'Book: ${order[i].book.name}\n'
            'Category: ${order[i].book.cat}',
        author: 'Author: ${order[i].book.author}',
        publishDate:
            'Return Date : ${DateTime.parse(order[i].book.addeddate).add(Duration(days: 20)).toString().split(" ")[0]}',
        readDuration:
            'Pick Date : ${DateTime.parse(order[i].book.addeddate).toString().split(" ")[0]}',
      ),
    );
  }
}
