import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constents/constents.dart';

enum XO {X,O,Empty}

class TTTBlocksModel extends ChangeNotifier{
  List<List<XO>> board = <List<XO>>[];
  int count = 0;

  initBoard(){
    for(int i=0;i<BOARD_SIZE;i++){
      List<XO> tempList = [];
      for(int j=0;j<BOARD_SIZE;j++){
        tempList.add(XO.Empty);
      }
      board.add(tempList);
    }
  }
  updateBoard(int x,int y){
    if(board[x][y]!=XO.Empty) return;
    board[x][y] = count%2 == 0? XO.X : XO.O;
    count++;
    notifyListeners();
  }
}

