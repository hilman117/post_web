import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:post_web/models/task.dart';

import '../const.dart';
import '../controller/c_user.dart';

class FirebaseGetTaskData {
  final user = Get.put(CUser());

  //get history task
  Future<List<TaskModel>> getHistoryTask() async {
    List<TaskModel> listTask = await FirebaseFirestore.instance
        .collection(hotelListCollection)
        .doc(user.data.hotel)
        .collection(taskCollection)
        .where("status", isEqualTo: "Close")
        .limit(200)
        .get()
        .then((snapshot) => snapshot.docs
            .map((data) => TaskModel.fromJson(data.data()))
            .toList());
    return listTask;
  }

  //get all task data, all status
  Future<List<TaskModel>> getAllTask() async {
    List<TaskModel> listTask = await FirebaseFirestore.instance
        .collection(hotelListCollection)
        .doc(user.data.hotel)
        .collection(taskCollection)
        .get()
        .then((snapshot) => snapshot.docs
            .map((data) => TaskModel.fromJson(data.data()))
            .toList());
    return listTask;
  }
}
