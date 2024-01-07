import 'package:flutter/material.dart';


class CreateSnackBar extends StatelessWidget {
  const CreateSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SnackBar',
      home: Scaffold(
        body: SnackPage(),
      ),
    );
  }
}

class SnackPage extends StatefulWidget {
  const SnackPage({super.key});

  @override
  State<SnackPage> createState() => _SnackPageState();
}

class _SnackPageState extends State<SnackPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('Yay, A Snackbar'),
            action: SnackBarAction(label: 'Undo', onPressed: () {}),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Show a Snackbar'),
      ),
    );
  }
}
