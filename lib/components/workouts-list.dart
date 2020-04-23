import 'package:fitnessapp/workout.dart';
import 'package:fitnessapp/styleguide/colors.dart';
import 'package:fitnessapp/workout.dart';
import 'package:flutter/material.dart';

class WorkoutsList extends StatefulWidget {
  WorkoutsList({Key key}) : super(key: key);

  @override
  _WorkoutsListState createState() => _WorkoutsListState();
}

class _WorkoutsListState extends State<WorkoutsList> {
  @override
  void initState() {
    clearFilter();
    super.initState();
  }

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

  var filterOnlyMyWorkout = false;
  var filterTitle = '';
  var filterTitleController = TextEditingController();
  var filterLevel = 'Any level';

  var filterText = '';
  var filterHeight = 0.0;

  List<Workout> clearFilter() {
    setState(() {
      filterText = ' All workouts / Any level ';
      filterHeight = 0.0;
      filterOnlyMyWorkout = false;
      filterTitleController.clear();
      filterLevel = 'Any level';
      var list = workouts;
      return list;
    });
  }

  List<Workout> filter() {
    setState(() {
      filterText = filterOnlyMyWorkout ? 'My workouts' : 'All workouts';
      filterHeight = 0.0;
      filterText += '/' + filterLevel;
      if (filterTitle.isNotEmpty) {
        filterText += '/' + filterTitle;
      }

      var list = workouts;
      return list;
    });
  }

  @override
  Widget build(BuildContext context) {
    var workoutsList = Expanded(
      child: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
              child: ListTile(
                contentPadding: EdgeInsets.all(8),
                leading: Container(
                  padding: EdgeInsets.all(8),
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
    );

    var filterInfo = Container(
      margin: EdgeInsets.all(8),
      height: 40,
      color: Colors.white,
      child: RaisedButton(
        onPressed: () => setState(() {
          filterHeight = (filterHeight == 0.0 ? 280 : 0.0);
        }),
        child: Row(
          children: <Widget>[
            Icon(Icons.filter_list),
            Text(
              filterText,
              style: TextStyle(),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );

    var levelMenuItems = <String>[
      'Any level',
      'Beginner',
      'intermediate',
      'Advanced'
    ].map((String value) {
      return new DropdownMenuItem<String>(
        value: value,
        child: new Text(value),
      );
    }).toList();

    var filterForm = AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: EdgeInsets.all(8),
      height: filterHeight,
      curve: Curves.fastOutSlowIn,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SwitchListTile(
                  value: filterOnlyMyWorkout,
                  title: Text('Only my workout'),
                  onChanged: (bool val) =>
                      setState(() => filterOnlyMyWorkout = val)),
              DropdownButtonFormField<String>(
                onChanged: (String value) =>
                    setState(() => filterLevel = value),
                items: levelMenuItems,
                value: filterLevel,
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: filterTitleController,
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (String val) => setState(() => filterTitle = val),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () {
                        filter();
                      },
                      child: Text('Apply',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      color: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () {
                        clearFilter();
                      },
                      child: Text('Clear',
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    return Column(
      children: <Widget>[
        filterInfo,
        filterForm,
        workoutsList,
      ],
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
