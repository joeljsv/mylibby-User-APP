 import 'package:flutter/material.dart';

import '../theme.dart';

Padding headText(String title) {
    return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(title,style: AppTheme.textTheme.headline3,),
      );
  }