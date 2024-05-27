import 'package:flutter/material.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

class PuzzlePiece extends StatelessWidget {
  final String number;
  final Function ontap;
  final Function(SwipeDirection direction)? swipe;
  const PuzzlePiece(
      {super.key,
      required this.number,
      required this.ontap,
      required this.swipe});

  @override
  Widget build(BuildContext context) {
    return Draggable(
      // data: Colors.blue,
      // axis: [Axis.horizontal,Axis.vertical],
      onDragEnd: (details) {
        ontap();
      },
      rootOverlay: true,
      // affinity: Axis.vertical,
      childWhenDragging: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.14,
          width: MediaQuery.sizeOf(context).width * 0.25,
        ),
      ),
      // feedback: SizedBox(),
      feedback: PuzzleContainer(number: number),
      child: PuzzleContainer(number: number),
    );
  }
}

class PuzzleContainer extends StatelessWidget {
  const PuzzleContainer({
    super.key,
    required this.number,
  });

  final String number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.14,
        width: MediaQuery.sizeOf(context).width * 0.25,
        decoration: BoxDecoration(
            color: (number != "") ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(
          number,
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
