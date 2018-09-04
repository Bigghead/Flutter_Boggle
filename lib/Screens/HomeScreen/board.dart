import 'package:flutter/material.dart';

import './board_cell.dart';

import '../../Utils/board_helper.dart';
import '../../Utils/helpers.dart';

class Board extends StatefulWidget {

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _BoardState();
    }
}


class _BoardState extends State<Board> {

  List   _boardArray   = buildCharacterGrid();
  String _currentWord  = '';
  int    _currentScore = 0;
  List   _clickedCells = [];
  List   _allWords     = [];

  
  bool canClick( board, dynamic char, int currentRow, int currentCol, int currentIndex ) {
       // first click?
       if( _clickedCells.length == 0 && currentIndex == currentCol ) {
           addCell( currentRow, currentCol, char );
           return !char['isSelected'];
       }
       // right cell?
       if( currentIndex == currentCol ) {
          //  is it currently selected ? Does it have selected neightbors?
           if( !char['isSelected'] && isNeighbor(board, currentRow, currentCol) ) {
               addCell( currentRow, currentCol, char );
               return true;
           };
           if( isLastCellClicked( char, currentRow, currentCol ) ) {
               return !char['isSelected'];
           }
       }
       // cant click, leave as is
       return char['isSelected'];
   }


  void addCell( int row, int col, Map char ) {
    setState( () {
        _clickedCells = List.from(_clickedCells)..addAll([ row, col ]);
        _currentWord  = '${_currentWord}${char['char']}';
    } );
  }


  bool isLastCellClicked( char, row, col ) {
    if( _clickedCells.length == 0 ) { return true; }
    List lastClicked = _clickedCells[_clickedCells.length -1];
    if( row == lastClicked[0] && col == lastClicked[1] ) {
        
        setState(() {
            _clickedCells.removeLast();
            _currentWord.substring(0, _currentWord.length);
        } );
        return true;
    } 
    return false;
    }


    cellClick( currentRow, currentCol ) {
        var row = _boardArray[currentRow];


        var newRow = row.asMap().forEach( ( char, i ) { 
            return {  
                'char' : char['char'],
                'isSelected' : this.canClick( _boardArray, char, currentRow, currentCol, i) 
            };
        } );

        // === update state with new clicked square === //
        setState(() {
            _boardArray.asMap().forEach( ( boardRow, i ) {
                if( i == currentRow ) return newRow;
                return boardRow;
            } );
        } );
        
    }

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
    }

  Widget _boardRow( List<dynamic> cellItems ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: cellItems.asMap().forEach((i) {
        return Expanded(child: BoardCell(cell: i, cellClick: cellClick));
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