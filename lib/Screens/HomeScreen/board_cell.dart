import 'package:flutter/material.dart';

class BoardCell extends StatelessWidget {

  final Map cell;

  BoardCell( { @required this.cell } );


  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
        height: 50.0,
        child: GestureDetector(
          onTap: () {
            cell['isSelected'] = !cell['isSelected'];
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