import 'package:flutter/material.dart';

class CreateController with ChangeNotifier {
  int _selectedTaskType = 0;
  int get selectedTaskType => _selectedTaskType;
  List<String> taskType = ["Task/ request", "Lost & Found Report"];
  selectTaskType(int value) {
    _selectedTaskType = value;
    notifyListeners();
  }
}
