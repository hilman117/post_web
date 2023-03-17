import 'package:flutter/material.dart';
import 'package:post_web/const.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
