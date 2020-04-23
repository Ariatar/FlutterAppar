import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fitnessapp/components/active-workouts.dart';
import 'package:fitnessapp/components/workouts-list.dart';
import 'package:fitnessapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/styleguide/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;

  var _bottomNavigationKey;

  @override
  Widget build(BuildContext context) {
    var navigationBar = CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: 0,
      height: 50.0,
      items: <Widget>[
        Icon(Icons.directions_run),
        Icon(Icons.scatter_plot),
      ],
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.blueAccent,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 500),
      onTap: (index) {
        setState(() {
          sectionIndex = index;
        });
      },
    );
    return Container(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  AuthServices().logout();
                },
                child: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
            title: Text('Max Fit'),
            leading: Icon(
              Icons.fitness_center,
              color: iconColor,
            ),
          ),
          body: sectionIndex == 0 ? ActiveWorkouts() : WorkoutsList(),
          bottomNavigationBar: navigationBar

          // bottomNavigationBar: BottomNavigationBar(
          //   // footer как в веб верстке, BottomNavigationBar
          //   items: const <BottomNavigationBarItem>[
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.directions_run,
          //         size: 30,
          //       ),
          //       title: Text(
          //         'My Workouts',
          //       ),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.scatter_plot,
          //         size: 30,
          //       ),
          //       title: Text(
          //         'My Workouts',
          //       ),
          //     ),
          //   ],
          //   currentIndex: sectionIndex,
          //   selectedItemColor: Colors.white,
          //   backgroundColor: Colors.white24,
          //   selectedFontSize: 20,
          //   onTap: (int index) {
          //     setState(() => sectionIndex = index);
          //   },
          // ),
          ),
    );
  }
}
