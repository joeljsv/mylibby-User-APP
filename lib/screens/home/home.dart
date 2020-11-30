import 'package:flutter/material.dart';
import 'package:mylibby/utils/widgets/headText.dart';
import 'package:mylibby/utils/widgets/searchBar.dart';
import 'package:mylibby/widgets/home/booklist.dart';

class HomeScreen extends StatelessWidget {
  final bool isOder;

  const HomeScreen({Key key, this.isOder = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headText(isOder ? "My Orders!" : "Avilable Books!"),
          if (!isOder) searchBar("Search in books"),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: isOder
                ? BookList(
                    isOrder: true,
                  )
                : BookList(),
          ),
        ],
      ),
    );
  }
}
