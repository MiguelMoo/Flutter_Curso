// import 'package:flutter/material.dart';

// class FloantingAppbar extends StatelessWidget {
//   const FloantingAppbar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const title = 'Floating App Bar';

//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         body: CustomScrollView(
//           slivers: [
//             // Add the app bar to the CustomScrollView.
//             const SliverAppBar(
//               title: Text(title),
//               floating: true,
//               flexibleSpace: Placeholder(),
//               expandedHeight: 100,
//             ),
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) => ListTile(title: Text('Item #$index')),
//                 childCount: 20,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }