import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget tableTitle(BuildContext context) {
  final theme = Theme.of(context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        alignment: Alignment.centerLeft,
        width: 280.w,
        child: Text("Sender", style: theme.textTheme.displayMedium),
      ),
      Container(
        alignment: Alignment.center,
        width: 70.w,
        child: Text("To", style: theme.textTheme.displayMedium),
      ),
      Container(
        alignment: Alignment.centerLeft,
        width: 200.w,
        child: Text("Location", style: theme.textTheme.displayMedium),
      ),
      Container(
        alignment: Alignment.centerLeft,
        width: 200.w,
        child: Text("Title", style: theme.textTheme.displayMedium),
      ),
      Container(
        alignment: Alignment.centerLeft,
        width: 200.w,
        child: Text("Description", style: theme.textTheme.displayMedium),
      ),
      Container(
        alignment: Alignment.center,
        width: 200.w,
        child: Text("Status", style: theme.textTheme.displayMedium),
      ),
      Container(
        alignment: Alignment.center,
        width: 230.w,
        child: Text("Receiver", style: theme.textTheme.displayMedium),
      ),
      Container(
        alignment: Alignment.center,
        width: 200.w,
        child: Text("Action", style: theme.textTheme.displayMedium),
      ),
      Container(
        alignment: Alignment.center,
        width: 200.w,
        child: Text("Time", style: theme.textTheme.displayMedium),
      ),
    ],
  );
}
