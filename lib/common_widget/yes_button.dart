import 'package:flutter/material.dart';
import 'package:post_web/other.dart';

class YesButton extends StatelessWidget {
  const YesButton({
    Key? key,
    required this.p2,
    required this.nameButton,
    required this.callback,
    this.icon,
  }) : super(key: key);
  final BoxConstraints p2;
  final String nameButton;
  final VoidCallback callback;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: p2.maxWidth * 0.05),
      width: p2.maxWidth * 0.15,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: mainColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: callback,
          child: Row(
            mainAxisAlignment: icon != null
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.center,
            children: [
              icon != null
                  ? Icon(
                      icon,
                      size: p2.maxWidth * 0.015,
                    )
                  : const SizedBox(),
              Text(
                nameButton,
                style: TextStyle(fontSize: p2.maxWidth * 0.015),
              )
            ],
          )),
    );
  }
}
