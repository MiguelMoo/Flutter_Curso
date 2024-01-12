
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba/list/floanting_appbar_above_a_list.dart';
import 'Form/Form_with_validation.dart';
import 'Diseño/CreateScaffold.dart';
import 'Diseño/CreateSnackBar.dart';
import 'Diseño/CreateTabs.dart';
import 'list/create_list_with_diffrent_types_of_items.dart';
import 'list/list_with_space.dart';

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
              seedColor:  const Color.fromARGB(255, 248, 8, 20),
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
    () => const FormValidationApp(),
    () => Create_list_differents_item(
          items: List<ListItem>.generate(
            1000,
            (i) => i % 6 == 0
                ? HeadingItem('Heading $i')
                : MessageItem('Sender $i', 'Message body $i'),
          ),
        ),
    () => const SpacedItemsList(),
    () => const FloantingAppbar(),
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
                }),
            ListTile(
              title: const Text('Form validated'),
              selected: _selectedIndex == 4,
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Create list with different items'),
              selected: _selectedIndex == 5,
              onTap: () {
                _onItemTapped(5);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Create list with space items'),
              selected: _selectedIndex == 6,
              onTap: () {
                _onItemTapped(6);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Create list with floanting AppBar'),
              selected: _selectedIndex == 7,
              onTap: () {
                _onItemTapped(7);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
