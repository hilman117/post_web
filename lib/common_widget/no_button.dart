import 'package:flutter/material.dart';

class NoButton extends StatelessWidget {
  const NoButton({
    Key? key,
    required this.p2,
    required this.callback,
    this.icon,
  }) : super(key: key);
  final BoxConstraints p2;
  final VoidCallback callback;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: p2.maxWidth * 0.05),
      width: p2.maxWidth * 0.15,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
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
                      color: Colors.black54,
                    )
                  : const SizedBox(),
              Text(
                "Cancel",
                style: TextStyle(
                    fontSize: p2.maxWidth * 0.015, color: Colors.black54),
              )
            ],
          )),
    );
  }
}
