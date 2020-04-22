import 'package:fitnessapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/styleguide/colors.dart';
import 'package:fitnessapp/workout.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        body: WorkoutsList(),
      ),
    );
  }
}

class WorkoutsList extends StatelessWidget {
  WorkoutsList({Key key}) : super(key: key);

  final workouts = <Workout>[
    Workout(
        author: 'Alex',
        description: 'Test Workout1',
        level: "Beginner",
        title: "Test1"),
    Workout(
        author: 'Alita',
        description: 'Test Workout2',
        level: "Intermidiate",
        title: "Test2"),
    Workout(
        author: 'Piter Quill',
        description: 'Test Workout3',
        level: "Advanced",
        title: "Test3"),
    Workout(
        author: 'Gamora',
        description: 'Test Workout4',
        level: "Beginner",
        title: "Test4"),
    Workout(
        author: 'Raketa',
        description: 'Test Workout5',
        level: "upper Intermidiate",
        title: "Test5"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, i) {
            return Card(
              elevation: 15,
              margin: EdgeInsets.all(10),
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.fitness_center,
                      color: iconColor,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(width: 1, color: Colors.green),
                      ),
                    ),
                  ),
                  title: Text(
                    workouts[i].title,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: iconColor,
                  ),
                  subtitle: subtitle(
                    context,
                    workouts[i],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget subtitle(BuildContext context, Workout workout) {
  var color = Colors.grey;
  double indicatorlevel = 0;

  switch (workout.level) {
    case 'Beginner':
      color = Colors.green;
      indicatorlevel = 0.3;
      break;
    case 'Intermidiate':
      color = Colors.yellow;
      indicatorlevel = 0.5;
      break;
    case 'upper Intermidiate':
      color = Colors.red;
      indicatorlevel = 1;
      break;
    case 'Advanced':
      color = Colors.blue;
      indicatorlevel = 0.8;
      break;
  }
  return Row(
    children: <Widget>[
      Expanded(
        flex: 2,
        child: LinearProgressIndicator(
          backgroundColor: Colors.white,
          value: indicatorlevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        flex: 2,
        child: Text(
          workout.level,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
      // Expanded(child: null, flex: 3)
    ],
  );
}
