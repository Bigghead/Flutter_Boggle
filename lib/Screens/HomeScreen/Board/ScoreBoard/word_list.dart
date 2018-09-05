import 'package:flutter/material.dart';

class WordList extends StatelessWidget {

  final List<String> allWords;

  WordList( { @required this.allWords } );

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Expanded(
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  child: ListView.builder(
                    itemExtent: 50.0,
                    itemCount: allWords.length,
                    itemBuilder: ( BuildContext context, int index ) {
                      return Text(allWords[allWords.length - 1 - index]);
                    },
                  ),
                ),
              );
    }
}