import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TicTacComponent extends StatelessWidget {
  final String iscross;
  final Function ontap;
  const TicTacComponent(
      {super.key, required this.iscross, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          ontap();
        },
        child: Container(
          height: 100,
          width: 100,
          child: (iscross == "")
              ? const SizedBox.shrink()
              : Lottie.asset(
                  (iscross == "X") ? 'assets/cross.json' : "assets/circle.json",
                  repeat: false,
                  reverse: true,
                  animate: true,
                ),
          // : Icon(
          //     (iscross == "X") ? Icons.close : Icons.circle_outlined,
          //     size: 100,
          //     color: (iscross == "X") ? Colors.red : Colors.green,
          //   ),
        ),
      ),
    );
  }
}
