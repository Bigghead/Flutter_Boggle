import 'package:flutter/material.dart';

import './board_cell.dart';

class Board extends StatefulWidget {

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _BoardState();
    }
}


class _BoardState extends State<Board> {

  List _boardArray = [1, 2, 3, 4, 5];

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
    }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _boardArray.map( (f) => BoardCell() ).toList(),
        ),
      );
    }
}