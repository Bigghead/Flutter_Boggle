import 'package:flutter/material.dart';

import './board_cell.dart';

import '../../Utils/board_helper.dart';

class Board extends StatefulWidget {

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _BoardState();
    }
}


class _BoardState extends State<Board> {

  List _boardArray = buildCharacterGrid();

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
    }

  Widget _boardRow( List<dynamic> cellItems ) {
    return Row(
      children: cellItems.map((i) {
        return BoardCell();
      }).toList(),
    );
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _boardArray.map( (i) => _boardRow(i) ).toList(),
        ),
      );
    }
}