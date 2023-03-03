import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';

import '../../models/departement.dart';
import '../../other.dart';
import '../models/general_data.dart';
import '../models/task.dart';

class FirebaseStreamData {
  final db = FirebaseFirestore.instance;
  final user = Get.put(CUser());
  Stream<List<Departement>> getDepartementData() {
    return db
        .collection(hotelListCollection)
        .doc(user.data.hotel)
        .collection(departementDoc)
        .snapshots(includeMetadataChanges: true)
        .map((snapshot) => snapshot.docs
            .map((docs) => Departement.fromJson(docs.data()))
            .toList());
  }

  Stream<GeneralData> streamGeneralData() {
    return db
        .collection(hotelListCollection)
        .doc(user.data.hotel)
        .snapshots()
        .map((snapshot) => GeneralData.fromJson(snapshot.data()!));
  }

  task(String dept, String status) {
    if (dept == "" && status == "") {
      return FirebaseFirestore.instance
          .collection(hotelListCollection)
          .doc(user.data.hotelid)
          .collection(taskCollection)
          .where("status", isNotEqualTo: "Close")
          .snapshots(includeMetadataChanges: true);
    }
    if (dept != "" && status == "") {
      return FirebaseFirestore.instance
          .collection(hotelListCollection)
          .doc(user.data.hotelid)
          .collection(taskCollection)
          .where("status", isNotEqualTo: "Close")
          .where("assigned", arrayContains: dept)
          .snapshots(includeMetadataChanges: true);
    }
    if (status != "" && dept == "") {
      return FirebaseFirestore.instance
          .collection(hotelListCollection)
          .doc(user.data.hotelid)
          .collection(taskCollection)
          .where("status", isEqualTo: status)
          .snapshots(includeMetadataChanges: true);
    }
    if (status != "" && dept != "") {
      return FirebaseFirestore.instance
          .collection(hotelListCollection)
          .doc(user.data.hotelid)
          .collection(taskCollection)
          .where("status", isEqualTo: status)
          .where("assigned", arrayContains: dept)
          .snapshots(includeMetadataChanges: true);
    }
  }

  Stream<List<TaskModel>> streamTask() {
    return db
        .collection(hotelListCollection)
        .doc(user.data.hotelid)
        .collection(taskCollection)
        .snapshots(includeMetadataChanges: true)
        .map((snapshot) => snapshot.docs
            .map((docs) => TaskModel.fromJson(docs.data()))
            .toList());
  }
}
