import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class MyState extends ChangeNotifier {
  var isSelected = false;
  var what_Selected;
  Color SelectedColor = Colors.greenAccent;

  var turn = "X";
  Map game = {0: "", 1: "", 2: "", 3: "", 4: "", 5: "", 6: "", 7: "", 8: ""};
  void changeTurn() {
    if (turn == "X") {
      turn = "O";
    } else {
      turn = "X";
    }
    notifyListeners();
  }

  void restart() {
    game.clear();
    game = {0: "", 1: "", 2: "", 3: "", 4: "", 5: "", 6: "", 7: "", 8: ""};
    winner = "";
    notifyListeners();
  }

  bool has_winner = false;
  void showWinner(context) {
    Future.delayed(Duration(seconds: 1)).then((a) => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.green[100],
            content: Container(
              alignment: Alignment.center,
              height: 200,
              width: 500,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Winner is : $winner",
                        style: GoogleFonts.russoOne(
                            color: Colors.black, fontSize: 32)),
                    ElevatedButton(
                      onPressed: () {
                        restart();
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.replay),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green)),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }

  var winner = "";
  void checkWinner(context) {
    if (winner == "" && (game[0] == "X" && game[1] == "X" && game[2] == "X") ||
        winner == "" && (game[3] == "X" && game[4] == "X" && game[5] == "X") ||
        winner == "" && (game[6] == "X" && game[7] == "X" && game[8] == "X") ||
        winner == "" && (game[0] == "X" && game[4] == "X" && game[8] == "X") ||
        winner == "" && (game[2] == "X" && game[4] == "X" && game[6] == "X")) {
      print("we have a winner X");
      has_winner = true;

      winner = "X";
      showWinner(context);
    } else if ((game[0] == "O" && game[1] == "O" && game[2] == "O") ||
        (game[3] == "O" && game[4] == "O" && game[5] == "O") ||
        (game[6] == "O" && game[7] == "O" && game[8] == "O") ||
        (game[0] == "O" && game[4] == "O" && game[8] == "O") ||
        (game[2] == "O" && game[4] == "O" && game[6] == "O")) {
      print("We have a winner O");

      has_winner = true;
      winner = "O";
      showWinner(context);
    }
  }

  void select(var val) {
    what_Selected = val;
    isSelected = true;
    notifyListeners();
  }
}
