// ignore_for_file: use_build_context_synchronously

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
  bool loadingSignInProgress = false;

  isSaveValue() {
    _isSave = !_isSave;
    box!.putAll({'isSave': _isSave});
    notifyListeners();
  }

  Future signIn(BuildContext context, String email, String password) async {
    if (email.isEmpty || !email.contains("@")) {
      return ShowDialog().alerDialog(context, "Format email not valid");
    }
    if (password.isEmpty) {
      return ShowDialog().alerDialog(context, "Password is empty");
    } else {
      try {
        loadingSignInProgress = true;
        notifyListeners();
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
          //this logic is to set that only admin can access the admin panel
          if (userDetails!.accountType == "Non-admin") {
            auth.signOut();
            loadingSignInProgress = false;
            notifyListeners();
            ShowDialog()
                .alerDialog(context, "Only admin that allowed to login");
          } else {
            Notif().subscribeTopic(
                userDetails!.department!.toLowerCase().removeAllWhitespace);
            // event.dashboard(userDetails!.department!);

            Navigator.pushReplacementNamed(context, Routes.mainDashBoard);
            loadingSignInProgress = false;
            notifyListeners();
          }
        }
      } on FirebaseAuthException catch (e) {
        // print(e);
        if (e.code == 'user-not-found') {
          loadingSignInProgress = false;
          notifyListeners();
          Navigator.pop(context);
          ShowDialog().alerDialog(context, "No user found for $email");
        } else if (e.code == 'wrong-password') {
          loadingSignInProgress = false;
          notifyListeners();
          Navigator.pop(context);
          ShowDialog().alerDialog(context, "Please provide valid password");
        }
      }
    }
    notifyListeners();
  }
}
