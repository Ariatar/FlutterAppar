import 'package:fitnessapp/pages/auth.dart';
import 'package:fitnessapp/pages/home.dart';

import 'package:flutter/material.dart';

void main() => runApp(MaxFitApp());

class MaxFitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my Fit App',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(50, 65, 85, 1),
      ),
      home: Authorizationpage(),
    );
  }
}
