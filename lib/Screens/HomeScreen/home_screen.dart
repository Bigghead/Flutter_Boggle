import 'package:flutter/material.dart';

import './board.dart';

class HomeScreen extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              // Expanded(
              //   flex: 1,
              //   child: Center(child: Text('Boggle')),
              // ),
              Expanded(
                // flex: 6,
                child: Center(child: Board()),
              )
            ],
          ),
        ),
      );
    }
}