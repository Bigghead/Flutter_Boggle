import 'package:flutter/material.dart';

class BoardCell extends StatelessWidget {

  final Map cell;
  final Function cellClick;

  BoardCell( { @required this.cell, @required this.cellClick} );


  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
        height: 50.0,
        child: GestureDetector(
          onTap: () {
            cellClick();
          },
          child: Container(
            decoration: BoxDecoration(
              color: cell['isSelected'] ? Colors.orange : Colors.white 
            ),
            child: Center(child: Text(cell['char'])),
          ),
        ),
      );
    }
}