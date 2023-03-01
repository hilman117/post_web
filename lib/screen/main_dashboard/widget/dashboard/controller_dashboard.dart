import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/models/task.dart';

class DashboardController with ChangeNotifier {
  static String departementList = "departement list";
  final cUser = Get.put(CUser());
  final db = FirebaseFirestore.instance;
  List<Color> colorDepartment = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.yellow,
    Colors.lime,
    Colors.amber
  ];

  int _selectedcardRequest = -1;
  int get selectedCardRequest => _selectedcardRequest;

  int _selectedDepartment = -1;
  int get selectedDepartment => _selectedDepartment;

  String _department = "";
  String get department => _department;
  final List<String> _departments = [];
  List<String> get departments => _departments;
  final List<String> _departmentSet = [];
  List<String> get departmentSet => _departmentSet;

  int _statusSelected = -1;
  int get statusSelected => _statusSelected;
  String _filterbyStatus = "";
  String get filterbyStatus => _filterbyStatus;
  List<String> status = ["Accepted", "Close", "Assigned", "Hold"];

  TaskModel? _taskModel = TaskModel();
  TaskModel? get taskModel => _taskModel;

  bool _isChatroomOpen = false;
  bool get isChatroomOpen => _isChatroomOpen;

//hoveirng function
  bool _cardHovering = false;
  bool get cardHovering => _cardHovering;
  int indexHovering = -1;
  bool departementBoxHovering = false;
  int departementHoveringIndex = -1;
  hovering(
      {bool? cardRequestHover,
      int? index,
      bool? isDeptementInHover,
      int? departementIndex}) {
    _cardHovering = cardRequestHover ?? false;
    indexHovering = index ?? -1;
    departementBoxHovering = isDeptementInHover ?? false;
    departementHoveringIndex = departementIndex ?? -1;
    notifyListeners();
  }

//funtion for selecting index in a list
  int hoveringIndex = 0;
  int selectedDepartement = -1;
  selectIndex({int? newIndex, int? hoverIndex}) {
    selectedDepartement = newIndex ?? -1;
    hoveringIndex = hoverIndex ?? -1;
    notifyListeners();
  }

  String selecteddepartement = "";

  selectdepartement(String departement, int selected) {
    selecteddepartement = departement;
    selectedDepartement = selected;
    notifyListeners();
  }

  bool isHover = false;
  hoveringList(bool newBool) {
    isHover = newBool;
    notifyListeners();
  }

  //to change background color when user selecting
  selectingCardRequest(int index) {
    _selectedcardRequest = index;
    notifyListeners();
  }

  //to clear index card request that selected
  clearCardRequest() {
    _selectedcardRequest = -1;
    notifyListeners();
  }

  selectDepartment(int newIndex, String selected) {
    _selectedDepartment = newIndex;
    _department = newIndex < 0 ? "" : selected;
    notifyListeners();
  }

  //to clear filter by departement and by status
  clearFilter() {
    _selectedDepartment = -1;
    _statusSelected = -1;
    _filterbyStatus = "";
    _department = "";
    notifyListeners();
  }

  //function to show floating chatroom
  openChatRoom(bool value, TaskModel data) {
    _isChatroomOpen = value;
    _taskModel = data;
    notifyListeners();
  }

  //function to hide floating chatroom
  hideChatroom() {
    _isChatroomOpen = false;
    notifyListeners();
  }

  // to filter card that showing only by spesific status that user will choose by below function
  selectStatus(int value, String getStatus) {
    _statusSelected = value;
    _filterbyStatus = value < 0 ? "" : getStatus;
    notifyListeners();
  }

  List<String> locations = [
    "1101",
    "1102",
    "1103",
    "1104",
    "1105",
    "1106",
    "1107",
    "1108",
    "1109",
    "1201",
    "1202",
    "1203",
    "1204",
    "1205",
    "1206",
    "1207",
    "1208",
    "1209",
    "Restaurant",
    "Ballroom 1",
    "Ballroom 2",
    "Ballroom 3",
    "Back of house",
    "Main Lobby",
    "Toilet Lobby",
    "Toilet Ballroom",
  ];

  //get departement list from firestore, to display in dashboard page.
  getListOfDepartement(BuildContext context) async {
    //get the list of departments
    var resultDept = await db
        .collection("users")
        .where("hotelid", isEqualTo: cUser.data.hotelid)
        .get();
    Set listDepartement =
        resultDept.docs.map((e) => e.data()['department']).toSet();
    List<String> listDept = List.castFrom(listDepartement.toList());
    for (var element in listDept) {
      if (_departments.contains(element)) {
        _departments.remove(element);
      } else {
        _departments.add(element);
        notifyListeners();
      }
    }
  }
}