import 'package:flutter/material.dart';

import 'package:post_web/screen/main_dashboard/widget/dashboard/dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/lf_report/lf_report.dart';
import 'package:post_web/screen/main_dashboard/widget/report/report.dart';

import 'package:post_web/screen/main_dashboard/widget/setting/setting.dart';

class MainDashboardController with ChangeNotifier {
  int _menuSelected = 0;
  int get menuSelected => _menuSelected;
  int menuHovering = -1;

  List<Widget> pages = [
    const Dashboard(),
    const Report(),
    const LFReport(),
    const SettingView()
  ];
  List<String> menuDashboard = ["Dashboard", "Report", "Lost & Found", "Admin"];
  List<IconData> iconMenu = [
    Icons.dashboard_outlined,
    Icons.analytics_outlined,
    Icons.fmd_good_sharp,
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
}
