import 'package:flutter/material.dart';
import 'package:post_web/firebase/firebase_location.dart';
import 'package:post_web/firebase/firebase_title.dart';
import 'package:post_web/reusable_widget/show_dialog.dart';
import 'package:post_web/const.dart';
import '../../../../firebase/firebase_departement.dart';

class SettingsController with ChangeNotifier {
  //Note: meaning of the line
  //new method that start
  //-------------------------------------------the last line of the method

  //employee account settings

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

  List<String> accountType = [
    administrator,
    deptAdmin,
    noAdmin,
  ];

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
  //---------------------------------------------------------------

  // [Departement Settings]
  bool isExpand = false;
  expandTheWidget() {
    isExpand = !isExpand;
    notifyListeners();
  }

  String iconSelected = "";
  selectIcon(String icon) {
    iconSelected = icon;
    notifyListeners();
  }

  //function for store new department to firebase
  bool isNewDepartementLoading = false;
  registeNewDepartement(
      BuildContext context, TextEditingController newDepartement) async {
    if (newDepartement.text == "") {
      return ShowDialog().alerDialog(context, "Group name is empty");
    } else if (iconSelected == "") {
      return ShowDialog().alerDialog(context, "No icon selected");
    } else {
      final db = FirebaseDepartement();
      isNewDepartementLoading = true;
      notifyListeners();
      await db.registerNewDepartement(context, newDepartement, iconSelected);
      isExpand = false;
      newDepartement.clear();
      iconSelected = "";
      isNewDepartementLoading = false;
      notifyListeners();
      notifyListeners();
    }
  }

  removeDepartement(BuildContext context, String dept) {
    final db = FirebaseDepartement();
    db.removeDepartement(context, dept);
  }

  //function for switch button on departement list
  bool isActive = false;
  activateSwith(BuildContext context, String dept, bool newBool) {
    final db = FirebaseDepartement();
    db.updateDepartement(context, dept, newBool);
  }

  ///////////////////////////////////////////////////////[Title Settings]

  //function search title
  String searchTitle = "";
  searchingTitle(String text) {
    searchTitle = text;
    notifyListeners();
  }

//add new title
  bool isLoadingLoadTitle = false;
  bool succedTitleAdded = false;
  bool succedTitleRemoved = false;
  addNewTitle(BuildContext context, String toDepartement,
      TextEditingController newTitle) async {
    var db = FirebaseTitle();
    try {
      if (toDepartement == "") {
        return ShowDialog().alerDialog(context, "Select departement");
      } else if (newTitle.text == "") {
        return ShowDialog().alerDialog(context, "Please input new title");
      } else {
        isLoadingLoadTitle = true;
        notifyListeners();
        await db.addNewTitle(toDepartement, newTitle.text);
        newTitle.clear();
        isLoadingLoadTitle = false;
        succedTitleAdded = true;
        notifyListeners();
        Future.delayed(
          const Duration(seconds: 2),
          () {
            succedTitleAdded = false;
            notifyListeners();
          },
        );
      }
    } catch (e) {
      ShowDialog().errorDialog(context, "Upps, Someting wrong");
    }
  }

//remove title
  bool loadingToRemove = false;
  removeTitle(
      {required BuildContext context,
      required String toDepartement,
      required List currentList,
      required int indexToRemove}) async {
    var db = FirebaseTitle();
    try {
      loadingToRemove = true;
      notifyListeners();
      await db.removeTitle(toDepartement, currentList, indexToRemove);
      loadingToRemove = false;
      succedTitleRemoved = true;
      notifyListeners();
      Future.delayed(
        const Duration(seconds: 2),
        () {
          succedTitleRemoved = false;
          notifyListeners();
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
      ShowDialog().errorDialog(context, "Upps, Someting wrong");
    }
  }

  //-----------------------------------------------------------------------

  ///////////////////////////////////////////////////////[Location Setting]

  //function search location
  String searchLocation = "";
  searchingLocation(String text) {
    searchLocation = text;
    notifyListeners();
  }

  //add new location
  bool isLoadingLoadLocation = false;
  addNewLocation(
      BuildContext context, TextEditingController newLocation) async {
    var db = FirebaseLocation();
    try {
      if (newLocation.text == "") {
        return ShowDialog().alerDialog(context, "Please input new location");
      } else {
        isLoadingLoadLocation = true;
        notifyListeners();
        await db.addNewLocation(newLocation.text);
        newLocation.clear();
        isLoadingLoadLocation = false;
        notifyListeners();
      }
    } catch (e) {
      ShowDialog().errorDialog(context, "Upps, Someting wrong");
    }
  }

  bool loadingLocation = false;
  removeLocation(
      {required BuildContext context,
      required List currentList,
      required int indexToRemove}) async {
    var db = FirebaseLocation();
    try {
      loadingLocation = true;
      notifyListeners();
      await db.removeLocation(currentList, indexToRemove);
      loadingLocation = false;
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
      ShowDialog().errorDialog(context, "Upps, Someting wrong");
    }
  }
  //-----------------------------------------------------------------------
}
