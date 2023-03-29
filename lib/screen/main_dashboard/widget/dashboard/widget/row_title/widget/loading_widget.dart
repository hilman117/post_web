import 'package:flutter/material.dart';
import 'package:post_web/const.dart';

Widget loadingWidget() {
  return Scaffold(
    backgroundColor: Colors.black.withOpacity(0.3),
    body: Center(
      child: Transform.scale(
        scale: 2.0,
        child: const CircularProgressIndicator.adaptive(
          backgroundColor: mainColor2,
        ),
      ),
    ),
  );
}
