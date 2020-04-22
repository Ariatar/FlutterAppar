import 'package:fitnessapp/pages/auth.dart';
import 'package:fitnessapp/pages/home.dart';
import 'package:fitnessapp/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of(context);
    final bool isloggedIn = user != null;
    return isloggedIn ? HomePage() : Authorizationpage();
  }
}
