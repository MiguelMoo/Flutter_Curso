// import 'package:flutter/material.dart';
// import 'package:prueba/navegation/pass_arguments.dart';
// import 'package:prueba/navegation/send_data.dart';

// class HeroApp extends StatelessWidget {
//   const HeroApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Transition Demo',
//       home: const MainScreen(),
//       initialRoute: '/',
//       routes: {
//         '/second': (context) => const Passargument(),
//       },
//     );
//   }
// }

// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Main Screen'),
//       ),
//       body: GestureDetector(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return const DetailScreen();
//           }));
//         },
//         child: Hero(
//           tag: 'imageHero',
//           child: Image.network(
//             'https://www.adslzone.net/app/uploads-adslzone.net/2019/04/borrar-fondo-imagen.jpg?x=480&y=375&quality=40',
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DetailScreen extends StatelessWidget {
//   const DetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Center(
//               child: Hero(
//                 tag: 'imageHero',
//                 child: Image.network(
//                   'https://empresas.blogthinkbig.com/wp-content/uploads/2019/11/Imagen3-245003649.jpg?w=800',
//                 ),
//               ),
//             ),
//           ),
//           Center(
//             child: ElevatedButton(
//               child: const Text('Open route'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const SecondRoute()),
//                 );
//               },
//             ),
//           ),
//           Center(
//             child: ElevatedButton(
//               // Within the `FirstScreen` widget
//               onPressed: () {
//                 // Navigate to the second screen using a named route.
//                 Navigator.pushNamed(context, '/second');
//               },
//               child: const Text('Launch screen'),
//             ),
//           ),
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Returdata()),
//                 );
//               },
//               child: const Text('go retur data'),
//             ),
//           ),
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Returdata()),
//                 );
//               },
//               child: const Text('go retur data'),
//             ),
//           ),
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => TodosScreen(
//                         todos: List.generate(
//                           20,
//                           (i) => Todo(
//                             'Todo $i',
//                             'A description of what needs to be done for Todo $i',
//                           ),
//                         ),
//                       ),
//                     ));
//               },
//               child: const Text('go retur list data'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SecondRoute extends StatelessWidget {
//   const SecondRoute({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Second Route'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }
