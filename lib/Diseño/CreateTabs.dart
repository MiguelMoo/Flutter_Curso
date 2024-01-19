// import 'package:flutter/material.dart';
// import 'package:prueba/Dise%C3%B1o/CreateScaffold.dart';
// import 'package:prueba/Dise%C3%B1o/CreateSnackBar.dart';
// import 'package:prueba/main.dart';

// class TabsCreate extends StatelessWidget {
//   const TabsCreate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DefaultTabController(
//           length: 3,
//           child: Scaffold(
//             appBar: AppBar(
//               bottom: const TabBar(
//                 tabs: [
//                   Tab(icon: Icon(Icons.car_crash)),
//                   Tab(icon: Icon(Icons.directions)),
//                   Tab(icon: Icon(Icons.shopping_bag))
//                 ],
//               ),
//               title: const Text('Tabs Created'),
//             ),
//             body: const TabBarView(children: [
//               MyHomePage(title: 'home'),
//               CreateSnackBar(),
//               OrientationApp()
//             ]),
//           )),
//     );
//   }
// }
