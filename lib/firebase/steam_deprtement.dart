import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';

import '../../models/departement.dart';
import '../../other.dart';

class DepartementData {
  final db = FirebaseFirestore.instance;
  final user = Get.put(CUser());
  Stream<List<Departement>> getDepartementData() {
    return db
        .collection(hotelListCollection)
        .doc(user.data.hotel)
        .collection("Department")
        .snapshots(includeMetadataChanges: true)
        .map((snapshot) => snapshot.docs
            .map((docs) => Departement.fromJson(docs.data()))
            .toList());
  }
}
