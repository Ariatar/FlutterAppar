import 'package:fitnessapp/styleguide/text_style.dart';
import 'package:flutter/material.dart';

class ActiveWorkouts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'Data Engenering',
          style: awTextStyle,
        ),
      ),
    );
  }
}
