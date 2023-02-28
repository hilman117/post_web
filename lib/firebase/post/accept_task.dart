import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/other.dart';
import 'package:uuid/uuid.dart';

class AcceptTask with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  final user = Get.put(CUser());

  int _acceptedTotal = 0;
  int get acceptedTotal => _acceptedTotal;
  final int _closeTotal = 0;
  int get closeTotal => _closeTotal;
  getTotalAcceptedAndClose() async {
    _acceptedTotal = user.data.acceptRequest!;
    notifyListeners();
  }

  int? _newTotalAccepted;
  int? get newTotalAccepted => _newTotalAccepted;
  addNewAcceptedTotal(BuildContext context, int addOne) {
    if (_newTotalAccepted == null) {
      _newTotalAccepted = user.data.acceptRequest! + addOne;
      db
          .collection(userCollection)
          .doc(user.data.email)
          .update({'acceptRequest': _newTotalAccepted});
      notifyListeners();
    } else {
      _newTotalAccepted = (newTotalAccepted! + addOne);
      db
          .collection(userCollection)
          .doc(user.data.email)
          .update({'acceptRequest': _newTotalAccepted});
      notifyListeners();
    }
  }

  acceptTask(BuildContext context, String idTask) async {
    await db
        .collection(hotelListCollection)
        .doc(user.data.hotel)
        .collection(taskCollection)
        .doc(idTask)
        .update({
      "status": "Accepted",
      'isFading': true,
      "receiver": "${user.data.name}",
      "emailReceiver": user.data.email,
      "comment": FieldValue.arrayUnion([
        {
          "timeSent": DateTime.now(),
          'accepted': user.data.name,
          'colorUser': "",
          'assignTask': "",
          'assignTo': "",
          'commentBody': '',
          'commentId': const Uuid().v4(),
          'description': "",
          'esc': '',
          'imageComment': [],
          'sender': user.data.name,
          'senderemail': user.data.email,
          'setDate': '',
          'setTime': '',
          'time': DateTime.now(),
          'titleChange': "",
          'newlocation': "",
          'hold': "",
          'resume': "",
          'scheduleDelete': "",
        }
      ])
    });
    await addNewAcceptedTotal(context, 1);
    Future.delayed(
      const Duration(seconds: 4),
      () async {
        FirebaseFirestore.instance
            .collection(hotelListCollection)
            .doc(user.data.hotel)
            .collection(taskCollection)
            .doc(idTask)
            .update({'isFading': false});
      },
    );
  }
}
