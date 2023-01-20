import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/constents/constents.dart';
import 'package:tic_tac_toe/models/TTTBlock_model.dart';
import 'package:tic_tac_toe/widgets/ttt_block.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Provider.of<TTTBlocksModel>(context,listen: false).initBoard();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width < MediaQuery.of(context).size.height ? MediaQuery.of(context).size.width: MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            width: size,
            height: size,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _createBoard(),
            ),
          ),
        ),
      ),
    );
  }
  
  List<Row> _createBoard(){
    List<List<XO>> list = Provider.of<TTTBlocksModel>(context).board;
    return List.generate(list.length, (index_i) =>
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(list[index_i].length,(index_j)=>
              TTTBlock(x: index_i,y:index_j,xo: list[index_i][index_j],)).toList(),
        )
    ).toList();
  }
}
