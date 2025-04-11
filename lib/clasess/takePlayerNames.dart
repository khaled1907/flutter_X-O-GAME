
import 'package:flutter/material.dart';
import 'package:xogame/clasess/x-o_board.dart';

import 'PlayersData.dart';

class TakePlayerNames extends StatelessWidget {
  static const String routeName = "TakePlayersName";
  String player1name = '';
  String player2name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "X-O GAME ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text("player1 name"),
                hintText: "ahmed",
              ),
              onChanged: (text) {
                player1name = text;
              },
            ),
            TextField(
              decoration: InputDecoration(
                label: Text("player2 name"),
                hintText: "ahmed2",
              ),
              onChanged: (text) {
                player2name = text;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, GameBoard.routeName,
                      arguments: PlayersData(
                          player1: player1name, player2: player2name));
                },
                child: Text(
                  "Lets Play ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
