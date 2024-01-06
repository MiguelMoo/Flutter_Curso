import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CreateScaffold.dart';
import 'CreateSnackBar.dart';
import 'CreateTabs.dart';

void main() => runApp(const Miapp());

class Miapp extends StatelessWidget {
  const Miapp({super.key});
  static const titlea = 'Demo Flutter';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titlea,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 248, 8, 20),
              brightness: Brightness.dark),
          textTheme: TextTheme(
              displayLarge: const TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
              titleLarge:
                  GoogleFonts.lato(fontSize: 20.0, fontStyle: FontStyle.italic),
              bodyMedium: GoogleFonts.merriweather(),
              displaySmall: GoogleFonts.pacifico())),
      home: const MyHomePage(title: titlea),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Raleway');
  static final List<Widget Function()> _widgetOptions = <Widget Function()>[
    () => const Text(
          'Index 0: Home',
          style: optionStyle,
        ),
    () => const CreateSnackBar(),
    () => const OrientationApp(),
    () => const TabsCreate(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(child: _widgetOptions[_selectedIndex]()),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text('Drawer header'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('SnackBar'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Orientation'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
                title: const Text('Tabs'),
                selected: _selectedIndex == 3,
                onTap: () {
                  _onItemTapped(3);
                  Navigator.pop(context);
              }
            )
          ],
        ),
      ),
    );
  }
}
