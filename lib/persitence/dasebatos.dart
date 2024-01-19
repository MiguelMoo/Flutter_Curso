import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:prueba/persitence/storekey.dart';
import 'package:prueba/persitence/whiteandread.dart';

import 'package:sqflite/sqflite.dart';

class DogScreen extends StatefulWidget {
  const DogScreen({Key? key}) : super(key: key);

  @override
  _DogScreenState createState() => _DogScreenState();
}

class _DogScreenState extends State<DogScreen> {
  late Future<List<Dog>> dogs;

  @override
  void initState() {
    super.initState();
    refreshDogList();
  }

  // Método para obtener y actualizar la lista de perros
  void refreshDogList() {
    setState(() {
      dogs = DogDatabase.instance.dogs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Database App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: FutureBuilder<List<Dog>>(
                future: dogs,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final dog = snapshot.data![index];
                        return ListTile(
                          title: Text(
                              'ID: ${dog.id}, Name: ${dog.name}, Age: ${dog.age}'),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DogForm(refreshDogList: refreshDogList),
          ),
        ],
      ),
    );
  }
}

class DogForm extends StatefulWidget {
  final VoidCallback refreshDogList;

  const DogForm({required this.refreshDogList, Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DogFormState createState() => _DogFormState();
}

class _DogFormState extends State<DogForm> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(labelText: 'Name'),
        ),
        TextField(
          controller: _ageController,
          decoration: const InputDecoration(labelText: 'Age'),
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
          onPressed: () async {
            final name = _nameController.text;
            final age = int.tryParse(_ageController.text) ?? 0;
            if (name.isNotEmpty && age > 0) {
              await DogDatabase.instance
                  .insertDog(Dog(id: 0, name: name, age: age));
              setState(() {
                _nameController.clear();
                _ageController.clear();
              });
              // Llamamos al método para actualizar la lista de perros
              widget.refreshDogList();
            }
          },
          child: const Text('Add Dog'),
        ),
        ElevatedButton(
          onPressed: ()  {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterDemo(storage: CounterStorage())));
          },
          child: const Text('Read and write'),
        ),
        ElevatedButton(
          onPressed: ()  {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Storekey()));
          },
          child: const Text('Store key-value data on disk'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }
}

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({
    required this.id,
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}

class DogDatabase {
  DogDatabase._privateConstructor();
  static final DogDatabase instance = DogDatabase._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertDog(Dog dog) async {
    final db = await database;
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> dogs() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'] as int,
        name: maps[i]['name'] as String,
        age: maps[i]['age'] as int,
      );
    });
  }
}
