import 'package:flutter/material.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/create_task_dialog/widget/task_request/widget/pop_up_location.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/create_task_dialog/widget/task_request/widget/pop_up_title.dart';

class CreateController with ChangeNotifier {
  //function for searching title and location on [CREATETASKDIALOG]
  String searchingText = "";
  searchingTitle(String searchWord) {
    searchingText = searchWord;
    notifyListeners();
  }

  bool isSearchingTitleFocus = false;
  bool isSearchingLocationFocus = false;
  searchingFocuse({bool? titleNewBool, bool? locationNewBool}) {
    isSearchingTitleFocus = titleNewBool ?? false;
    isSearchingLocationFocus = locationNewBool ?? false;
    notifyListeners();
    // print("title $isSearchingTitleFocus");
    // print("location $isSearchingLocationFocus");
    notifyListeners();
  }

  bool isPopUpTitle = false;

  OverlayState? overlay;
  OverlayEntry? entry;
  final layerlink = LayerLink();
  showPopUpTitle(BuildContext context, bool newBool) {
    if (!isPopUpTitle) {
      isPopUpTitle = newBool;
      notifyListeners();
      overlay = Overlay.of(context);
      entry = OverlayEntry(
        builder: (context) => Positioned(
          right: 200,
          top: 0,
          child: CompositedTransformFollower(
              offset: const Offset(450, 0),
              link: layerlink,
              showWhenUnlinked: false,
              followerAnchor: Alignment.topRight,
              child: const Center(child: PopUpTitle())),
        ),
      );
      if (overlay != null) {
        overlay?.insert(entry!);
      } else {
        overlay?.rearrange([entry!]);
      }
      notifyListeners();
    }
  }

  bool isPopUpLocation = false;
  showPopUpLocation(BuildContext context, bool newBool) {
    if (!isPopUpLocation) {
      isPopUpLocation = newBool;
      notifyListeners();
      overlay = Overlay.of(context);
      entry = OverlayEntry(
        builder: (context) => Positioned(
          right: 10,
          top: 20,
          child: CompositedTransformFollower(
              offset: const Offset(0, 35),
              link: layerlink,
              showWhenUnlinked: false,
              followerAnchor: Alignment.topLeft,
              child: const Center(child: PopUpLocation())),
        ),
      );
      if (overlay != null) {
        overlay?.insert(entry!);
      } else {
        overlay?.rearrange([entry!]);
      }
      notifyListeners();
    }
  }

  hideePopUp() {
    if (isPopUpTitle) {
      isPopUpTitle = false;
      entry!.remove();
      notifyListeners();
    }
    if (isPopUpLocation) {
      isPopUpLocation = false;
      entry!.remove();
      notifyListeners();
    }
  }
}
