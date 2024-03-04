// ignore_for_file: avoid_print

import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_web/firebase/firebase_location.dart';
import 'package:post_web/firebase/firebase_profile.dart';
import 'package:post_web/firebase/firebase_title.dart';
import 'package:post_web/models/general_data.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/models/title_model.dart';
import 'package:post_web/models/user.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/report/report.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';

import 'package:post_web/screen/main_dashboard/widget/setting/setting.dart';
import 'package:provider/provider.dart';

import '../../const.dart';
import '../../models/departement.dart';

class MainDashboardController with ChangeNotifier {
  int _menuSelected = 0;
  int get menuSelected => _menuSelected;
  int menuHovering = -1;
  String menu = "Dashboard";

  Widget pagesSelected(BuildContext context, List<TaskModel> tasksList,
      List<Departement> listDep) {
    final setting = Provider.of<SettingsController>(context, listen: false);
    if (menu == "Admin") {
      setting.changeDeptForLfStorage(data!.deptToStoreLF!);
      return const SettingView();
    } else if (menu == "Report") {
      return Report(listDept: listDep);
    } else {
      return Dashboard(tasksList: tasksList);
    }
    // return const SettingView();
  }

  // List<Widget> pages = [const Dashboard(), const Report(), const SettingView()];
  List<String> menuDashboard = [
    "Dashboard",
    "Admin",
    "Lost and Found",
    "Report",
  ];

  List<IconData> iconMenu = [
    Icons.dashboard_outlined,
    Icons.admin_panel_settings_outlined,
    Icons.location_disabled,
    Icons.analytics_outlined,
  ];

  Widget menuWidget(BuildContext context, int index) {
    final theme = Theme.of(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: (menuHovering == index || menuSelected == index)
                      ? mainColor
                      : Colors.transparent))),
      child: Row(
        children: [
          Icon(
            iconMenu[index],
            color: (menuHovering == index || menuSelected == index)
                ? mainColor
                : theme.canvasColor,
            size: 25.sp,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            menuDashboard[index],
            style: TextStyle(
                fontSize: 20.sp,
                color: (menuHovering == index || menuSelected == index)
                    ? mainColor
                    : theme.canvasColor,
                fontWeight: menuSelected == index
                    ? FontWeight.bold
                    : FontWeight.normal),
          ),
        ],
      ),
    );
  }

  bool _isProfileViewOpen = false;
  bool get isProfileViewOpen => _isProfileViewOpen;

  hoveringMenu(int index) {
    menuHovering = index;
    notifyListeners();
  }

  selectMenu(int value, String selectedMenu) {
    _menuSelected = value;
    menu = selectedMenu;
    if (value == 3) {}
    // Get.back();
    notifyListeners();
  }

  openProfileView() {
    _isProfileViewOpen = !_isProfileViewOpen;
    notifyListeners();
  }

  //change theme mode
  bool isDarkMode = false;
  changeThemeMode() {
    isDarkMode = !isDarkMode;
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
  List<TitlesModel> titles = [];
  generalData() {
    var db = FirebaseLocation().getHotelData();
    db.then((value) async {
      data = GeneralData.fromJson(value.data()!);
      List listTitle = value.data()!["titles"];
      titles = listTitle.map((e) => TitlesModel.fromJson(e)).toList();
      print(titles);
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

//store data profile to database after hit save button
//this method is called on [PROFILEVIEWWIDGET]
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
      print(e);
    }
  }
  //----------------------------------------------------------------

  //CRUD employee data
}
