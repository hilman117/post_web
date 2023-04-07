import 'package:flutter/material.dart';

Widget snackbarNotif(String title, String body) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      Text(body, style: const TextStyle(color: Colors.black)),
    ],
  );
}
