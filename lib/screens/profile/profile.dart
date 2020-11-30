import 'package:flutter/material.dart';
import 'package:mylibby/Provider/user_provider.dart';
import 'dart:ui' as ui;

import 'package:mylibby/models/user.dart';
import 'package:mylibby/screens/auth/login.dart';
import 'package:mylibby/utils/theme.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final User user = Provider.of<AuthUser>(context, listen: false).usr;
    final String imgUrl =
        'https://dunnvision.com/files/2019/05/Profile-512.png';

    return new Stack(
      children: <Widget>[
        new Container(
          color: Colors.white,
        ),
        // new Image.network(
        //   imgUrl,
        //   fit: BoxFit.fill,
        // ),
        // new BackdropFilter(
        //     filter: new ui.ImageFilter.blur(
        //       sigmaX: 6.0,
        //       sigmaY: 6.0,
        //     ),
        //     child: new Container(
        //       decoration: BoxDecoration(
        //         color: Colors.white.withOpacity(0.9),
        //         borderRadius: BorderRadius.all(Radius.circular(50.0)),
        //       ),
        //     )),
        Center(
          child: new Column(
            children: <Widget>[
              new SizedBox(
                height: _height / 12,
              ),
              new CircleAvatar(
                backgroundColor: Colors.white,
                radius: _width < _height ? _width / 4 : _height / 4,
                backgroundImage: NetworkImage(imgUrl),
              ),
              new SizedBox(
                height: _height / 25.0,
              ),
              new Text(
                user.name + " " + user.lastname,
                style: AppTheme.textTheme.headline2.copyWith(fontSize: 30),
              ),
              new Padding(
                padding: new EdgeInsets.only(
                    top: _height / 30, left: _width / 8, right: _width / 8),
                child: new Text(
                  'Student',
                  style: AppTheme.textTheme.headline2,
                  textAlign: TextAlign.center,
                ),
              ),
              new Divider(
                height: _height / 30,
                color: Colors.white,
              ),
              new Row(
                children: <Widget>[
                  rowCell(user.booksFine, 'Fine'),
                ],
              ),
              new Divider(height: _height / 30, color: Colors.white),
              // new Padding(
              //   padding:
              //       new EdgeInsets.only(left: _width / 8, right: _width / 8),
              //   child: new FlatButton(
              //     onPressed: () {},
              //     child: new Container(
              //         child: new Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: <Widget>[
              //         new Icon(Icons.person),
              //         new SizedBox(
              //           width: _width / 30,
              //         ),
              //         new Text('FOLLOW')
              //       ],
              //     )),
              //     color: Colors.blue[50],
              //   ),
              // ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              color: AppTheme.appColor.primaryVariant,
              onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (ctx) => LoginPage())),
              child: Text("Logout"),
            ),
          ),
        )
      ],
    );
  }

  Widget rowCell(int count, String type) => new Expanded(
          child: new Column(
        children: <Widget>[
          new Text(
            '$count Rs',
            style: AppTheme.textTheme.headline2
                .copyWith(color: Colors.black, fontSize: 26),
          ),
          new Text(
            type,
            style: AppTheme.textTheme.headline2
                .copyWith(color: Colors.black, fontSize: 26),
          )
        ],
      ));
}
