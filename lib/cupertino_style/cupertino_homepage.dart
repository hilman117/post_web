import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CupertinoHomePage extends StatelessWidget {
  const CupertinoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  border:
                      Border(right: BorderSide(color: Colors.grey.shade300))),
              width: 100.w,
              child: Column(
                children: [
                  IconButton.filled(
                      color: Colors.blue,
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Colors.blue),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r)))),
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.chat_bubble,
                        color: Colors.white,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
