import 'package:fitnessapp/pages/landing.dart';
import 'package:fitnessapp/services/auth.dart';
import 'package:fitnessapp/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaxFitApp());

class MaxFitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthServices().currentUser,
      child: MaterialApp(
        title: 'my Fit App',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(50, 65, 85, 1),
        ),
        home: LandingPage(),
      ),
    );
  }
}
