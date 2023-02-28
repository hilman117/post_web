import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/models/task.dart';

class StreamTask {
  final cUser = Get.put(CUser());
  final taskmodel = Get.put(TaskModel());
  FirebaseFirestore db = FirebaseFirestore.instance;
  task(String dept, String status) {
    if (dept == "" && status == "") {
      return FirebaseFirestore.instance
          .collection("Hotel List")
          .doc(cUser.data.hotelid)
          .collection("tasks")
          .where("status", isNotEqualTo: "Close")
          .snapshots(includeMetadataChanges: true);
    }
    if (dept != "" && status == "") {
      return FirebaseFirestore.instance
          .collection("Hotel List")
          .doc(cUser.data.hotelid)
          .collection("tasks")
          .where("status", isNotEqualTo: "Close")
          .where("assigned", arrayContains: dept)
          .snapshots(includeMetadataChanges: true);
    }
    if (status != "" && dept == "") {
      return FirebaseFirestore.instance
          .collection("Hotel List")
          .doc(cUser.data.hotelid)
          .collection("tasks")
          .where("status", isEqualTo: status)
          .snapshots(includeMetadataChanges: true);
    }
    if (status != "" && dept != "") {
      return FirebaseFirestore.instance
          .collection("Hotel List")
          .doc(cUser.data.hotelid)
          .collection("tasks")
          .where("status", isEqualTo: status)
          .where("assigned", arrayContains: dept)
          .snapshots(includeMetadataChanges: true);
    }
  }

  Stream<List<TaskModel>> streamTask() {
    return db
        .collection("Hotel List")
        .doc(cUser.data.hotelid)
        .collection("tasks")
        .snapshots(includeMetadataChanges: true)
        .map((snapshot) => snapshot.docs
            .map((docs) => TaskModel.fromJson(docs.data()))
            .toList());
  }
}
