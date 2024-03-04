// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/const.dart';

import 'package:uuid/uuid.dart';

class TaskController with ChangeNotifier {
  final cUser = Get.put(CUser());
  final auth = FirebaseAuth.instance;
  bool _isCreateRequest = true;
  bool get isCreateRequest => _isCreateRequest;

  final List<String> _departments = [];
  List<String> get departments => _departments;
  getDeptartement() async {
    _departments.clear();
    var result = await FirebaseFirestore.instance
        .collection("users")
        .where("hotelid", isEqualTo: cUser.data.hotelid)
        .get();
    Set listDepartement =
        result.docs.map((e) => e.data()['department']).toSet();
    List<String> list = List.castFrom(listDepartement.toList());
    _departments.addAll(list);
    notifyListeners();
  }

  String _selectedDept = 'Choose Department';
  String get selectedDept => _selectedDept;
  void selectDept(int index) {
    _selectedDept = _departments[index];
    _selectedTitle = 'Input Title';
    // print(_selectedDept);
    notifyListeners();
  }

  void clearData() {
    _selectedDept = 'Choose Department';
    _selectedTitle = 'Input Title';

    _imageUrl.clear();
    notifyListeners();
    // print(_imageUrl.toString());
  }

  final List<String> _title = [];
  List<String> get title => _title;
  String _selectedTitle = 'Input Title';
  String get selectedtitle => _selectedTitle;
  getTitle(String hotelid, String selectedDept) async {
    _title.clear();
    notifyListeners();
    var result = await FirebaseFirestore.instance
        .collection("Hotel List")
        .doc(hotelid)
        .collection("Department")
        .doc(selectedDept)
        .get();
    // print(result.data()!['title'].runtimeType);
    List<String> list = List.castFrom(result.data()!['title']);
    _title.addAll(list);
    notifyListeners();
  }

  void selectTitle(BuildContext context, int index) {
    _selectedTitle = _title[index];
    Navigator.pop(context);
    _searchtitle.clear();
    // print(_selectedTitle);
    notifyListeners();
  }

  final TextEditingController _searchtitle = TextEditingController();
  TextEditingController get searchtitle => _searchtitle;
  String _searchTitle = '';
  String get searchTitle => _searchTitle;
  void setstate(String value) {
    _searchTitle = value;
    notifyListeners();
  }

  void clearSearchTitle() {
    _searchtitle.clear();
    _searchTitle = '';
    notifyListeners();
  }

  final List<String> _data = [];
  List<String> get data => _data;
  getLocation(String hotelId) async {
    _selectedLocation.clear();
    _data.clear();
    var result = await FirebaseFirestore.instance
        .collection("Hotel List")
        .doc(hotelId)
        .get();
    List<String> list = List.castFrom(result.data()!['location']);
    _data.addAll(list);
    notifyListeners();
  }

  Future searchLocation(String param) async {
    List<String> result = data
        .where((element) => element.toLowerCase().contains(param.toLowerCase()))
        .toList();
    return result;
  }

  final TextEditingController _selectedLocation = TextEditingController();
  TextEditingController get selectedLocation => _selectedLocation;
  void selectLocation(String suggestion) {
    _selectedLocation.text = suggestion;
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

  String _newTime = '';
  String get newTime => _newTime;
  clear() {
    _newDate = '';
    _newTime = '';
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

  void clearSchedule() {
    _setDate = null;
    currentTime = null;
    _datePicked = '';
    _selectedTime = '';
    _newDate = '';
    _newTime = '';
    notifyListeners();
  }

  final List<XFile?> _imageList = [];
  List<XFile?> get imagesList => _imageList;
  XFile? _fromCamera;
  XFile? get fromCamera => _fromCamera;
  final List<String> _imageUrl = [];
  List<String> get imageUrl => _imageUrl;
  String imageName = '';
  TextEditingController descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  Future<void> selectImage(ImageSource source) async {
    List<XFile>? selectedImage = await _picker.pickMultiImage(imageQuality: 30);
    if (selectedImage.isNotEmpty) {
      _imageList.addAll(selectedImage);
      // print(_imageList.length);
    }
    notifyListeners();
  }

  Future<void> selectFromCamera() async {
    _fromCamera =
        await _picker.pickImage(imageQuality: 30, source: ImageSource.camera);
    if (_fromCamera != null) {
      _imageList.add(_fromCamera);
      // print(_imageList.length);
    }
    notifyListeners();
  }

  void restartVariable() {
    _fromCamera = null;
    imageName = '';
    imageUrl.clear();
    _imageList.clear();
    nameItem.clear();

    _isCreateRequest = true;
    notifyListeners();
  }

  void removeSingleImage(int index) {
    _imageList.removeAt(index);
    imageName = '';
    notifyListeners();
  }

  //to update how many requests are made by this user
  int _createTotal = 0;
  int get createTotal => _createTotal;
  getTotalCreate() async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(auth.currentUser!.email)
        .get();
    _createTotal = userDoc['createRequest'];
    // print('this is total request are accepted by this user $_createTotal');
    notifyListeners();
  }

  int? _newTotal;
  int? get newTotal => _newTotal;
  addNewRequestTotal(BuildContext context, int addOne) {
    if (_newTotal == null) {
      _newTotal = _createTotal + addOne;
      notifyListeners();
    } else {
      _newTotal = (newTotal! + addOne);
      notifyListeners();
    }
  }

  bool _isLoading = false;
  bool get isLodaing => _isLoading;
  String _idTask = '';
  String get idTask => _idTask;
  TextEditingController descriptionTask = TextEditingController();
  Future<void> tasks(
      String imageSender,
      BuildContext context,
      String hotelId,
      String userId,
      TextEditingController controller,
      String senderName,
      String senderDept,
      String senderEmail,
      String location,
      String idTask) async {
    // try {
    // final application = AppLocalizations.of(context);
    if (_selectedDept == 'Choose Department') {
      Fluttertoast.showToast(
          msg: "Please select department",
          backgroundColor: Colors.white,
          textColor: mainColor);
    } else if (location.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please select location",
          backgroundColor: Colors.white,
          textColor: mainColor);
    } else if (_selectedTitle == 'Input Title') {
      Fluttertoast.showToast(
          msg: "Title is empty",
          backgroundColor: Colors.white,
          textColor: mainColor);
    } else {
      _isLoading = true;
      notifyListeners();
      if (_imageList.isNotEmpty) {
        List.generate(_imageList.length, (index) async {
          String imageExtension = imageName.split('.').last;
          final ref = FirebaseStorage.instance.ref(
              "$hotelId/${userId + DateTime.now().toString()}.$imageExtension");
          await ref.putFile(File(_imageList[index]!.path));
          await ref.getDownloadURL().then((value) {
            _imageUrl.add(value);
            notifyListeners();
            FirebaseFirestore.instance
                .collection('Hotel List')
                .doc(hotelId)
                .collection('tasks')
                .doc(idTask)
                .set({
              "positionSender": cUser.data.position,
              "profileImageSender": imageSender,
              "location": location,
              "title": _selectedTitle,
              "sendTo": _selectedDept,
              "assigned": [_selectedDept],
              'setDate': _setDate != null ? _setDate.toString() : "",
              'setTime':
                  currentTime != null ? currentTime!.format(context) : "",
              "description": controller.text,
              "time": DateTime.now().toString(),
              "sender": senderName,
              "comment": [],
              "image": _imageUrl,
              "status": "New",
              "isFading": false,
              "from": senderDept,
              "receiver": "",
              "id": idTask,
              "emailSender": senderEmail,
            });
            FirebaseFirestore.instance
                .collection('Hotel List')
                .doc(hotelId)
                .collection('tasks')
                .doc(idTask)
                .update({
              'comment': FieldValue.arrayUnion([
                {
                  "timeSent": DateTime.now(),
                  'accepted': "",
                  'assignTask': "",
                  'assignTo': "",
                  'commentBody': controller.text,
                  'commentId': const Uuid().v4(),
                  'description':
                      "New request has created for \nLocation: $location \nTitle: $_selectedTitle",
                  'esc': '',
                  'imageComment': _imageUrl,
                  'sender': cUser.data.name,
                  'senderemail': auth.currentUser!.email,
                  'setDate': '',
                  'setTime': '',
                  'time': DateTime.now(),
                  'titleChange': "",
                  'newlocation': "",
                  'hold': "",
                  'resume': "",
                  'scheduleDelete': "",
                }
              ])
            });
            controller.clear();
          });
        });
      } else {
        await FirebaseFirestore.instance
            .collection('Hotel List')
            .doc(hotelId)
            .collection('tasks')
            .doc(idTask)
            .set({
          "positionSender": cUser.data.position,
          "profileImageSender": imageSender,
          "location": location,
          "title": _selectedTitle,
          "sendTo": _selectedDept,
          "assigned": [_selectedDept],
          'setDate': _setDate != null ? _setDate.toString() : "",
          'setTime': currentTime != null ? currentTime!.format(context) : "",
          "description": controller.text,
          "time": DateTime.now().toString(),
          "sender": senderName,
          "comment": [],
          "image": _imageUrl,
          "status": "New",
          "isFading": false,
          "from": senderDept,
          "receiver": "",
          "id": idTask,
          "emailSender": senderEmail,
        });
        await FirebaseFirestore.instance
            .collection('Hotel List')
            .doc(hotelId)
            .collection('tasks')
            .doc(idTask)
            .update({
          'comment': FieldValue.arrayUnion([
            {
              "timeSent": DateTime.now(),
              'accepted': "",
              'assignTask': "",
              'assignTo': "",
              'commentBody': controller.text,
              'commentId': const Uuid().v4(),
              'description':
                  "New request has created for \nLocation: $location \nTitle: $_selectedTitle",
              'esc': '',
              'imageComment': _imageUrl,
              'sender': cUser.data.name,
              'senderemail': auth.currentUser!.email,
              'setDate': '',
              'setTime': '',
              'time': DateTime.now(),
              'titleChange': "",
              'newlocation': "",
              'hold': "",
              'resume': "",
              'scheduleDelete': "",
            }
          ])
        });
        controller.clear();
      }
      addNewRequestTotal(context, 1);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(cUser.data.email)
          .update({'createRequest': newTotal});
      // Notif().sendNotif(
      //   _selectedDept.removeAllWhitespace,
      //   "$_selectedDept New Request",
      //   '$senderName send a request: ${_selectedLocation.text} - "$_selectedTitle" ${controller.text}',
      // );
      _isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(
          backgroundColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.black,
          msg: "Request sent");
      await Future.delayed(const Duration(milliseconds: 600));
      Get.back();
      _searchtitle.clear();
      _imageList.clear();

      notifyListeners();
    }
  }

  String emailAdmin = '';
  TextEditingController nameItem = TextEditingController();
  void lfReport(
      BuildContext context,
      String hotelId,
      String userId,
      TextEditingController controller,
      String senderName,
      String senderEmail,
      String location,
      String description,
      String idLfReport) async {
    // final applcation = AppLocalizations.of(context);
    if (location.isEmpty) {
      Fluttertoast.showToast(
          msg: "Select location",
          backgroundColor: Colors.white,
          textColor: mainColor);
    } else if (nameItem.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please define name of item",
          backgroundColor: Colors.white,
          textColor: mainColor);
    } else if (_imageList.isEmpty) {
      Fluttertoast.showToast(
          msg: "No image founded",
          backgroundColor: Colors.white,
          textColor: mainColor);
    } else {
      try {
        _isLoading = true;
        notifyListeners();
        if (_imageList.isNotEmpty) {
          List.generate(_imageList.length, (index) async {
            String imageExtension = imageName.split('.').last;
            final ref = FirebaseStorage.instance.ref(
                "$hotelId/${userId + DateTime.now().toString()}.$imageExtension");
            await ref.putFile(File(_imageList[index]!.path));
            await ref.getDownloadURL().then((value) async {
              _imageUrl.add(value);
              notifyListeners();
              await FirebaseFirestore.instance
                  .collection('Hotel List')
                  .doc(hotelId)
                  .collection('lost and found')
                  .doc(idLfReport)
                  .set({
                "location": location,
                "nameItem": nameItem.text,
                "sendTo": "Housekeeping",
                "receiver": "",
                "description": controller.text,
                "time": DateTime.now().toString(),
                "founder": senderName,
                "image": _imageUrl,
                "status": "New",
                "positionSender": cUser.data.position,
                "profileImageSender": cUser.data.profileImage,
                "id": idLfReport,
                "emailSender": senderEmail,
                "comment": [],
              });
              await FirebaseFirestore.instance
                  .collection('Hotel List')
                  .doc(hotelId)
                  .collection('lost and found')
                  .doc(idLfReport)
                  .update({
                'comment': FieldValue.arrayUnion([
                  {
                    "timeSent": DateTime.now(),
                    'commentId': const Uuid().v4(),
                    'commentBody': controller.text,
                    'accepted': "",
                    'sender': senderName,
                    'description': "",
                    'senderemail': senderEmail,
                    'imageComment': _imageUrl,
                    'time': DateTime.now().toString(),
                  }
                ])
              });
            });
          });
        }
        // Notif().saveTopic(idLfReport);
        // var result = await FirebaseFirestore.instance
        //     .collection("Hotel List")
        //     .doc(cUser.data.hotelid)
        //     .get();
        // List<dynamic> dataAdmin = result.data()!["admin"];
        // for (var element in dataAdmin) {
        //   List list = element['housekeeping'];
        //   // print(list);
        //   // for (var element in list) {
        //   //   var getToken = await FirebaseFirestore.instance
        //   //       .collection("users")
        //   //       .doc(element)
        //   //       .get();
        //   //   // List listToken = getToken['token'];
        //   //   // for (var element in listToken) {
        //   //   //   // Notif().sendNotifToToken(
        //   //   //   //     element,
        //   //   //   //     "New Report",
        //   //   //   //     '$senderName found: ${nameItem.text} - "${_selectedLocation.text}" ${controller.text}',
        //   //   //   //     '');
        //   //   //   // print(element);
        //   //   // }
        //   // }
        // }
        notifyListeners();

        _isLoading = false;
        Fluttertoast.showToast(
            backgroundColor: Colors.white,
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.black,
            msg: "Request sent");
        await Future.delayed(const Duration(milliseconds: 600));
        Get.back();
        controller.clear();
        _idTask = '';
        _imageList.clear();
        notifyListeners();
      } catch (e) {
        Fluttertoast.showToast(
            backgroundColor: Colors.white,
            toastLength: Toast.LENGTH_SHORT,
            textColor: mainColor,
            msg: "Ups1 Something wrong");
        // print(e);
      }
    }
  }
}
