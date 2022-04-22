import 'package:flutter/material.dart';
import 'package:create_n_share/home.dart';
import 'package:create_n_share/counter_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create and Share files',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(
        storage: CounterStorage(),
      ),
    );
  }
}
