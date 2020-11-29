import 'package:flutter/material.dart';
import 'index.dart';
import 'utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Libby',
       theme: ThemeData(
        
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: AppTheme.appColor.primaryVariant),
          actionsIconTheme:
              IconThemeData(color: AppTheme.appColor.primaryVariant),
          centerTitle: true,
          elevation: 0,
        ),
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:Index(),
    );
  }
}
