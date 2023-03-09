import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/extension/string_extention.dart';
import 'package:post_web/const.dart';

class FirebaseTitle {
  final db = FirebaseFirestore.instance;
  final user = Get.put(CUser());

  Future<DocumentSnapshot<Map<String, dynamic>>> getTitle(String dept) {
    return FirebaseFirestore.instance
        .collection(hotelListCollection)
        .doc(user.data.hotelid)
        .collection(departementDoc)
        .doc(dept)
        .get();
  }

  addNewTitle(String toDepartement, String newTitle) async {
    try {
      await db
          .collection(hotelListCollection)
          .doc(user.data.hotel)
          .collection(departementDoc)
          .doc(toDepartement)
          .update({
        "title": FieldValue.arrayUnion([newTitle.toTitleCase()])
      });
      getTitle(toDepartement);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  removeTitle(
      String forDepartement, List currentTitle, int indexToRemove) async {
    // because firestore doesn't provide delete method for spesific field item inside the document
    //so we create our own method with following step.
    //first step we get all list data from firestore document
    //second we delete index that we want to delete
    currentTitle.removeAt(indexToRemove);

    try {
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
      getTitle(forDepartement);
      // ignore: empty_catches
    } catch (e) {}
  }
}
