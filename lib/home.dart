import 'package:flutter/material.dart';
import 'package:create_n_share/counter_storage.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({Key? key, required this.storage}) : super(key: key);

  final CounterStorage storage;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  Future<File> _incrementCounter() async {
    setState(() {
      _counter++;
    });

    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create and Share files'),
      ),
      body: Center(
        child: Text('Button tapped $_counter times'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
