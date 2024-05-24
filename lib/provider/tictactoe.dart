import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

final ticTacToeProvider = ChangeNotifierProvider((ref) => TicTacToeModel());

class TicTacToeModel extends ChangeNotifier {
  List updatedialog = [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""]
  ];
  String winner = "";
  int counter = 0;

  void updatemodel(x, y, value) {
    updatedialog[x][y] = value;
    counter++;
    notifyListeners();
  }

  winnerDialog(context, player) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Lottie.asset(
                      (player == "X")
                          ? 'assets/cross.json'
                          : "assets/circle.json",
                      repeat: false,
                      reverse: true,
                      animate: true,
                      height: 100,
                      width: 100),
                ),
                const Text(
                  ' is winner',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            TextButton(
              child: const Text('Play Again'),
              onPressed: () {
                resetGame();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((value) {
      counter = 0;
    });
  }

  drawDialog(context) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game is Draw'),
          actions: <Widget>[
            TextButton(
              child: const Text('Play Again'),
              onPressed: () {
                resetGame();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((value) {
      counter = 0;
    });
  }

  checkwinner(String player, context) {
    if (updatedialog[0][0] == updatedialog[0][1] &&
        updatedialog[0][1] == updatedialog[0][2] &&
        updatedialog[0][2] == player) {
      return winnerDialog(context, player);
      // winner = player;
    } else if (updatedialog[1][0] == updatedialog[1][1] &&
        updatedialog[1][1] == updatedialog[1][2] &&
        updatedialog[1][2] == player) {
      return winnerDialog(context, player);
      // winner = player;
    } else if (updatedialog[2][0] == updatedialog[2][1] &&
        updatedialog[2][1] == updatedialog[2][2] &&
        updatedialog[2][2] == player) {
      return winnerDialog(context, player);
      // winner = player;
    } else if (updatedialog[0][0] == updatedialog[1][1] &&
        updatedialog[1][1] == updatedialog[2][2] &&
        updatedialog[2][2] == player) {
      return winnerDialog(context, player);
      // winner = player;
    } else if (updatedialog[0][2] == updatedialog[1][2] &&
        updatedialog[1][2] == updatedialog[2][2] &&
        updatedialog[2][2] == player) {
      return winnerDialog(context, player);
      // winner = player;
    } else if (updatedialog[0][0] == updatedialog[1][0] &&
        updatedialog[1][0] == updatedialog[2][0] &&
        updatedialog[2][0] == player) {
      return winnerDialog(context, player);
      // winner = player;
    } else if (updatedialog[0][1] == updatedialog[1][1] &&
        updatedialog[1][1] == updatedialog[2][1] &&
        updatedialog[2][1] == player) {
      return winnerDialog(context, player);
      // winner = player;
    } else if (updatedialog[0][2] == updatedialog[1][1] &&
        updatedialog[1][1] == updatedialog[2][0] &&
        updatedialog[2][0] == player) {
      return winnerDialog(context, player);
      // winner = player;
    }
    if (counter == 9) {
      return drawDialog(context);
    }
    notifyListeners();
  }

  void resetGame() {
    updatedialog = [
      ["", "", ""],
      ["", "", ""],
      ["", "", ""]
    ];
    counter = 0;
    notifyListeners();
  }
}
