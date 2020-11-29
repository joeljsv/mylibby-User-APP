import 'package:flutter/material.dart';

import '../theme.dart';

AppBar appBar({String title="My Libby"}) {
    return AppBar(
      title: Text(
        title,
        style: AppTheme.textTheme.headline2,
      ),
    );
  }