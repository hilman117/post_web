import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_web/main.dart';
import 'package:post_web/models/general_data.dart';
import 'package:post_web/models/user.dart';
import 'package:post_web/routes.dart';
import '../../notif.dart';
import '../../shared_prefferences/session_user.dart';
import '../../reusable_widget/show_dialog.dart';

class LoginController with ChangeNotifier {
  bool _isObsecure = true;
  bool get isObsecure => _isObsecure;
  obsecureext() {
    _isObsecure = !_isObsecure;
    notifyListeners();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;

  UserDetails? userDetails;
  GeneralData? generalData;
  bool _isSave = box!.get('isSave') ?? false;
  bool get isSave => _isSave;
  final String _getEmail = box!.get('email') ?? '';
  String get getEmail => _getEmail;
  final String _getPassword = box!.get('password') ?? '';
  String get getPassword => _getPassword;

  isSaveValue(bool value) {
    _isSave = !_isSave;
    box!.putAll({'isSave': _isSave});
    notifyListeners();
  }

  List<String> listToken = [];

  Future signIn(BuildContext context, String email, String password) async {
    if (email.isEmpty || !email.contains("@")) {
      return ShowDialog().alerDialog(context, "Format email not valid");
    }
    if (password.isEmpty) {
      return ShowDialog().alerDialog(context, "Password is empty");
    } else {
      try {
        isLoading = true;
        notifyListeners();
        if (isLoading) {
          ShowDialog().loadingDialog(context);
        }
        notifyListeners();
        if (_isSave) {
          await box!.putAll({'email': email});
          await box!.putAll({'password': password});
        } else {
          box!.delete('email');
          box!.delete('password');
          notifyListeners();
        }
        await auth.signInWithEmailAndPassword(
            email: email.removeAllWhitespace,
            password: password.removeAllWhitespace);
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection("users")
            .doc(auth.currentUser!.email)
            .get();
        if (userDoc.data() != null) {
          userDetails =
              UserDetails.fromJson(userDoc.data() as Map<String, dynamic>);
          SessionsUser.saveUser(userDetails!);
          String token = await Notif().getToken();
          listToken.clear();
          listToken.add(token);
          await FirebaseFirestore.instance
              .collection("users")
              .doc(auth.currentUser!.email)
              .update({"token": FieldValue.arrayUnion(listToken)});
          //funtion to get general setting administrator

          isLoading = false;
          notifyListeners();
          Navigator.pushReplacementNamed(context, Routes.mainDashBoard);
        }
      } on FirebaseAuthException catch (e) {
        // print(e);
        if (e.code == 'user-not-found') {
          ShowDialog().alerDialog(context, "No user found for");
          isLoading = false;
          notifyListeners();
        } else if (e.code == 'wrong-password') {
          ShowDialog().alerDialog(context, "Please provide valid password");
          isLoading = false;
          notifyListeners();
        }
      }
    }
  }
}
