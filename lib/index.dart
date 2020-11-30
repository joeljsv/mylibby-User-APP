import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mylibby/screens/profile/profile.dart';
import 'package:mylibby/screens/scan/scan.dart';
import 'package:mylibby/utils/theme.dart';

import 'screens/home/home.dart';
import 'utils/widgets/appbar.dart';

// class Index extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBar(),
//     );
//   }

// }

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _currentIndex = 0;
  final List<Widget> screen = [
    HomeScreen(),
    HomeScreen(
      isOder: true,
    ),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: screen[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            activeColor: AppTheme.appColor.primary,
            icon: Icon(Icons.home),
            title: Text('Home'),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            activeColor: AppTheme.appColor.primary,
            icon: Icon(LineAwesomeIcons.book),
            title: Text('Orders'),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            activeColor: AppTheme.appColor.primary,
            icon: Icon(Icons.person),
            title: Text(
              'Profile',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        isExtended: false,
        child: Icon(Icons.add),
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (ctx)=>CodeScan())),
      ),
    );
  }
}
