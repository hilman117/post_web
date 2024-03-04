// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:acronym/acronym.dart';
import 'package:post_web/extension/string_extention.dart';
import 'package:post_web/const.dart';
import '../reusable_widget/show_dialog.dart';
import '../style.dart';

class FirebaseAccount with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final user = Get.put(CUser());

  bool isLoading = false;
  bool success = false;
  statusSucces(bool val) {
    success = val;
    notifyListeners();
  }

  String deptCode = "";
  getDeptCode(String dept) {
    var words = dept.split(" ");
    if (words.length < 2 && dept == "Housekeeping") {
      deptCode = dept.toAcronym(splitSyllables: true);
      notifyListeners();
    } else if (words.length > 1) {
      deptCode = dept.toAcronym(stopWords: []);
      notifyListeners();
    } else {
      deptCode = dept.substring(0, 3);
      notifyListeners();
    }
    notifyListeners();
  }

  createNewAccount(
      {BuildContext? context,
      required TextEditingController email,
      required TextEditingController password,
      required TextEditingController firstName,
      required String userPosition,
      required String userDepartement,
      required String accountType,
      required String domain}) async {
    var color = userColor..shuffle();
    int index = Random().nextInt(userColor.length);
    // print(email.text);
    // print(password.text);
    // print(firstName.text);
    // print(userPosition);
    // print(userDepartement);
    // print(accountType);
    // print(domain);
    if (email.text == "") {
      return ShowDialog().alerDialog(context!, "Please to complete the email");
    }
    if (password.text == "") {
      return ShowDialog()
          .alerDialog(context!, "Please to complete the password");
    }
    if (userPosition == "") {
      return ShowDialog()
          .alerDialog(context!, "Please to complete the user position");
    }
    if (accountType == "") {
      return ShowDialog()
          .alerDialog(context!, "Please spesify an account type");
    }
    if (userDepartement == "") {
      return ShowDialog()
          .alerDialog(context!, "Please to complete the user departement");
    } else {
      try {
        isLoading = true;
        notifyListeners();
        await getDeptCode(userDepartement);
        await auth.createUserWithEmailAndPassword(
            email: email.text + domain.capitalizeFirst!,
            password: password.text);
        db
            .collection(userCollection)
            .doc(email.text.toLowerCase() + domain)
            .set({
          "name": "(${deptCode.toUpperCase()}) ${firstName.text.toTitleCase()}",
          "position": userPosition,
          "hotelid": user.data.hotel,
          "department": userDepartement,
          "hotel": user.data.hotel,
          "location": "",
          "email": email.text.toLowerCase() + domain,
          "uid": auth.currentUser!.email,
          "acceptRequest": 0,
          "closeRequest": 0,
          "createRequest": 0,
          'ReceiveNotifWhenAccepted': true,
          'ReceiveNotifWhenClose': true,
          'isOnDuty': true,
          'sendChatNotif': true,
          'isActive': true,
          'token': [],
          "profileImage": "",
          "userColor": color[index],
          "accountType": accountType,
          "createdAt": DateTime.now()
        });
        isLoading = false;
        statusSucces(true);
        Future.delayed(
          const Duration(milliseconds: 1),
          () => Get.back(),
        );

        email.clear();
        password.clear();
        firstName.clear();
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          isLoading = false;
          ShowDialog()
              .alerDialog(context!, "The password provided is too weak.");
          notifyListeners();
        } else if (e.code == 'email-already-in-use') {
          isLoading = false;
          ShowDialog().alerDialog(
              context!, "The account already exists for that email");
          notifyListeners();
        }
      } catch (e) {
        isLoading = false;
        ShowDialog().alerDialog(
            context!, "Something went wrong, please try again later");
        // ignore: avoid_print
        print(e);
      }
    }
  }

  //this function is to get current data profile of user to edit profile, so current data of use can be displayed on textfield and editable
  String name = "";
  String position = "";
  String email = "";
  String department = "";
  getCurrentProfile(
      {required String currentName,
      required String currentPosition,
      required String currentEmail,
      required String currentDepartement}) {
    name = currentName;
    position = currentPosition;
    email = currentEmail;
    department = currentDepartement;
    notifyListeners();
  }

//function for store new data that has been edited
  final editName = TextEditingController();
  final editPosition = TextEditingController();
  final editEmail = TextEditingController();
  final editDepartement = TextEditingController();

  editAccount(
      {required String newName,
      required String newPosition,
      required String newEmail,
      required String newDepartement,
      required String currentImageProfile}) async {
    notifyListeners();
    // print(newName);
    // print(newPosition);
    // print(newEmail);
    // print(newDepartement);
    // if (email != newEmail) {
    //   await db.collection("users").doc(email).delete();
    //   await db.collection("users").doc(newEmail).set({});
    // } else {
    //   await db.collection("users").doc(email).update({});
    // }
  }

  clearEditProfile() {
    editName.clear();
    editPosition.clear();
    editEmail.clear();
    editDepartement.clear();
    notifyListeners();
  }

  //function to delete account
  bool isLoadingDelete = false;
  bool isSuccessDelete = false;
  successTrueToFalse() {
    isSuccessDelete = false;
    notifyListeners();
  }

  deleteAccount(BuildContext context, String email) async {
    isLoadingDelete = true;
    if (isLoadingDelete) {
      await db.collection("users").doc(email).update({"isActive": false});
      isLoadingDelete = false;
      isSuccessDelete = true;
      notifyListeners();
      Future.delayed(
        const Duration(seconds: 2),
        () {},
      );
      // Get.back();
      // isSuccessDelete = false;
      notifyListeners();
      // Navigator.of(context).pop();
    }
  }
}
