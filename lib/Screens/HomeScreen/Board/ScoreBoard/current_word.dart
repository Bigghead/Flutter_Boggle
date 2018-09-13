import 'package:flutter/material.dart';

class CurrentWord extends StatelessWidget {

  final String word;

  CurrentWord( { @required this.word } );

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Word:'),
            Text(word)
          ],
        ),
      );
    }
}