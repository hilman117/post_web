import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';

class Notif {
  String serverKey =
      "AAAA5wRMCcM:APA91bFKmnPpduoGw0-scInqjxcXJ-99eUPTVORgbsSRjFGJlLkdmyOR5Ail6I2KYvjAfvoPaJ9vYXo6eXQ5a4caMEeF2EuMN8cFMkLFRQceZxEgY2B7puAPn4HWChx00P-v2-lVWWrK";

  Future<String> getToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    return fcmToken!;
  }

  Future<void> showFlutterNotificationOnBackground(
      RemoteMessage message) async {
    // ignore: avoid_print
    print(message);
  }

  void showFlutterNotificatiOnOpenedApp(RemoteMessage message) {
    // ignore: avoid_print
    print(message);
  }

  void showForgroundNotification(BuildContext context, RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    // AndroidNotification? android = message.notification!.android;
    if (notification != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(notification.title!)));
    }
    // ignore: avoid_print
    print('NOTIFICATION forground ' + notification!.title.toString());
  }

//to subscribe topic
  Future<void> subscribeTopic(String topic) async {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  //void to send push notification
  void sendNotifToTopic(String topic, String title, String body) async {
    var data = {
      "notification": {"title": title, "body": body},
      "data": {"score": "5x1", "time": "15:10"},
      "priority": "high",
      "to": "/topics/$topic"
    };
    // print("----------------------------");
    print(data);
    var respon = await http.post(
        Uri.parse("https://fcm.googleapis.com/fcm/send"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "key=$serverKey"
        },
        body: jsonEncode(data));
    // ignore: avoid_print
    print(respon.body);
  }

  void sendNotifToToken(
    String token,
    String title,
    String body,
    String image,
  ) async {
    var data = {
      "notification": {"title": title, "body": body, "image": image},
      "data": {"score": "5x1", "time": "15:10"},
      "priority": "high",
      "to": token
    };
    // ignore: avoid_print
    print(data);
    var respon = await http.post(
        Uri.parse("https://fcm.googleapis.com/fcm/send"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "key=$serverKey"
        },
        body: jsonEncode(data));
    // ignore: avoid_print
    print(respon.body);
  }
}
