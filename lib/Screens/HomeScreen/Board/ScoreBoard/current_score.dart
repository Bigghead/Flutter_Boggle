import 'package:flutter/material.dart';

class CurrentScore extends StatelessWidget {

  final int score;

  CurrentScore( { @required this.score } );

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
       return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Current Score:'),
            Text(score.toString())
          ],
        ),
      );
    }
}