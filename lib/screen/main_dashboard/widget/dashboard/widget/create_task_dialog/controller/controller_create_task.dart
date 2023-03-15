import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:post_web/firebase/firebase_create_task.dart';
import 'package:post_web/reusable_widget/show_dialog.dart';
import 'package:uuid/uuid.dart';

class CreateController with ChangeNotifier {
  //function for searching title and location on [CREATETASKDIALOG]
  String searchingTitle = "";
  String searchingLocation = "";
  searchingTitleAndLocation({String? searchTitle, String? searchLocation}) {
    searchingTitle = searchTitle ?? "";
    searchingLocation = searchLocation ?? "";
    notifyListeners();
  }

  bool isSearchingTitleFocus = false;
  bool isSearchingLocationFocus = false;
  searchingFocuse({bool? titleNewBool, bool? locationNewBool}) {
    isSearchingTitleFocus = titleNewBool ?? false;
    isSearchingLocationFocus = locationNewBool ?? false;
    notifyListeners();
    // print("title $isSearchingTitleFocus");
    // print("location $isSearchingLocationFocus");
    notifyListeners();
  }

  String definedTitle = "";
  String definedLocation = "";
  void selectingLocationAndTitle({String? title, String? location}) {
    definedTitle = title ?? definedTitle;
    definedLocation = location ?? definedLocation;
    notifyListeners();
  }

  //[PICK IMAGE]
  String imageName = '';
  final ImagePicker _picker = ImagePicker();
  List<Uint8List> imageList = [];
  List<String> imageUrl = [];
  Future<void> selectImage() async {
    List<XFile?> selectedImages =
        await _picker.pickMultiImage(imageQuality: 30);
    if (selectedImages.isNotEmpty) {
      for (var element in selectedImages) {
        imageList.add(await XFile(element!.path).readAsBytes());
        notifyListeners();
      }
    }

    // print(imageList.length);
  }

  void removeSingleImage(int index) {
    imageList.removeAt(index);
    imageName = '';
    notifyListeners();
  }

  void clearImage() {
    imageList.clear();
    notifyListeners();
  }
  //-----------------------------------------------------------------

  //[TIME PICKER]
  String _newTime = '';
  String get newTime => _newTime;
  clearTime() {
    _newTime = '';
    currentTime = null;
    _selectedTime = "";
    notifyListeners();
  }

  String _selectedTime = '';
  String get selectedTime => _selectedTime;
  TimeOfDay? currentTime;
  timePIcker(BuildContext context) async {
    return showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      if (value != null) {
        currentTime = value;
        _selectedTime = value.format(context);
        _newTime = value.format(context);
        changeTime(_selectedTime);
        // print(currentTime!.hour);
        // print(currentTime!.minute);
        notifyListeners();
      } else {
        _selectedTime = _selectedTime;
        _newTime = '';
        notifyListeners();
      }
    });
  }

  void changeTime(String timeChange) {
    _selectedTime = timeChange;
    notifyListeners();
  }

  String _newDate = '';
  String get newDate => _newDate;
  String _datePicked = '';
  String get datePicked => _datePicked;
  DateTime? _setDate;
  DateTime? get setDate => _setDate;
  dateTimPicker(BuildContext context) async {
    var resultDate = await showDatePicker(
        confirmText: "Set",
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        lastDate: DateTime(
            DateTime.now().month == 12
                ? DateTime.now().year + 1
                : DateTime.now().year,
            DateTime.now().month == 12 ? 1 : DateTime.now().month + 1,
            DateTime.now().day));
    if (resultDate == null) {
      _datePicked = _datePicked;
      _newDate = '';
      notifyListeners();
    } else {
      _setDate = DateTime(resultDate.year, resultDate.month, resultDate.day);
      _datePicked = _setDate.toString();
      _newDate = DateFormat('EEEE, d MMM').format(_setDate!);
      changeDate(_datePicked);
      notifyListeners();
      // print(resultDate);
      // print(setDate);
      // print(DateFormat('M').format(_setDate!));
    }
  }

  cancelButton(String oldDate, String oldTime) {
    _datePicked = oldDate;
    _selectedTime = oldTime;
    notifyListeners();
  }

  void changeDate(String dateChange) {
    _datePicked = dateChange;
    notifyListeners();
  }

  void clearDate() {
    _setDate = null;
    _newDate = '';
    notifyListeners();
  }

  bool isLoding = false;
  var db = FirebaseCreateTask();
  final uid = const Uuid().v1();
  Future<void> createTask(
      {required BuildContext context,
      required String departementSendTo,
      required String hotelName,
      required TextEditingController description,
      required String emailSender,
      required String colorUser,
      required String deptSender,
      required String positionSender,
      required String imageProfileSender,
      required String senderName}) async {
    if (definedTitle == "") {
      ShowDialog().errorDialog(context, "Title is empty");
    } else if (definedLocation == "") {
      ShowDialog().errorDialog(context, "Location is empty");
    } else if (departementSendTo == "") {
      ShowDialog().errorDialog(context, "Location is empty");
    } else {
      isLoding = true;
      notifyListeners();
      try {
        await db.createTask(
            context: context,
            hotelName: hotelName,
            assigned: departementSendTo,
            image: imageUrl,
            description: description.text,
            emailReceiver: "",
            emailSender: emailSender,
            from: deptSender,
            id: uid,
            location: definedLocation,
            positionSender: positionSender,
            profileImageSender: imageProfileSender,
            receiver: "",
            sendTo: departementSendTo,
            sender: senderName,
            setDate: _newDate,
            setTime: selectedTime,
            time: DateTime.now().toString(),
            title: definedTitle,
            colorUser: colorUser);
        Navigator.of(context).pop();
        isLoding = false;
      } on FirebaseException catch (e) {
        print(e.toString());
      }
    }
  }
}
