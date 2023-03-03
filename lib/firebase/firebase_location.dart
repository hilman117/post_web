import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/extension/string_extention.dart';
import 'package:post_web/other.dart';

class FirebaseLocation {
  final db = FirebaseFirestore.instance;
  final user = Get.put(CUser());

  addNewLocation(String newLocation) async {
    await db.collection(hotelListCollection).doc(user.data.hotel).update({
      "location": FieldValue.arrayUnion([newLocation.toTitleCase()])
    });
  }
}
