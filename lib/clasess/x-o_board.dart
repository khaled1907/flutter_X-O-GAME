


import 'package:flutter/material.dart';
import '../widgets/XOButton.dart';
import 'PlayersData.dart';

class GameBoard extends StatefulWidget {
  static const String routeName = "GameBoard";

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> boardSymbols = ["", "", "", "", "", "", "", "", ""];
  int scorePlayer1 = 0;
  int scorePlayer2 = 0;

  @override
  Widget build(BuildContext context) {
    var arguments =ModalRoute.of(context)?.settings.arguments as PlayersData;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "X-O GAME",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      arguments.player1,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$scorePlayer1",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      arguments.player2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$scorePlayer2",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XorObutton(
                    buttonText: boardSymbols[0],
                    index: 0,
                    ifButtonClicked: buttonClicked),
                XorObutton(
                    buttonText: boardSymbols[1],
                    index: 1,
                    ifButtonClicked: buttonClicked),
                XorObutton(
                    buttonText: boardSymbols[2],
                    index: 2,
                    ifButtonClicked: buttonClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XorObutton(
                    buttonText: boardSymbols[3],
                    index: 3,
                    ifButtonClicked: buttonClicked),
                XorObutton(
                    buttonText: boardSymbols[4],
                    index: 4,
                    ifButtonClicked: buttonClicked),
                XorObutton(
                    buttonText: boardSymbols[5],
                    index: 5,
                    ifButtonClicked: buttonClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XorObutton(
                    buttonText: boardSymbols[6],
                    index: 6,
                    ifButtonClicked: buttonClicked),
                XorObutton(
                    buttonText: boardSymbols[7],
                    index: 7,
                    ifButtonClicked: buttonClicked),
                XorObutton(
                    buttonText: boardSymbols[8],
                    index: 8,
                    ifButtonClicked: buttonClicked),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  buttonClicked(index) {
    if (boardSymbols[index].isEmpty) {
      if (counter % 2 == 0) {
        boardSymbols[index] = "X";
      } else {
        boardSymbols[index] = "O";
      }
      counter++;

      if (chechIfOneWin("X")) {
        addScore("X");
        resetIBoard();
      } else if (chechIfOneWin("O")) {
        addScore("O");
        resetIBoard();
      }

      if (counter == 9) {
        resetIBoard();
      }
      setState(() {});
    }
    else{
      return;
    }
  }

  /// 0    1     2
  /// 3    4     5
  /// 6    7     8
  resetIBoard() {
    boardSymbols = ["", "", "", "", "", "", "", "", ""];
    counter = 0;
    setState(() {});
  }

  bool chechIfOneWin(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardSymbols[i] == symbol &&
          boardSymbols[i + 1] == symbol &&
          boardSymbols[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (boardSymbols[i] == symbol &&
          boardSymbols[i + 3] == symbol &&
          boardSymbols[i + 6] == symbol) {
        return true;
      }
    }
    if ((boardSymbols[0] == symbol &&
        boardSymbols[4] == symbol &&
        boardSymbols[8] == symbol) ||
        (boardSymbols[2] == symbol &&
            boardSymbols[4] == symbol &&
            boardSymbols[6] == symbol)) {
      return true;
    }
    return false;
  }

  addScore(String winSymbol) {
    if (winSymbol == "X") {
      scorePlayer1 += 5;
    } else if (winSymbol == "O") {
      scorePlayer2 += 5;
    }
    counter = 0;
    boardSymbols = ["", "", "", "", "", "", "", "", ""];

    setState(() {});
  }
}
