import 'dart:math';


final List allDice = [
    'aaafrs',
    'aaeeee',
    'aafirs',
    'adennn',
    'aeeeem',
    'aeegmu',
    'aegmnn',
    'afirsy',
    'bjkqxz',
    'ccenst',
    'ceiilt',
    'ceilpt',
    'ceipst',
    'ddhnot',
    'dhhlor',
    'dhlnor',
    'dhlnor',
    'eiiitt',
    'emottt',
    'ensssu',
    'fiprsy',
    'gorrvw',
    'iprrry',
    'nootuw',
    'ooottu'
];


List buildCharacterGrid() {
    var shuffledBoard = shuffleBoard(allDice);
    var emptyArr = [ null, null, null, null, null ];
    var boardGrid = [];

    for( var i = 0; i < 5; i ++ ) { 
        boardGrid.add(List.from(emptyArr));
        for( var j = 0; j < 5; j ++ ) {
            var char = getRandomChar(shuffledBoard.removeLast());
            boardGrid[i][j] = { 'char': char, 'isSelected': false };
        }
     }
    return boardGrid;
}


String getRandomChar( String dice ) {
    String character = dice[ getRandomIndex( dice.split('').length ) ];
    return  character == 'q'
            ? 'Qu'
            : character.toUpperCase();
}


List shuffleBoard( stringArray ) {
   for (var i = 0; i < stringArray.length; i++) {

        // choose random from 0 -> 25
        var randomIndex = getRandomIndex(stringArray.length);
        var temp = stringArray[ i ];

        // switch current element with random index element
        stringArray[ i ] = stringArray[ randomIndex ];
        stringArray[ randomIndex ] = temp;
    }
    return stringArray;
}


int getRandomIndex( int length ) {
  return Random().nextInt(length);
}


