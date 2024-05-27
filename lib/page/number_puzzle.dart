import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/page/widget/puzzle_piece.dart';
import 'package:tic_tac_toe/provider/number_puzzle.dart';

class PuzzleGame extends ConsumerStatefulWidget {
  const PuzzleGame({super.key});

  @override
  ConsumerState<PuzzleGame> createState() => _PuzzleGameState();
}

class _PuzzleGameState extends ConsumerState<PuzzleGame> {
  @override
  void initState() {
    super.initState();
    ref.read(puzzleNumberProvider).randomnumber();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(puzzleNumberProvider).checkwin(context);
    List allData = ref.watch(puzzleNumberProvider).alldataNumber;
    List availablePositioninList = ref.watch(puzzleNumberProvider).availablePos;
    List availablePosition = [];

    for (var i = 0; i < availablePositioninList.length; i++) {
      availablePosition.add(availablePositioninList[i].toString());
    }
    print(availablePosition);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Number Puzzle"),
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.88,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PuzzlePiece(
                      number: allData[0][0].toString(),
                      ontap: !(availablePosition.contains([0, 0].toString()))
                          ? () {}
                          : () {
                              ref
                                  .read(puzzleNumberProvider)
                                  .tileMove(0, 0, allData[0][0]);
                            },
                      swipe: (direction) {
                        ref
                            .read(puzzleNumberProvider)
                            .tileMove(0, 0, allData[0][0]);
                      },
                    ),
                    PuzzlePiece(
                      number: allData[0][1].toString(),
                      ontap: !(availablePosition.contains([0, 1].toString()))
                          ? () {}
                          : () {
                              ref
                                  .read(puzzleNumberProvider)
                                  .tileMove(0, 1, allData[0][1]);
                            },
                      swipe: (direction) {
                        ref
                            .read(puzzleNumberProvider)
                            .tileMove(0, 1, allData[0][1]);
                      },
                    ),
                    PuzzlePiece(
                      number: allData[0][2].toString(),
                      ontap: !(availablePosition.contains([0, 2].toString()))
                          ? () {}
                          : () {
                              ref
                                  .read(puzzleNumberProvider)
                                  .tileMove(0, 2, allData[0][2]);
                            },
                      swipe: (direction) {
                        ref
                            .read(puzzleNumberProvider)
                            .tileMove(0, 2, allData[0][2]);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PuzzlePiece(
                      number: allData[1][0].toString(),
                      ontap: !(availablePosition.contains([1, 0].toString()))
                          ? () {}
                          : () {
                              ref
                                  .read(puzzleNumberProvider)
                                  .tileMove(1, 0, allData[1][0]);
                            },
                      swipe: (direction) {
                        ref
                            .read(puzzleNumberProvider)
                            .tileMove(1, 0, allData[1][0]);
                      },
                    ),
                    PuzzlePiece(
                      number: allData[1][1].toString(),
                      ontap: !(availablePosition.contains([1, 1].toString()))
                          ? () {}
                          : () {
                              ref
                                  .read(puzzleNumberProvider)
                                  .tileMove(1, 1, allData[1][1]);
                            },
                      swipe: (direction) {
                        ref
                            .read(puzzleNumberProvider)
                            .tileMove(1, 1, allData[1][1]);
                      },
                    ),
                    PuzzlePiece(
                      number: allData[1][2].toString(),
                      ontap: !(availablePosition.contains([1, 2].toString()))
                          ? () {}
                          : () {
                              ref
                                  .read(puzzleNumberProvider)
                                  .tileMove(1, 2, allData[1][2]);
                            },
                      swipe: (direction) {
                        ref
                            .read(puzzleNumberProvider)
                            .tileMove(1, 2, allData[1][2]);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PuzzlePiece(
                      number: allData[2][0].toString(),
                      ontap: !(availablePosition.contains([2, 0].toString()))
                          ? () {}
                          : () {
                              ref
                                  .read(puzzleNumberProvider)
                                  .tileMove(2, 0, allData[2][0]);
                            },
                      swipe: (direction) {
                        ref
                            .read(puzzleNumberProvider)
                            .tileMove(2, 0, allData[2][0]);
                      },
                    ),
                    PuzzlePiece(
                      number: allData[2][1].toString(),
                      ontap: !(availablePosition.contains([2, 1].toString()))
                          ? () {}
                          : () {
                              ref
                                  .read(puzzleNumberProvider)
                                  .tileMove(2, 1, allData[2][1]);
                            },
                      swipe: (direction) {
                        ref
                            .read(puzzleNumberProvider)
                            .tileMove(2, 1, allData[2][1]);
                      },
                    ),
                    PuzzlePiece(
                      number: allData[2][2].toString(),
                      ontap: !(availablePosition.contains([2, 2].toString()))
                          ? () {}
                          : () {
                              ref
                                  .read(puzzleNumberProvider)
                                  .tileMove(2, 2, allData[2][2]);
                            },
                      swipe: (direction) {
                        print(direction.index);
                        ref
                            .read(puzzleNumberProvider)
                            .tileMove(2, 2, allData[2][2]);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
