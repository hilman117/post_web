import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_web/firebase/firebase_location.dart';
import 'package:post_web/firebase/firebase_profile.dart';
import 'package:post_web/firebase/firebase_title.dart';
import 'package:post_web/models/general_data.dart';
import 'package:post_web/models/user.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/report/report.dart';

import 'package:post_web/screen/main_dashboard/widget/setting/setting.dart';

import '../../models/departement.dart';

class MainDashboardController with ChangeNotifier {
  int _menuSelected = 0;
  int get menuSelected => _menuSelected;
  int menuHovering = -1;

  List<Widget> pages = [const Dashboard(), const Report(), const SettingView()];
  List<String> menuDashboard = ["Dashboard", "Report", "Admin"];
  List<IconData> iconMenu = [
    Icons.dashboard_outlined,
    Icons.analytics_outlined,
    Icons.admin_panel_settings_outlined
  ];
  bool _isProfileViewOpen = false;
  bool get isProfileViewOpen => _isProfileViewOpen;

  hoveringMenu(int index) {
    menuHovering = index;
    notifyListeners();
  }

  selectMenu(int value) {
    _menuSelected = value;
    if (value == 3) {}
    // Get.back();
    notifyListeners();
  }

  openProfileView() {
    _isProfileViewOpen = !_isProfileViewOpen;
    notifyListeners();
  }

//CRUD  Profile data
  UserDetails? userDetails;
  getProfileData() {
    var db = FirebaseProfile().getProfileData();
    db.then((value) {
      userDetails = UserDetails.fromJson(value.data()!);
      notifyListeners();
    });
  }

  GeneralData? data;
  generalData() {
    var db = FirebaseLocation().getLocation();
    db.then((value) {
      data = GeneralData.fromJson(value.data()!);
      notifyListeners();
    });
  }

  Departement? deptDetail;
  getDepartementDetail(String dept) {
    var db = FirebaseTitle().getTitle(dept);
    db.then((value) {
      deptDetail = Departement.fromJson(value.data()!);
      notifyListeners();
    });
  }

  String imageName = '';
  final ImagePicker _picker = ImagePicker();
  Uint8List? imageToUpload;
  XFile? selectedImages;
  String imageUrl = "";
  Future<void> selectImage() async {
    selectedImages =
        await _picker.pickImage(imageQuality: 30, source: ImageSource.gallery);
    notifyListeners();
    if (selectedImages != null) {
      imageToUpload = await XFile(selectedImages!.path).readAsBytes();
      notifyListeners();
    }
  }

  uploadImage() async {
    if (imageToUpload != null) {
      String imageExtension = imageName.split('.').last;
      final ref = FirebaseStorage.instance.ref(
          "${userDetails!.hotel}/${userDetails!.uid} + ${DateTime.now().toString()}.$imageExtension");
      await ref.putString(imageToUpload.toString());
      await ref.getDownloadURL().then((value) {
        imageUrl = value;
        //print(imageUrl);
        notifyListeners();
      });
    }
  }

  updateSettingProfile({
    bool? notifReceived,
    bool? notifClose,
    bool? onDuty,
    bool? sendChatNotif,
  }) async {
    var db = FirebaseProfile();
    try {
      await db.updateSettingProfile(
          notifReceived ?? userDetails!.receiveNotifWhenAccepted!,
          notifClose ?? userDetails!.receiveNotifWhenClose!,
          onDuty ?? userDetails!.isOnDuty!,
          sendChatNotif ?? userDetails!.sendChatNotif!,
          imageUrl == "" ? userDetails!.profileImage! : imageUrl);
      getProfileData();
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
  //----------------------------------------------------------------

  //CRUD employee data
}
