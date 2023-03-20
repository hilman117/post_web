import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:post_web/const.dart';
import 'package:post_web/reusable_widget/show_dialog.dart';
import 'package:uuid/uuid.dart';

class FirebaseCreateTask {
  final db = FirebaseFirestore.instance;
  final commentId = const Uuid().v1();
  createTask({
    required BuildContext context,
    required String hotelName,
    required String assigned,
    required List<String> image,
    required String description,
    required String emailReceiver,
    required String emailSender,
    required String from,
    required String id,
    required String location,
    required String positionSender,
    required String profileImageSender,
    required String receiver,
    required String sendTo,
    required String sender,
    required String setDate,
    required String setTime,
    required String time,
    required String colorUser,
    required String title,
  }) async {
    try {
      await db
          .collection(hotelListCollection)
          .doc(hotelName)
          .collection(taskCollection)
          .doc(id)
          .set({
        "assigned": FieldValue.arrayUnion([assigned]),
        "image": image,
        "comment": [],
        "description": description,
        "emailReceiver": emailReceiver,
        "emailSender": emailSender,
        "from": from,
        "id": id,
        "location": location,
        "positionSender": positionSender,
        "profileImageSender": profileImageSender,
        "receiver": receiver,
        "sendTo": sendTo,
        "sender": sender,
        "setDate": setDate,
        "setTime": setTime,
        "status": "New",
        "title": title,
        "isFading": true,
        "time": time
      });
      await db
          .collection(hotelListCollection)
          .doc(hotelName)
          .collection(taskCollection)
          .doc(id)
          .update({
        "comment": FieldValue.arrayUnion([
          {
            "accepted": "",
            "assignTask": "",
            "assignTo": "",
            "colorUser": colorUser,
            "commentBody": "",
            "esc": "",
            "hold": "",
            "newlocation": "",
            "resume": "",
            "scheduleDelete": "",
            "sender": sender,
            "senderemail": emailSender,
            "setDate": "",
            "setTime": "",
            "titleChange": "",
            "time": Timestamp.now(),
            "timeSent": Timestamp.now(),
            "imageComment": image,
            "description": description != ""
                ? "New request has created \nLocation: $location \nTitle: $title \n$description"
                : "New request has created \nLocation: $location \nTitle: $title",
            "commentId": commentId,
          }
        ])
      });
      Future.delayed(
        const Duration(seconds: 3),
        () async {
          await db
              .collection(hotelListCollection)
              .doc(hotelName)
              .collection(taskCollection)
              .doc(id)
              .update({"isFading": false});
        },
      );
    } on FirebaseException catch (e) {
      ShowDialog().errorDialog(context, "Something wrong");
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
