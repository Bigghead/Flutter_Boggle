
import 'dart:math';

bool isNeighbor( List<List> array, int row, int col ) {

    var neighbors = [];

        for ( var  nr = max(0, row - 1); nr <= min(row + 1, array.length - 1); ++nr){
            for ( var nc = max(0, col - 1); nc <= min(col + 1, array[0].length - 1); ++nc) {
                if (!(nr==row && nc==col))  { 
                    neighbors.add(array[nr][nc]);
                }
            }
        }

    return neighbors.any( (cell) => cell.isSelected == true );
}