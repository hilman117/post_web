import 'package:flutter/material.dart';

class SendAndMoreButton extends StatelessWidget {
  const SendAndMoreButton({
    Key? key,
    required this.p1,
  }) : super(key: key);
  final BoxConstraints p1;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: Duration.zero,
        switchOutCurve: Curves.easeOutSine,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: p1.maxWidth * 0.02),
            height: p1.maxWidth * 0.06,
            width: p1.maxWidth * 0.06,
            decoration: const BoxDecoration(),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'image/send1.png',
                width: p1.maxWidth * 0.06,
              ),
            )));
  }
}
