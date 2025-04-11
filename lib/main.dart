
import 'package:flutter/material.dart';

import 'clasess/takePlayerNames.dart';
import 'clasess/x-o_board.dart';


void main() {
  runApp(X_O_Game());
}

class X_O_Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return X_O_GameState();
  }
}

class X_O_GameState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {

        GameBoard.routeName: (context) => GameBoard(),
        TakePlayerNames.routeName: (context) => TakePlayerNames(),
      },
      initialRoute: TakePlayerNames.routeName,
      title: "X-O App",
      debugShowCheckedModeBanner: false,

    );
  }
}
