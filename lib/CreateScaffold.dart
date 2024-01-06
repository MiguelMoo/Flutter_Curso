import 'package:flutter/material.dart';

class OrientationApp extends StatelessWidget {
  const OrientationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Orientation',
      home: OrientationPageList(),
    );
  }
}

class OrientationPageList extends StatelessWidget {
  const OrientationPageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
              children: List.generate(50, (index) {
                return Center(
                  child: Text(
                    'item: $index ',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                );
              }));
        },
      ),
    );
  }
}
