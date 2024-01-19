// import 'package:flutter/material.dart';

// class FormValidationApp extends StatefulWidget {
//   const FormValidationApp({Key? key}) : super(key: key);

//   @override
//   State<FormValidationApp> createState() => _FormValidationAppState();
// }

// class _FormValidationAppState extends State<FormValidationApp> {
//   final _fromkey = GlobalKey<FormState>();
//   final myController = TextEditingController();
//   late FocusNode myFocusNode;

//   @override
//   void initState() {
//     super.initState();
//     myFocusNode = FocusNode();
//   }

//   @override
//   void dispose() {
//     myFocusNode.dispose();
//     myController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _fromkey,
//         child: Column(
//           children: <Widget>[
//             TextFormField(
//               autofocus: true,
//               decoration: const InputDecoration(
//                 border: UnderlineInputBorder(),
//                 labelText: 'Write your name',
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter some text';
//                 }
//                 return null;
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 12.0),
//               child: TextField(
//                 focusNode: myFocusNode,
//                 controller: myController,
//                 onChanged: (value) {
//                   print('Second text field: $value (${value.characters.length})');
//                 },
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'What is your name',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 12.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (_fromkey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Processing data')),
//                     );
//                   }
//                 },
//                 child: const Text('Submit'),
//               ),
//             ),
//             FloatingActionButton(
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       content: Text(myController.text),
//                     );
//                   },
//                 );
//               },
//               tooltip: 'Show me the value!',
//               child: const Icon(Icons.text_fields),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
