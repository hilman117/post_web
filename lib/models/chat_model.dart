import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  ChatModel(
      {this.accepted,
      this.description,
      this.assignTask,
      this.setDate,
      this.setTime,
      this.sender,
      this.commentBody,
      this.commentId,
      this.esc,
      this.hold,
      this.time,
      this.timeSent,
      this.imageComment,
      this.newlocation,
      this.resume,
      this.scheduleDelete,
      this.senderemail,
      this.colorUser,
      this.titleChange,
      this.assignTo});

  String? accepted;
  String? assignTask;
  String? assignTo;
  String? commentBody;
  String? commentId;
  String? description;
  String? colorUser;
  String? esc;
  List<String>? imageComment;
  String? hold;
  String? newlocation;
  String? resume;
  String? scheduleDelete;
  String? sender;
  String? senderemail;
  String? setDate;
  String? setTime;
  Timestamp? time;
  Timestamp? timeSent;
  String? titleChange;

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
      accepted: json["accepted"],
      colorUser: json["colorUser"],
      assignTask: json["assignTask"],
      senderemail: json["senderemail"],
      assignTo: json["assignTo"],
      sender: json["sender"],
      commentBody: json["commentBody"],
      commentId: json["commentId"],
      description: json["description"],
      esc: json["esc"],
      imageComment: List<String>.from(json["imageComment"].map((x) => x)),
      hold: json["hold"],
      newlocation: json["newlocation"],
      resume: json["resume"],
      scheduleDelete: json["scheduleDelete"],
      setDate: json["setDate"],
      setTime: json["setTime"],
      time: json["time"],
      timeSent: json["timeSent"],
      titleChange: json["titleChange"]);

  Map<String, dynamic> toJson() => {
        "accepted": accepted,
        "colorUser": colorUser,
        "assignTask": assignTask,
        "senderemail": senderemail,
        "assignTo": assignTo,
        "commentBody": commentBody,
        "commentId": commentId,
        "description": description,
        "esc": esc,
        "imageComment": imageComment == null
            ? []
            : List<String>.from(imageComment!.map((x) => x)),
        "hold": hold,
        "newlocation": newlocation,
        "resume": resume,
        "scheduleDelete": scheduleDelete,
        "setDate": setDate,
        "setTime": setTime,
        "time": time,
        "sender": sender,
        "timeSent": timeSent,
        "titleChange": titleChange,
      };
}
