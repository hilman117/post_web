import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/extension/string_extention.dart';
import 'package:post_web/other.dart';

class FirebaseTitle {
  final db = FirebaseFirestore.instance;
  final user = Get.put(CUser());

  addNewTitle(String toDepartement, String newTitle) async {
    await db
        .collection(hotelListCollection)
        .doc(user.data.hotel)
        .collection(departementDoc)
        .doc(toDepartement)
        .update({
      "title": FieldValue.arrayUnion([newTitle.toTitleCase()])
    });
  }

  removeTitle(
      String forDepartement, List currentTitle, int indexToRemove) async {
    // because firestore doesn't provide delete method for spesific field item inside the document
    //so we create our own method with following step.
    //first step we get all list data from firestore document
    //second we delete index that we want to delete
    currentTitle.removeAt(indexToRemove);

    // third, delete entire current list within firestore document
    await db
        .collection(hotelListCollection)
        .doc(user.data.hotel)
        .collection(departementDoc)
        .doc(forDepartement)
        .update({"title": FieldValue.arrayRemove(currentTitle)});
    //fourth, restore new list to the same firestore document without item that we want to delele
    await db
        .collection(hotelListCollection)
        .doc(user.data.hotel)
        .collection(departementDoc)
        .doc(forDepartement)
        .update({"title": currentTitle});
  }
}
