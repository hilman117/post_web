import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
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
      "title": FieldValue.arrayUnion([newTitle])
    });
  }
}
