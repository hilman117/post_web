import 'package:flutter/material.dart';

class ContainerMark extends StatelessWidget {
  const ContainerMark({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
    );
  }
}
