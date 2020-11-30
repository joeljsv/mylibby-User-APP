import 'package:flutter/material.dart';
import 'package:mylibby/Provider/book_provider.dart';
import 'package:mylibby/Provider/order_provider.dart';
import 'package:mylibby/Provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'index.dart';
import 'screens/auth/login.dart';
import 'utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => AuthUser()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
        home: LoginPage(),
      ),
    );
  }
}
