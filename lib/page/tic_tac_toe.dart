import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/page/widget/line_widgets.dart';
import 'package:tic_tac_toe/page/widget/tic_tac_widget.dart';
import 'package:tic_tac_toe/provider/tictactoe.dart';

class GamePage extends ConsumerStatefulWidget {
  const GamePage({super.key});

  @override
  ConsumerState<GamePage> createState() => _GamePageState();
}

class _GamePageState extends ConsumerState<GamePage> {
  @override
  Widget build(BuildContext context) {
    int counter = ref.watch(ticTacToeProvider).counter;
    var allValues = ref.watch(ticTacToeProvider).updatedialog;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic Tac Toe"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(ticTacToeProvider).resetGame();
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                overflow: TextOverflow.clip,
                textAlign: TextAlign.end,
                textDirection: TextDirection.rtl,
                softWrap: true,
                text: TextSpan(children: [
                  TextSpan(
                      text: "${counter % 2 == 0 ? "X" : "O"}'s",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: counter % 2 == 0 ? Colors.red : Colors.green)),
                  const TextSpan(
                      text: " Turns",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black))
                ]),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 500,
              width: 500,
              child: Stack(
                children: [
                  const XAxisUI(),
                  const YAxisui(),
                  Column(
                    children: [
                      Row(
                        children: [
                          TicTacComponent(
                            ontap: (allValues[0][0] != "")
                                ? () {}
                                : () {
                                    ref.read(ticTacToeProvider).updatemodel(
                                        0, 0, counter % 2 == 0 ? "X" : "0");
                                    ref.read(ticTacToeProvider).checkwinner(
                                        counter % 2 == 0 ? "X" : "0", context);
                                  },
                            iscross: allValues[0][0],
                          ),
                          TicTacComponent(
                            ontap: (allValues[0][1] != "")
                                ? () {}
                                : () {
                                    ref.read(ticTacToeProvider).updatemodel(
                                        0, 1, counter % 2 == 0 ? "X" : "0");
                                    ref.read(ticTacToeProvider).checkwinner(
                                        counter % 2 == 0 ? "X" : "0", context);
                                  },
                            iscross: allValues[0][1],
                          ),
                          TicTacComponent(
                            ontap: (allValues[0][2] != "")
                                ? () {}
                                : () {
                                    ref.read(ticTacToeProvider).updatemodel(
                                        0, 2, counter % 2 == 0 ? "X" : "0");
                                    ref.read(ticTacToeProvider).checkwinner(
                                        counter % 2 == 0 ? "X" : "0", context);
                                  },
                            iscross: allValues[0][2],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Row(
                        children: [
                          TicTacComponent(
                            ontap: (allValues[1][0] != "")
                                ? () {}
                                : () {
                                    ref.read(ticTacToeProvider).updatemodel(
                                        1, 0, counter % 2 == 0 ? "X" : "0");
                                    ref.read(ticTacToeProvider).checkwinner(
                                        counter % 2 == 0 ? "X" : "0", context);
                                  },
                            iscross: allValues[1][0],
                          ),
                          TicTacComponent(
                            ontap: (allValues[1][1] != "")
                                ? () {}
                                : () {
                                    ref.read(ticTacToeProvider).updatemodel(
                                        1, 1, counter % 2 == 0 ? "X" : "0");
                                    ref.read(ticTacToeProvider).checkwinner(
                                        counter % 2 == 0 ? "X" : "0", context);
                                  },
                            iscross: allValues[1][1],
                          ),
                          TicTacComponent(
                            ontap: (allValues[1][2] != "")
                                ? () {}
                                : () {
                                    ref.read(ticTacToeProvider).updatemodel(
                                        1, 2, counter % 2 == 0 ? "X" : "0");
                                    ref.read(ticTacToeProvider).checkwinner(
                                        counter % 2 == 0 ? "X" : "0", context);
                                  },
                            iscross: allValues[1][2],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Row(
                        children: [
                          TicTacComponent(
                            ontap: (allValues[2][0] != "")
                                ? () {}
                                : () {
                                    ref.read(ticTacToeProvider).updatemodel(
                                        2, 0, counter % 2 == 0 ? "X" : "0");
                                    ref.read(ticTacToeProvider).checkwinner(
                                        counter % 2 == 0 ? "X" : "0", context);
                                  },
                            iscross: allValues[2][0],
                          ),
                          TicTacComponent(
                            ontap: (allValues[2][1] != "")
                                ? () {}
                                : () {
                                    ref.read(ticTacToeProvider).updatemodel(
                                        2, 1, counter % 2 == 0 ? "X" : "0");
                                    ref.read(ticTacToeProvider).checkwinner(
                                        counter % 2 == 0 ? "X" : "0", context);
                                  },
                            iscross: allValues[2][1],
                          ),
                          TicTacComponent(
                            ontap: (allValues[2][2] != "")
                                ? () {}
                                : () {
                                    ref.read(ticTacToeProvider).updatemodel(
                                        2, 2, counter % 2 == 0 ? "X" : "0");
                                    ref.read(ticTacToeProvider).checkwinner(
                                        counter % 2 == 0 ? "X" : "0", context);
                                  },
                            iscross: allValues[2][2],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



  // SizedBox(
          //   height: 500,
          //   width: 500,
          //   child: Column(
          //     children: [
          //       Row(
          //         children: [
                    // Expanded(
                    //   child: Container(
                    //     height: 100,
                    //     width: 100,
                    //     child: const Icon(
                    //       Icons.close,
                    //       size: 100,
                    //     ),
                    //   ),
                    // ),
          //           Expanded(
          //             child: Container(
          //               height: 100,
          //               width: 100,
          //               child: const Icon(
          //                 Icons.circle_outlined,
          //                 size: 100,
          //               ),
          //             ),
          //           ),
          //           Expanded(
          //             child: Container(
          //               height: 100,
          //               width: 100,
          //               child: const Icon(
          //                 Icons.close,
          //                 size: 100,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         children: [
          //           Expanded(
          //             child: Container(
          //               height: 100,
          //               width: 100,
          //               child: const Icon(
          //                 Icons.close,
          //                 size: 100,
          //               ),
          //             ),
          //           ),
          //           Expanded(
          //             child: Container(
          //               height: 100,
          //               width: 100,
          //               child: const Icon(
          //                 Icons.circle_outlined,
          //                 size: 100,
          //               ),
          //             ),
          //           ),
          //           Expanded(
          //             child: Container(
          //               height: 100,
          //               width: 100,
          //               child: const Icon(
          //                 Icons.close,
          //                 size: 100,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         children: [
          //           Expanded(
          //             child: Container(
          //               height: 100,
          //               width: 100,
          //               child: const Icon(
          //                 Icons.close,
          //                 size: 100,
          //               ),
          //             ),
          //           ),
          //           Expanded(
          //             child: Container(
          //               height: 100,
          //               width: 100,
          //               child: const Icon(
          //                 Icons.circle_outlined,
          //                 size: 100,
          //               ),
          //             ),
          //           ),
          //           Expanded(
          //             child: Container(
          //               height: 100,
          //               width: 100,
          //               child: const Icon(
          //                 Icons.close,
          //                 size: 100,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),