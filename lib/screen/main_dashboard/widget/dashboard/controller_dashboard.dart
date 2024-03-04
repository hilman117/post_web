import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/firebase/firebase_get_task_data.dart';
import 'package:post_web/main.dart';
import 'package:post_web/models/departement.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/row_title/widget/pop_up_profile_sender.dart';

class DashboardController with ChangeNotifier {
  static String departementList = "departement list";
  final cUser = Get.put(CUser());
  final db = FirebaseFirestore.instance;

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

  int _statusSelected = 0;
  int get statusSelected => _statusSelected;
  String _filterbyStatus = "Open";
  String get filterbyStatus => _filterbyStatus;
  List<String> status = ["Open", "Close", "Assigned", "Hold"];

  TaskModel? _taskModel = TaskModel();
  TaskModel? get taskModel => _taskModel;

  bool _isChatroomOpen = false;
  bool get isChatroomOpen => _isChatroomOpen;

  List<TaskModel> historyTask = [];
  bool loadCloseTasks = false;
  Future<List<TaskModel>> getHistoryTask() async {
    await FirebaseGetTaskData()
        .getHistoryTask()
        .then((value) => historyTask = value);
    // ignore: use_build_context_synchronously
    notifyListeners();
    return historyTask;
  }

//hoveirng function
  int indexHovering = -1;

  int departementHoveringIndex = -1;
  hovering({int? index, int? departementIndex}) {
    indexHovering = index ?? -1;

    departementHoveringIndex = departementIndex ?? -1;
    notifyListeners();
  }

//funtion for selecting index in a list
  int hoveringIndex = -1;
  int selectedDepartement = -1;
  selectIndex({int? newIndex, int? hoverIndex}) {
    selectedDepartement = newIndex ?? -1;
    hoveringIndex = hoverIndex ?? -1;
    notifyListeners();
  }

  String selecteddepartement = "";
  Departement? deptSelected;
  selectdepartement(Departement departement, int selected) {
    selecteddepartement = departement.departement!;
    deptSelected = departement;
    selectedDepartement = selected;
    Get.back(canPop: true);
    notifyListeners();
  }

  void clearSelectedDept() {
    selecteddepartement = "";
    deptSelected = null;
    notifyListeners();
  }

  bool isSchedule = false;
  filterWithSchedule(bool newBool) {
    isSchedule = newBool;
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
  clearDepartementFilter() {
    _selectedDepartment = -1;
    _department = "";
    notifyListeners();
  }

  clearStatusFilter() {
    _statusSelected = 0;
    _filterbyStatus = "Open";
    notifyListeners();
  }

  //function to show floating chatroom, value bool if true the floating chat room will display, stack on other widget
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
  selectStatus(BuildContext context, int value, String getStatus) {
    _statusSelected = value;
    _filterbyStatus = getStatus;
    if (_statusSelected == 1) {
      getHistoryTask();
    }
    notifyListeners();
  }

  //method for selecting date range on filter
  DateTimeRange dateTimeRange =
      DateTimeRange(start: DateTime(2021), end: DateTime.now());

  DateTimeRange? pickedDateForFiltering;

  Future pickRangeDateFilter(BuildContext context) async {
    var results = await showCalendarDatePicker2Dialog(
      barrierColor: Colors.transparent,
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
          calendarType: CalendarDatePicker2Type.range),
      dialogSize: const Size(325, 400),
      // initialValue: [dateTimeRange.start],
      borderRadius: BorderRadius.circular(15),
    );

    if (results == null) return;
    pickedDateForFiltering = dateTimeRange;
    notifyListeners();
  }

  //[Pop up profile sender]
  //scaletransitioin animation
  //this method is called in pop up profile sender profile

  OverlayState? overlay;
  OverlayEntry? entry;
  showProfileSender({required BuildContext context, TaskModel? taskModel}) {
    if (entry == null) {
      overlay = Overlay.of(context);
      entry = OverlayEntry(
        builder: (context) => Positioned(
            top: 300.h,
            left: 400.w,
            child: PopUpProfileSender(
              taskModel: taskModel!,
            )),
      );
      overlay?.insert(entry!);
      notifyListeners();
    }
  }

//to hide overlay of profile sender
// called in profile sender pop up at [X] button
  hideProfileSender() {
    if (entry != null) {
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          entry!.remove();
          entry = null;
          // isProfileShow = false;
          notifyListeners();
        },
      );
    }
  }
}
