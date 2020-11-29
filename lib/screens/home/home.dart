import 'package:flutter/material.dart';
import 'package:mylibby/utils/theme.dart';
import 'package:mylibby/utils/widgets/headText.dart';
import 'package:mylibby/utils/widgets/searchBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headText("Avilable Books!"),
          searchBar("Search in books"),
        ],
      ),
    );
  }

 
}
