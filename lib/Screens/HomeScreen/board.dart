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
           }
           if( isLastCellClicked( char, currentRow, currentCol ) ) {
               return !char['isSelected'];
           }
       }
       // cant click, leave as is
       return char['isSelected'];
   }


  void addCell( int row, int col, Map char ) {
    _clickedCells.add([row,col]);
    setState( () {
        _clickedCells = _clickedCells;
        _currentWord  = '${_currentWord}${char['char']}';
    } );
    // print(_boardArray);
  }


  bool isLastCellClicked( char, row, col ) {
    if( _clickedCells.length == 0 ) { return true; }
    List lastClicked = _clickedCells[_clickedCells.length -1];
    if( row == lastClicked[0] && col == lastClicked[1] ) {
        
        setState(() {
            _clickedCells.removeLast();
            _currentWord.substring(0, _currentWord.length);
        } );
        print(_clickedCells);
        return true;
    } 
    return false;
  }


    cellClick( currentRow, currentCol ) {
        var row = _boardArray[currentRow];
        print({ 'row': currentRow, 'col': currentCol});

        var newRow = [];
        row.asMap().forEach( ( i, char ) { 
            newRow.add({  
                'char' : char['char'],
                'isSelected' : canClick( _boardArray, char, currentRow, currentCol, i) 
            });
        } );

        // === update state with new clicked square === //
        List<List<dynamic>> newBoard = [];
         _boardArray.asMap().forEach( ( i, boardRow ) {
                if( i == currentRow ) {
                  newBoard.add(newRow);
                } else {
                  newBoard.add(boardRow);
                }
            } );
        setState(() {
            _boardArray = newBoard;
        } );
        // print(_boardArray);
        
    }

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
    }

  Widget _boardRow( List<dynamic> cellItems, int row ) {
    List<Widget> rowChildren = [];
    cellItems.asMap().forEach((col, item) {
        rowChildren.add(Expanded(child: BoardCell(cell: item, cellClick: () {cellClick(row, col);},)));
    });
    // print(rowChildren);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: rowChildren,
    );
  }

  @override
    Widget build(BuildContext context) {
      List<Widget> boardChildren = [];
      _boardArray.asMap().forEach( (i, item ) { 
        boardChildren.add(_boardRow(item, i)); 
      } );
      // print(boardChildren);
      // TODO: implement build
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: boardChildren,
        ),
      );
    }
}