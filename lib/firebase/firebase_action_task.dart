import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/const.dart';
import 'package:post_web/reusable_widget/show_dialog.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class FirebaseActionTask with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  final user = Get.put(CUser());

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
    Provider.of<ChatroomControlller>(context, listen: false)
        .newStatus("Accepted");
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

  sendComment(
      {required BuildContext context,
      required String idTask,
      String? commentBody,
      List<String>? imageUrl}) async {
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
          'colorUser': user.data.userColor,
          'assignTask': "",
          'assignTo': "",
          'commentBody': commentBody ?? "",
          'commentId': const Uuid().v4(),
          'description': "",
          'esc': '',
          'imageComment': imageUrl ?? [],
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

  int? newTotalClose;
  addNewCLoseTotal(BuildContext context, int addOne) {
    if (newTotalClose == null) {
      newTotalClose = user.data.closeRequest! + addOne;
      db
          .collection(userCollection)
          .doc(user.data.email)
          .update({'closeRequest': newTotalClose});
      notifyListeners();
    } else {
      newTotalClose = (newTotalAccepted! + addOne);
      db
          .collection(userCollection)
          .doc(user.data.email)
          .update({'closeRequest': newTotalClose});
      notifyListeners();
    }
  }

  closeTask(BuildContext context, String idTask,
      TextEditingController commentBody) async {
    try {
      await db
          .collection(hotelListCollection)
          .doc(user.data.hotel)
          .collection(taskCollection)
          .doc(idTask)
          .update({
        "status": "Close",
        'isFading': true,
        "receiver": "${user.data.name}",
        "emailReceiver": user.data.email,
        "comment": FieldValue.arrayUnion([
          {
            "timeSent": DateTime.now(),
            'accepted': "",
            'colorUser': user.data.userColor,
            'assignTask': "",
            'assignTo': "",
            'commentBody': commentBody.text != ""
                ? 'has close this request \n${commentBody.text}'
                : 'has close this request',
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
      Provider.of<ChatroomControlller>(context, listen: false)
          .newStatus("Close");
      await addNewCLoseTotal(context, 1);
      commentBody.clear();
      // Navigator.of(context).pop();
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
    } catch (e) {
      // ShowDialog().errorDialog(context, "Something went wrong");
    }
  }

  reopenTask(BuildContext context, String idTask) async {
    try {
      await db
          .collection(hotelListCollection)
          .doc(user.data.hotel)
          .collection(taskCollection)
          .doc(idTask)
          .update({
        "status": "Reopen",
        'isFading': true,
        "receiver": "${user.data.name}",
        "emailReceiver": user.data.email,
        "comment": FieldValue.arrayUnion([
          {
            "timeSent": DateTime.now(),
            'accepted': "",
            'colorUser': user.data.userColor,
            'assignTask': "",
            'assignTo': "",
            'commentBody': "has reopen this request",
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
      Provider.of<ChatroomControlller>(context, listen: false)
          .newStatus("Reopen");
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
    } catch (e) {
      ShowDialog().errorDialog(context, "Something went wrong");
    }
  }
}
