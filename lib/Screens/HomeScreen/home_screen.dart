import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(child: Text('Boggle')),
              ),
              Expanded(
                flex: 4,
                child: Center(child: Text('Board goes here')),
              )
            ],
          ),
        ),
      );
    }
}