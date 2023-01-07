import 'package:flutter/cupertino.dart';

class HomeSectionController with ChangeNotifier {
  bool _isHomeHover = false;
  bool get isHomeHover => _isHomeHover;
  bool _isFeatureHover = false;
  bool get isFeatureHover => _isFeatureHover;
  bool _isPreviewHover = false;
  bool get isPreviewHover => _isPreviewHover;
  bool _isReportHover = false;
  bool get isReportHover => _isReportHover;
  bool _isRegisterButtonHover = false;
  bool get isRegisterButtonHover => _isRegisterButtonHover;
  bool _isLoginButtonHover = false;
  bool get isLoginButtonHover => _isLoginButtonHover;
  bool _isBenefit = false;
  bool get isBenefit => _isBenefit;

  homeHovering(bool value) {
    _isHomeHover = value;
    notifyListeners();
  }

  featureHovering(bool value) {
    _isFeatureHover = value;
    notifyListeners();
  }

  previewHovering(bool value) {
    _isPreviewHover = value;
    notifyListeners();
  }

  reportHovering(bool value) {
    _isReportHover = value;
    notifyListeners();
  }

  registerButtonHovering(bool value) {
    _isRegisterButtonHover = value;
    notifyListeners();
  }

  loginButtonHovering(bool value) {
    _isLoginButtonHover = value;
    notifyListeners();
  }

  benefitToHotelHovering(bool value) {
    _isBenefit = value;
    notifyListeners();
  }

  void scrollToSection(ScrollController scroll, double toPositon) {
    final position = toPositon;
    scroll.animateTo(position,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastOutSlowIn);
  }
}
