// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/firebase/firebase_account.dart';
import 'package:post_web/firebase/firebase_location.dart';
import 'package:post_web/firebase/firebase_title.dart';
import 'package:post_web/models/departement.dart';
import 'package:post_web/models/user.dart';
import 'package:post_web/reusable_widget/show_dialog.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/dialog_change_hotel_image.dart';
import 'package:provider/provider.dart';
import '../../../../firebase/firebase_departement.dart';

class SettingsController with ChangeNotifier {
  //Note: meaning of the line
  //new method that start
  //-------------------------------------------the last line of the method

  //employee account settings

  final user = Get.put(CUser());
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
    } else if (iconName == "") {
      return ShowDialog().alerDialog(context, "No icon selected");
    } else {
      try {
        final db = FirebaseDepartement();
        isNewDepartementLoading = true;
        notifyListeners();
        await db.registerNewDepartement(context, newDepartement, iconName);
        newDepartement.clear();
        iconName = "";
        isNewDepartementLoading = false;
        Navigator.of(context).pop();
        notifyListeners();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  removeDepartement(BuildContext context, String dept) {
    final db = FirebaseDepartement();
    db.removeDepartement(context, dept);
  }

  //function for switch button on departement list
  bool isActive = false;
  activateSwitch(BuildContext context, bool newBool) {
    final db = FirebaseDepartement();
    db.updateDepartement(context, selectedDept!.departement!, newBool);
    isActive = newBool;
    notifyListeners();
  }

  ///////////////////////////////////////////////////////[Title Settings]

  //function search title
  String searchTitle = "";
  searchingTitle(String text) {
    searchTitle = text;
    notifyListeners();
  }

  //function search user
  String searchUser = "";
  searchingUser(String text) {
    searchUser = text;
    notifyListeners();
  }

//add new title
  bool isLoadingLoadTitle = false;
  bool succedTitleAdded = false;
  bool succedTitleRemoved = false;
  bool isCreateTitle = false;
  void openCreateTitle() {
    isCreateTitle = !isCreateTitle;
    notifyListeners();
  }

  addNewTitle(BuildContext context, TextEditingController newTitle) async {
    var db = FirebaseTitle();
    try {
      if (newTitle.text.isEmpty) {
        return ShowDialog().alerDialog(context, "Please input new title");
      } else {
        isLoadingLoadTitle = true;
        notifyListeners();
        await db.addNewTitle(selectedDept!.departement!, newTitle.text);
        newTitle.clear();
        isLoadingLoadTitle = false;
        notifyListeners();

        Navigator.of(context).pop();
      }
    } catch (e) {
      ShowDialog().errorDialog(context, "Upps, Someting wrong");
    }
    notifyListeners();
  }

//remove title
  bool loadingToRemove = false;
  removeTitle(
      {required BuildContext context,
      required List currentList,
      required int indexToRemove}) async {
    var db = FirebaseTitle();
    try {
      loadingToRemove = true;
      await db.removeTitle(
          selectedDept!.departement!, currentList, indexToRemove);
      loadingToRemove = false;
      Navigator.of(context).pop();
      notifyListeners();
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
        Navigator.of(context).pop();
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
      Navigator.of(context).pop();
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
      ShowDialog().errorDialog(context, "Upps, Someting wrong");
    }
  }
  //-----------------------------------------------------------------------

  //delete account-----------------------------------------------------------------------

  Future deleteAccount(BuildContext context, UserDetails user) async {
    var db = FirebaseAccount();
    await db.deleteAccount(context, user.email!);
  }

  bool isPanelExpand = false;
  Departement? selectedDept;
  void expandPanel(Departement selectedDepartment) {
    isPanelExpand = !isPanelExpand;
    selectedDept = selectedDepartment;
    isActive = selectedDepartment.isActive!;
    notifyListeners();
  }

  //SAVING LF STORAGE DEPT
  String deptForLf = "Housekeeping";
  void changeDeptForLfStorage(String deptSelected) {
    deptForLf = deptSelected;
    isSaved = false;
    // notifyListeners();
  }

  bool isSaved = false;
  Future saveDeptForLf(BuildContext context) async {
    var db = FirebaseFirestore.instance;
    final getData =
        Provider.of<MainDashboardController>(context, listen: false);
    await db
        .collection(hotelListCollection)
        .doc(user.data.hotel)
        .update({"deptToStoreLF": deptForLf}).whenComplete(() {
      isSaved = true;
      getData.generalData();
    });
    notifyListeners();
  }

  bool insEnterImageBox = false;
  void enteringImageBox(bool value) {
    insEnterImageBox = value;
    notifyListeners();
  }

  bool isChangeOtherImage = false;
  void changeOtherImage(bool value) {
    isChangeOtherImage = value;
    notifyListeners();
  }

  //[PICK IMAGE]
  String imageName = '';
  final ImagePicker _picker = ImagePicker();
  Uint8List? image;
  List<String> imageUrl = [];
  XFile? selectedImages;
  Future<void> selectHotelImage(BuildContext context) async {
    selectedImages =
        await _picker.pickImage(imageQuality: 30, source: ImageSource.gallery);
    if (selectedImages != null) {
      image = await XFile(selectedImages!.path).readAsBytes();
      changeHotelImage(context);
    }
    notifyListeners();
  }

  Future<void> changeImage(BuildContext context) async {
    selectedImages =
        await _picker.pickImage(imageQuality: 30, source: ImageSource.gallery);
    if (selectedImages != null) {
      image = await XFile(selectedImages!.path).readAsBytes();
    }
    notifyListeners();
  }

  bool isImageUploading = false;
  Future<void> uploadHotelImage(BuildContext context) async {
    final refreshData =
        Provider.of<MainDashboardController>(context, listen: false);
    try {
      if (selectedImages != null) {
        isImageUploading = true;
        notifyListeners();
        String imageExtension = imageName.split('.').last;

        // Get image data as bytes
        Uint8List imageData = await selectedImages!.readAsBytes();

        var ref = FirebaseStorage.instance.ref(
            "${user.data.hotelid}/${user.data.uid} + ${DateTime.now().toString()}.$imageExtension");

        // Specify content type as image/jpeg
        var metadata =
            firebase_storage.SettableMetadata(contentType: 'image/jpeg');

        // Upload image data using putData with specified metadata
        await ref.putData(imageData, metadata);

        // Get the download URL after upload completion
        String downloadUrl = await ref.getDownloadURL();

        // Update Firestore with the download URL
        await FirebaseFirestore.instance
            .collection(hotelListCollection)
            .doc(user.data.hotel)
            .update({"hotelImage": downloadUrl}).whenComplete(
                () => refreshData.generalData());

        isImageUploading = false;
        Navigator.of(context).pop();
        notifyListeners();
      } else {
        debugPrint(
            "No image selected."); // Handle case when selectedImages is null
      }
    } catch (e) {
      debugPrint("Error uploading image: $e");
      // Handle error gracefully, notify the user, or retry the operation if appropriate
    }
    notifyListeners();
  }

  String iconName = "";
  void selectDeptIcon(String icon) {
    iconName = icon;
    notifyListeners();
  }
}
