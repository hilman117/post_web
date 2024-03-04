import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:post_web/const.dart';
import 'package:post_web/main.dart';
import 'package:uuid/uuid.dart';

class FirebaseCreateTask {
  final db = FirebaseFirestore.instance;
  final commentId = const Uuid().v1();
  final firestore = FirebaseFirestore.instance;

  createTask(
      {required BuildContext context,
      required String hotelName,
      required String assigned,
      required List<String> image,
      required String description,
      required String resolusi,
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
      required String closeTime,
      required String colorUser,
      required String title,
      required String status,
      required int requestDone,
      required int createRequest,
      required String iconDepartement}) async {
    String token = box!.get("token");
    try {
      await firestore
          .collection(hotelListCollection)
          .doc(hotelName)
          .collection(taskCollection)
          .doc(id)
          .set({
        "subscriberToken": FieldValue.arrayUnion([token]),
        "assigned": FieldValue.arrayUnion([assigned]),
        "image": image,
        "description": description,
        "emailReceiver": emailReceiver,
        "emailSender": emailSender,
        "from": from,
        "id": id,
        "typeReport": "tasks",
        "location": location,
        "positionSender": positionSender,
        "profileImageSender": profileImageSender,
        "receiver": receiver,
        "sendTo": sendTo,
        "sender": sender,
        "setDate": setDate,
        "setTime": setTime,
        "status": status,
        "title": title,
        "isFading": true,
        "time": time,
        "closeTime": closeTime,
        "iconDepartement": iconDepartement,
        "resolusi": resolusi,
        "comment": FieldValue.arrayUnion([
          {
            "accepted": "",
            "assignTask": "",
            "assignTo": "",
            "colorUser": colorUser,
            "commentBody": "$title for $location",
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
            "time": DateTime.now().toString(),
            "timeSent": DateTime.now().toString(),
            "imageComment": image,
            "description": description,
            "commentId": commentId,
          }
        ])
      });
      Future.delayed(
        const Duration(seconds: 2),
        () async {
          await firestore
              .collection("Hotel List")
              .doc(hotelName)
              .collection("tasks")
              .doc(id)
              .update({"isFading": false});
        },
      );
    } on FirebaseException catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
