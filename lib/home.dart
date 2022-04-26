import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

import 'package:create_n_share/counter_storage.dart';
import 'package:create_n_share/appbar_actions.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.storage}) : super(key: key);

  final CounterStorage storage;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

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
        actions: AppBarActions.buildActions(widget.storage.localFilePath),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Button tapped $_counter times'),
            OutlinedButton(
              onPressed: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();
                if (result != null) {
                  File file = File(result.files.single.path!);
                  await widget.storage.setCounterFromFile(file);
                  widget.storage.readCounter().then((int value) {
                    setState(() {
                      _counter = value;
                    });
                  });
                }
              },
              child: const Text('Import a file'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
