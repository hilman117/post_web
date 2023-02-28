import 'package:flutter/material.dart';

import 'widget/filter/widget/floating_menu/floating_menu.dart';

class ReportController with ChangeNotifier {
  int _departmentIndexReport = -1;
  int get departmentIndexReport => _departmentIndexReport;
  List<String> department = [
    "Housekeeping",
    "Front Office",
    "Engineering",
    "Butler",
    "Room Service",
    "Bell Service",
    "IT Support"
  ];

  departmenReportSelected(int selectedDepartment) {
    _departmentIndexReport = selectedDepartment;
    // ignore: avoid_print
    print(_departmentIndexReport);
    notifyListeners();
  }

  List<String> percent = ["99", "100", "88", "97", "95", "90", "100"];
  List<String> totalOfRequest = [
    "33.009",
    "21.836",
    "22.324",
    "39.749",
    "2.090",
    "32.127",
    "1.292"
  ];

  bool _isOverlayShow = false;
  bool get isOverlayShow => _isOverlayShow;
  OverlayState? overlay;
  OverlayEntry? entry;
  final layerlink = LayerLink();
  showFitlerOvrelay(BuildContext context, bool newBool) {
    if (!_isOverlayShow) {
      _isOverlayShow = newBool;
      final size = MediaQuery.of(context).size;
      overlay = Overlay.of(context);
      entry = OverlayEntry(
        builder: (context) => Positioned(
            right: size.width * 0.2,
            top: size.height * 0.4,
            child: CompositedTransformFollower(
                link: layerlink,
                offset: Offset(size.width * 0.04, size.height * 0.05),
                showWhenUnlinked: false,
                followerAnchor: Alignment.topCenter,
                child: const Center(child: FloatingMenuWidget()))),
      );
      overlay?.insert(entry!);
      notifyListeners();
    }
  }

  hideFlotingFilter() {
    if (_isOverlayShow) {
      _isOverlayShow = false;
      entry!.remove();
      notifyListeners();
    }
  }

  List<String> status = ["Accepted", "Close", "Assigned", "Hold", "Pause"];

  bool _isClick = false;
  bool get isClick => _isClick;
  clickButton() {
    _isClick = true;
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        _isClick = false;
        notifyListeners();
      },
    );
    notifyListeners();
  }
}
