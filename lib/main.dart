import 'package:flutter/material.dart';

import 'sorting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sorting App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),

      home: const Sort(),
    );
  }

}
