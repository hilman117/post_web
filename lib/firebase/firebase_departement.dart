import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_web/reusable_widget/show_dialog.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/other.dart';

class FirebaseDepartement {
  final db = FirebaseFirestore.instance;
  final user = Get.put(CUser());

  registerNewDepartement(BuildContext context,
      TextEditingController newDepartement, String icon) async {
    try {
      await db
          .collection(hotelListCollection)
          .doc(user.data.hotel)
          .collection("Department")
          .doc(newDepartement.text)
          .set({
        "departement": newDepartement.text,
        "departementIcon": icon,
        "isActive": false,
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

  updateDepartement(BuildContext context, String dept, bool newBool) async {
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
