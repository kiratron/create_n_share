import 'package:flutter/material.dart';

class AppBarActions {
  static List<Widget> buildActions() {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            print('Please, don\'t!');
          },
          tooltip: 'Share',
          icon: const Icon(
            Icons.share,
            size: 24.0,
          ),
        ),
      )
    ];
  }
}
