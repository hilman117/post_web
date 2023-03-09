import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/extension/string_extention.dart';
import 'package:post_web/const.dart';

class FirebaseLocation {
  final db = FirebaseFirestore.instance;
  final user = Get.put(CUser());

  getLocation() {
    return FirebaseFirestore.instance
        .collection(hotelListCollection)
        .doc(user.data.hotelid)
        .get();
  }

  addNewLocation(String newLocation) async {
    await db.collection(hotelListCollection).doc(user.data.hotel).update({
      "location": FieldValue.arrayUnion([newLocation.toTitleCase()])
    });
    getLocation();
  }

  removeLocation(List currentLocation, int indexToRemove) async {
    // because firestore doesn't provide delete method for spesific field item inside the document
    //so we create our own method with following step.
    //first step we get all list data from firestore document
    //second we delete index that we want to delete
    currentLocation.removeAt(indexToRemove);

    // third, delete entire current list within firestore document
    await db
        .collection(hotelListCollection)
        .doc(user.data.hotel)
        .update({"location": FieldValue.arrayRemove(currentLocation)});
    //fourth, restore new list to the same firestore document without item that we want to delele
    await db
        .collection(hotelListCollection)
        .doc(user.data.hotel)
        .update({"location": currentLocation});
    getLocation();
  }
}
