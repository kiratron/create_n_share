import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class AppBarActions {
  static List<Widget> buildActions(Future<String> filePathToShare) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () async {
            final filePath = await filePathToShare;
            Share.shareFiles([filePath]);
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
