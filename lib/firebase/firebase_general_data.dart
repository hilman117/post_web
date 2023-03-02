import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/models/departement.dart';
import 'package:post_web/models/general_data.dart';
import 'package:post_web/other.dart';

class FirebaseGeneralData with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  final user = Get.put(CUser());
  List<Departement> listDepartement = [];
  List<QueryDocumentSnapshot<Object?>> list = [];
  GeneralData? getData;

  Future getGeneralData() async {
    var getAdminData =
        await db.collection(hotelListCollection).doc(user.data.hotel).get();
    Map<String, dynamic> data = getAdminData.data() as Map<String, dynamic>;
    getData = GeneralData.fromJson(data);
    listDepartement =
        getData!.departement!.map((e) => Departement.fromJson(e)).toList();
    notifyListeners();
  }
}
