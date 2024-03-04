// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_web/extension/string_extention.dart';
import 'package:post_web/reusable_widget/show_dialog.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/const.dart';

class FirebaseDepartement {
  final db = FirebaseFirestore.instance;
  final user = Get.put(CUser());
  List<String> deptColor = [
    "0xFFB71C1C",
    "0xFF0D47A1",
    "0xFF1B5E20",
    "0xFF212121",
    "0xff283593",
    "0xff1565C0",
    "0xff00838F",
    "0xff00695C",
    "0xff2E7D32",
    "0xff9E9D24",
    "0xffF9A825",
    "0xffEF6C00",
    "0xff78909C"
  ];

  registerNewDepartement(BuildContext context,
      TextEditingController newDepartement, String icon) async {
    var color = deptColor..shuffle();
    int index = Random().nextInt(deptColor.length);
    try {
      await db
          .collection(hotelListCollection)
          .doc(user.data.hotel)
          .collection("Department")
          .doc(newDepartement.text.toTitleCase())
          .set({
        "departement": newDepartement.text.toTitleCase(),
        "departementIcon": icon,
        "color": color[index],
        "isActive": true,
        "title": []
      });
      ShowDialog().succesDialog(context, "Register succed!!!");
    } catch (e) {
      return ShowDialog().errorDialog(context, "Upss! something went wrong");
    }
  }

  removeDepartement(BuildContext context, String dept) async {
    try {
      await db
          .collection(hotelListCollection)
          .doc(user.data.hotel)
          .collection("Department")
          .doc(dept)
          .delete();
      ShowDialog().deleteSucces(context);
    } catch (e) {
      return ShowDialog().errorDialog(context, "Upss! something went wrong");
    }
  }

  Future updateDepartement(
      BuildContext context, String dept, bool newBool) async {
    try {
      await db
          .collection(hotelListCollection)
          .doc(user.data.hotel)
          .collection("Department")
          .doc(dept)
          .update({"isActive": newBool});
    } catch (e) {
      ShowDialog().errorDialog(context, "Something went wrong");
    }
  }
}
