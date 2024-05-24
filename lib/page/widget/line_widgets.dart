import 'package:flutter/material.dart';

class YAxisui extends StatelessWidget {
  const YAxisui({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 100,
        ),
        Container(
          // height: 100,
          width: MediaQuery.sizeOf(context).height,
          height: 10,
          color: Colors.red,
        ),
        const SizedBox(
          height: 100,
        ),
        Container(
          // height: 10,
          width: MediaQuery.sizeOf(context).height,
          height: 10,
          color: Colors.blue,
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}

class XAxisUI extends StatelessWidget {
  const XAxisUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 100,
        ),
        Container(
          // height: 100,
          height: MediaQuery.sizeOf(context).height,
          width: 10,
          color: Colors.green,
        ),
        const SizedBox(
          width: 100,
        ),
        Container(
          // height: 10,
          height: MediaQuery.sizeOf(context).height,
          width: 10,
          color: Colors.yellow,
        ),
        const SizedBox(
          width: 100,
        ),
      ],
    );
  }
}
