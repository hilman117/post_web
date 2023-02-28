import 'package:flutter/material.dart';

class ClearCancelApply extends StatelessWidget {
  const ClearCancelApply({Key? key, required this.p1}) : super(key: key);
  final BoxConstraints p1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: p1.maxHeight * 0.17,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: p1.maxWidth * 0.03,
              ),
              child: Text("Clear all filters",
                  style: TextStyle(
                      fontSize: p1.maxWidth * 0.03, color: Colors.red)),
            ),
            const Spacer(),
            SizedBox(
              width: p1.maxWidth * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Cancel",
                      style: TextStyle(
                          fontSize: p1.maxWidth * 0.03, color: Colors.grey)),
                  Text("Apply",
                      style: TextStyle(
                          fontSize: p1.maxWidth * 0.03, color: Colors.blue)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
