import 'package:flutter/material.dart';

String remainingDateTime(BuildContext context, DateTime dateTime) {
  int differentDays = DateTime.now().difference(dateTime).inDays;
  int differentHour = DateTime.now().difference(dateTime).inHours;
  int differentMinute = DateTime.now().difference(dateTime).inMinutes;
  int differentSecond = DateTime.now().difference(dateTime).inSeconds;

  if (differentDays >= 30) {
    return '';
  }
  if (differentDays >= 21 && differentDays < 30) {
    return '3 weeks ago';
  }
  if (differentDays >= 14 && differentDays < 21) {
    return '2 weeks ago';
  }
  if (differentDays >= 7 && differentDays < 14) {
    return "A week ago";
  }
  if (differentDays == 1) {
    return 'Yesterday';
  }
  if (differentDays > 1) {
    return '$differentDays days ago';
  }
  if (differentHour == 1) {
    return 'An hour ago';
  }
  if (differentHour > 1) {
    return '$differentHour hours ago';
  }
  if (differentMinute == 1) {
    return '$differentMinute min ago';
  }
  if (differentMinute > 1) {
    return '$differentMinute mins ago';
  }
  if (differentSecond < 60) {
    return "Just now";
  }
  return '$differentDays days ago';
}
