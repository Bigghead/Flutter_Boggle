
import 'dart:math';


// === Freaking Dart types kicking my ass... === //
// === Math.min List<List<dynamic>> typing not working === //
// === So rolling our own min function cause YOLO === //
int takeMin( int a, int b ) {
  return a > b ? a : b;
}

bool isNeighbor( List array, int row, int col ) {

    var neighbors = [];

        for ( var  nr = max(0, row - 1); nr <= takeMin(row + 1, array.length - 1); ++nr){
            for ( var nc = max(0, col - 1); nc <= takeMin(col + 1, array[0].length - 1); ++nc) {
                if (!(nr==row && nc==col))  { 
                    neighbors.add(array[nr][nc]);
                }
            }
        }

    return neighbors.any( (cell) => cell['isSelected'] == true );
}