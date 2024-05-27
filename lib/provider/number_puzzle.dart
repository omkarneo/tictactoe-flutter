import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final puzzleNumberProvider =
    ChangeNotifierProvider((ref) => PuzzleNumberModel());

class PuzzleNumberModel extends ChangeNotifier {
  List<dynamic> alldataNumber = [
    <dynamic>[1, 2, 3],
    <dynamic>[4, 5, 6],
    <dynamic>[7, 8, ""]
  ];
  List emptypos = [2, 2];
  List availablePos = [
    [2, 1],
    [1, 2]
  ];
  randomnumber() {
    List randomList = [1, 2, 3, 4, 5, 6, 7, 8, ""];
    randomList.shuffle();
    int counter = 0;
    for (int i = 0; i < 3; i++) {
      alldataNumber[i] = [
        randomList[counter],
        randomList[counter + 1],
        randomList[counter + 2]
      ];
      counter = counter + 3;
    }
    for (int i = 0; i < alldataNumber.length; i++) {
      for (int j = 0; j < alldataNumber[i].length; j++) {
        if (alldataNumber[i][j] == "") {
          emptypos = [i, j];
        }
      }
      if (listEquals(emptypos, [1, 1])) {
        availablePos = [
          [0, 1],
          [2, 1],
          [1, 0],
          [1, 2]
        ];
      } else {
        availablePos = [
          [(emptypos[0] == 2) ? emptypos[0] - 1 : emptypos[0] + 1, emptypos[1]],
          [emptypos[0], (emptypos[1] == 2) ? emptypos[1] - 1 : emptypos[1] + 1],
          (emptypos[1] == 1)
              ? [emptypos[0], 0]
              : (emptypos[1] == 0 || emptypos[1] == 2)
                  ? [0, emptypos[1]]
                  : []
        ];
      }
    }
  }

  winnerDialog(context) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Puzzle Solved',
            style: TextStyle(fontSize: 20),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Play Again'),
              onPressed: () {
                Navigator.of(context).pop();
                // Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((value) {
      randomnumber();
      notifyListeners();
    });
  }

  tileMove(x, y, number) {
    for (int i = 0; i < alldataNumber.length; i++) {
      for (int j = 0; j < alldataNumber[i].length; j++) {
        if (alldataNumber[i][j] == "") {
          emptypos = [i, j];
        }
      }
    }
    alldataNumber[emptypos[0]][emptypos[1]] = number;
    alldataNumber[x][y] = "";
    emptypos = [x, y];
    if (listEquals(emptypos, [1, 1])) {
      availablePos = [
        [0, 1],
        [2, 1],
        [1, 0],
        [1, 2]
      ];
    } else {
      availablePos = [
        [(emptypos[0] == 2) ? emptypos[0] - 1 : emptypos[0] + 1, emptypos[1]],
        [emptypos[0], (emptypos[1] == 2) ? emptypos[1] - 1 : emptypos[1] + 1],
        (emptypos[1] == 1)
            ? [emptypos[0], 0]
            : (emptypos[1] == 0 || emptypos[1] == 2)
                ? (emptypos[0] == 2 && emptypos[1] == 2)
                    ? []
                    : (emptypos[0] == 2 && emptypos[1] == 0)
                        ? []
                        : [0, emptypos[1]]
                : []
      ];
    }
    notifyListeners();
  }

  checkwin(context) {
    List winningList = [
      <dynamic>[1, 2, 3].toString(),
      <dynamic>[4, 5, 6].toString(),
      <dynamic>[7, 8, ""].toString()
    ];
    List currentListString = [];
    for (int i = 0; i < alldataNumber.length; i++) {
      currentListString.add(alldataNumber[i].toString());
    }
    // print(currentListString);
    for (int i = 0; i < winningList.length; i++) {
      if (winningList[i] != currentListString[i]) {
        return true;
      }
    }
    Future.delayed(Duration(microseconds: 500), () {
      return winnerDialog(context);
    });
  }
}
