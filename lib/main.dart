import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba/Animation/Animate_a_page_route_transition.dart';
import 'package:prueba/Animation/Animate_the_properties_of_a_container.dart';
import 'package:prueba/Animation/Fade_a_widget_in_and_out.dart';
import 'package:prueba/Effects/download_button.dart';
import 'package:prueba/Effects/nest_nav.dart';
import 'package:prueba/Effects/paralax_scrolling.dart';
import 'package:prueba/Effects/photo_carusel.dart';
import 'package:prueba/gesture/Dismissible.dart';
import 'package:prueba/gesture/handle_taps.dart';
import 'package:prueba/gesture/ripples.dart';

import 'Animation/Animate_a_widget_using_a_physics_simulation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 248, 8, 20),
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
          ),
          titleLarge:
              GoogleFonts.lato(fontSize: 20.0, fontStyle: FontStyle.italic),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static final List<Widget Function()> _widgetOptions = <Widget Function()>[
    () => const Page1(),
    () => const MaterialApp(home: PhysicsCardDragDemo()),
    () => const AnimatedContainerApp(),
    () => const FadeAWidgetInAndAout(),
    () => const MaterialApp(
          home: ExampleCupertinoDownloadButton(),
          debugShowCheckedModeBanner: false,
        ),
    () =>       MaterialApp(
          theme: ThemeData(
            brightness: Brightness.dark,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue,
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.blue,
            ),
          ),
          onGenerateRoute: (settings) {
            late Widget page;
            if (settings.name == routeHome) {
              page = const HomeScreen();
            } else if (settings.name == routeSettings) {
              page = const SettingsScreen();
            } else if (settings.name!.startsWith(routePrefixDeviceSetup)) {
              final subRoute =
                  settings.name!.substring(routePrefixDeviceSetup.length);
              page = SetupFlow(
                setupPageRoute: subRoute,
              );
            } else {
              throw Exception('Unknown route: ${settings.name}');
            }

            return MaterialPageRoute<dynamic>(
              builder: (context) {
                return page;
              },
              settings: settings,
            );
          },
          debugShowCheckedModeBanner: false,
        ),
    () => const MaterialApp(
          home: ExampleInstagramFilterSelection(),
          debugShowCheckedModeBanner: false,
        ),
    () => const ParalaxScrollig(),
    () => const Ripples(),
    () => const HandleTaps(),
    () => const DismissibleApp(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Practicas ')),
      body: Center(child: _widgetOptions[_selectedIndex]()),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text('Practicas 3'),
            ),
            ListTile(
              title: const Text('Animate a page route transition'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Animate a widget using a physics simulation'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Animate the properties of a container'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
                title: const Text('Fade a widget in and out'),
                selected: _selectedIndex == 3,
                onTap: () {
                  _onItemTapped(3);
                  Navigator.pop(context);
                }),

            ListTile(
              title: const Text('Download button'),
              selected: _selectedIndex == 4,
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Create a nested navigation flow'),
              selected: _selectedIndex == 5,
              onTap: () {
                _onItemTapped(5);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('photo filter carousel'),
              selected: _selectedIndex == 6,
              onTap: () {
                _onItemTapped(6);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Parallax Scrollig'),
              selected: _selectedIndex == 7,
              onTap: () {
                _onItemTapped(7);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('ripples'),
              selected: _selectedIndex == 8,
              onTap: () {
                _onItemTapped(8);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Handle taps'),
              selected: _selectedIndex == 9,
              onTap: () {
                _onItemTapped(9);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Dismissible'),
              selected: _selectedIndex == 10,
              onTap: () {
                _onItemTapped(10);
                Navigator.pop(context);
              },
            ),
            // ListTile(
            //   title: const Text('Parallax Scrollig'),
            //   selected: _selectedIndex == 7,
            //   onTap: () {
            //     _onItemTapped(7);
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   title: const Text('Parallax Scrollig'),
            //   selected: _selectedIndex == 7,
            //   onTap: () {
            //     _onItemTapped(7);
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   title: const Text('Parallax Scrollig'),
            //   selected: _selectedIndex == 7,
            //   onTap: () {
            //     _onItemTapped(7);
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   title: const Text('Parallax Scrollig'),
            //   selected: _selectedIndex == 7,
            //   onTap: () {
            //     _onItemTapped(7);
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   title: const Text('Parallax Scrollig'),
            //   selected: _selectedIndex == 7,
            //   onTap: () {
            //     _onItemTapped(7);
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
