import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/const.dart';
import 'package:post_web/reusable_widget/show_dialog.dart';
import 'package:uuid/uuid.dart';

class FirebaseActionTask {
  final db = FirebaseFirestore.instance;
  final user = Get.put(CUser());

  addNewAcceptedTotal(int newTotalAccepted) {
    db
        .collection(userCollection)
        .doc(user.data.email)
        .update({'acceptRequest': newTotalAccepted});
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
      'isFading': true,
      "comment": FieldValue.arrayUnion([
        {
          "timeSent": DateTime.now(),
          'accepted': "",
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

  addNewCLoseTotal(int newTotalClose) {
    db
        .collection(userCollection)
        .doc(user.data.email)
        .update({'closeRequest': newTotalClose});
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
      ShowDialog().errorDialog(
          context, "Something went wrong, cannot change the status");
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
      ShowDialog().errorDialog(
          context, "Something went wrong, cannot change the status");
    }
  }

  holdTask(BuildContext context, String idTask) async {
    try {
      await db
          .collection(hotelListCollection)
          .doc(user.data.hotel)
          .collection(taskCollection)
          .doc(idTask)
          .update({
        "status": "Hold",
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
            'commentBody': "",
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
            'hold': "${user.data.name} hold this request",
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
    } catch (e) {
      ShowDialog().errorDialog(
          context, "Something went wrong, cannot change the status");
    }
  }

  resumeTask(BuildContext context, String idTask) async {
    try {
      await db
          .collection(hotelListCollection)
          .doc(user.data.hotel)
          .collection(taskCollection)
          .doc(idTask)
          .update({
        "status": "Resume",
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
            'commentBody': "",
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
            'resume': "${user.data.name} resume this request",
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
    } catch (e) {
      ShowDialog().errorDialog(
          context, "Something went wrong, cannot change the status");
    }
  }

  assignTask(BuildContext context, String idTask,
      List<String> listReceiverAssignment) async {
    try {
      await db
          .collection(hotelListCollection)
          .doc(user.data.hotel)
          .collection(taskCollection)
          .doc(idTask)
          .update({
        "assigned": FieldValue.arrayUnion(listReceiverAssignment),
        "status": "Assigned",
        'isFading': true,
        "receiver": "${user.data.name}",
        "emailReceiver": user.data.email,
        "comment": FieldValue.arrayUnion([
          {
            "timeSent": DateTime.now(),
            'accepted': "",
            'colorUser': user.data.userColor,
            'assignTask': "",
            'assignTo': listReceiverAssignment.join(", "),
            'commentBody': "",
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
      ShowDialog().errorDialog(
          context, "Something went wrong, cannot change the status");
    }
  }
}
