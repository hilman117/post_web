import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_web/common_widget/show_dialog.dart';
import 'package:post_web/firebase/post/register_departement.dart';
import 'package:post_web/other.dart';

import 'package:post_web/screen/main_dashboard/widget/setting/widget/employee_account/employee_account.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/task_settings/task_settings.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/your_account/account_setting.dart';

import '../../../../controller/c_user.dart';
import 'widget/departments_setting/departments_setting.dart';

class SettingsController with ChangeNotifier {
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passworController = TextEditingController();
  final positionTextController = TextEditingController();
  String selectedPosition = "";
  listenTyping(String value) {
    selectedPosition = value;
    notifyListeners();
  }

  selectPosition(String position) {
    selectedPosition = position;
    isPosition = false;
    notifyListeners();
  }

  String selectedAccountType = "";

  selectAccountType(String accountType) {
    selectedAccountType = accountType;
    isAccountTypeFocus = false;
    notifyListeners();
  }

  String selecteddepartement = "";

  selectdepartement(String departement) {
    selecteddepartement = departement;
    isDepartement = false;
    notifyListeners();
  }

  clear() {
    selectedPosition = "";
    selectedAccountType = "";
    selecteddepartement = "";
    notifyListeners();
  }

  //funtion for selecting index in a list
  int hoveringIndex = 0;
  int index = 0;
  selectIndex({int? newIndex, int? hoverIndex}) {
    index = newIndex ?? 0;
    hoveringIndex = hoverIndex ?? 0;

    notifyListeners();
  }

  List<String> role = [
    "General Manager",
    "Assistant Executive Manager",
    "Hotel Manager",
    "Front Office Manager",
    "Director of Sales and Marketing",
    "Revenue Manager",
    "Guest Services Manager",
    "Executive Housekeeper",
    "Housekeeping Manager",
    "Food and Beverage Director",
    "Executive Chef",
    "Sous Chef",
    "Banquet Manager",
    "Bar Manager",
    "Restaurant Manager",
    "Spa Manager",
    "Guest Relations Manager",
    "Bellman",
    "Concierge",
    "Front Desk Agent",
    "Reservations Agent",
    "Night Auditor",
    "Housekeeping Attendant",
    "Laundry Attendant",
    "Room Service Attendant",
    "Bartender",
    "Waiter/Waitress",
    "Barista",
    "Chef de Partie",
    "Commis Chef",
    "Kitchen Steward",
    "Massage Therapist",
    "Fitness Trainer"
  ];
  List<String> accountType = [
    administrator,
    deptAdmin,
    noAdmin,
  ];
  List<String> departments = [
    "Housekeeping",
    "Front Office",
    "Engineering",
    "Butler",
    "Room Service",
    "Concierge",
    "IT Support"
  ];
  List<String> menuSettings = [
    "Profile",
    "Team account",
    "Department",
    "Task Settings"
  ];

  int menuSettingSelected = 0;
  List<Widget> settingMenuWidget = [
    const YourAccount(),
    const EmployeeAccount(),
    const DepartmentSettings(),
    const TaskSettings()
  ];

  void selectSettingMenu(int index) {
    menuSettingSelected = index;
    notifyListeners();
  }

  final user = Get.put(CUser());
  final db = FirebaseFirestore.instance;
  getEmployeelist() async {
    await db
        .collection("users")
        .where("hotel", isEqualTo: user.data.hotel)
        .get();
    // employees.map((e) {
    //   return employee = UserDetails.fromJson(e);
    // });
    // if (employees.isEmpty) {
    //   return ShowDialog().loadingDialog(context);
    // }
  }

  bool isPosition = false;
  bool isAccountTypeFocus = false;
  bool isDepartement = false;
  focus({bool? positionFocuse, bool? accounTypeFocus, bool? departementFocus}) {
    isPosition = positionFocuse ?? false;
    isAccountTypeFocus = accounTypeFocus ?? false;
    isDepartement = departementFocus ?? false;

    notifyListeners();
  }

  bool isHover = false;
  hovering(bool newBool) {
    isHover = newBool;
    notifyListeners();
  }

  //function for expand widget on departement section
  bool isExpand = false;
  expandTheWidget() {
    isExpand = !isExpand;
    notifyListeners();
  }

  List<String> departementIcon = [
    "image/Engineering.png",
    "image/Entertainment.png",
    "image/Front Office.png",
    "image/IT Support.png",
    "image/Room Service.png",
    "image/Housekeeping.png",
    "image/Butler.png",
    "image/Concierge.png",
    "image/entertain-2.png",
    "image/guard.png",
    "image/hr-manager.png",
    "image/laundry.png",
    "image/hotel-bell.png"
  ];

  String iconSelected = "";
  selectIcon(String icon) {
    iconSelected = icon;
    notifyListeners();
  }

  //function for store new department to firebase
  registeNewDepartement(
      BuildContext context, TextEditingController newDepartement) async {
    if (newDepartement.text == "") {
      return ShowDialog().alerDialog(context, "Group name is empty");
    } else if (iconSelected == "") {
      return ShowDialog().alerDialog(context, "No icon selected");
    } else {
      final db = RegisterNewDepartement();
      await db.registerNewDepartement(context, newDepartement, iconSelected);
      isExpand = false;
      newDepartement.clear();
      iconSelected = "";
      notifyListeners();
    }
  }

  removeDepartement(BuildContext context, String dept) {
    final db = RegisterNewDepartement();

    db.removeDepartement(context, dept);
  }

  //function for switch button on departement list
  bool isActive = false;
  activateSwith(BuildContext context, String dept, bool newBool) {
    final db = RegisterNewDepartement();
    db.updateDepartement(context, dept, newBool);
  }
}
