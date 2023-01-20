import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/models/TTTBlock_model.dart';
import 'package:tic_tac_toe/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark
      ),
      home: MultiProvider(
          providers: [
            ChangeNotifierProvider<TTTBlocksModel>(create: (_)=> TTTBlocksModel())
          ],
          child: const MyHomePage()),
    );
  }
}