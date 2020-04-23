// BottomNavigationBar

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

// bottomNavigationBar: CurvedNavigationBar

// bottomNavigationBar: CurvedNavigationBar(
//           key: _bottomNavigationKey,
//           index: 0,
//           height: 50.0,
//           items: <Widget>[
//             Icon(Icons.directions_run),
//             Icon(Icons.scatter_plot),
//           ],
//           color: Colors.white,
//           buttonBackgroundColor: Colors.white,
//           backgroundColor: Colors.blueAccent,
//           animationCurve: Curves.easeInOut,
//           animationDuration: Duration(milliseconds: 600),
//           onTap: (index) {
//             setState(() {
//               sectionIndex = index;
//             });
//           },
//         ),
