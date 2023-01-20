import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/constents/constents.dart';
import 'package:tic_tac_toe/models/TTTBlock_model.dart';

class TTTBlock extends StatelessWidget {
  final int x;
  final int y;
  final XO xo;
  const TTTBlock({Key? key, required this.x, required this.y, required this.xo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double blockSize = MediaQuery.of(context).size.width < MediaQuery.of(context).size.height ? (MediaQuery.of(context).size.width/BOARD_SIZE)-(60/BOARD_SIZE) : (MediaQuery.of(context).size.height/BOARD_SIZE)-(60/BOARD_SIZE);
    return InkWell(
      onTap: (){
        Provider.of<TTTBlocksModel>(context,listen: false).updateBoard(this.x, this.y);
      },
      child: Center(child: Builder(
        builder: (context) {
          
          return Container(
            width: blockSize,
            height: blockSize,
            decoration: BoxDecoration(color: _getColor(),borderRadius: BorderRadius.circular(10),boxShadow: [BoxShadow(color: Colors.white,blurRadius: 2,spreadRadius: 2)]),
          );
        }
      )),
    );
  }

  _getColor(){
    return this.xo == XO.Empty ? Colors.black : this.xo == XO.X ? Colors.red : Colors.yellow;
  }
}
