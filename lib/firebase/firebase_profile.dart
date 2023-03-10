import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:post_web/const.dart';

class FirebaseProfile {
  var auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Map<String, dynamic>>> getProfileData() {
    return db.collection(userCollection).doc(auth.currentUser!.email).get();
  }

  updateSettingProfile(bool notifReceived, bool notifClose, bool onDuty,
      bool sendNotif, String profileImage) async {
    await db.collection(userCollection).doc(auth.currentUser!.email).update({
      "ReceiveNotifWhenAccepted": notifReceived,
      "ReceiveNotifWhenClose": notifClose,
      "isOnDuty": onDuty,
      "sendChatNotif": sendNotif,
      "profileImage": profileImage
    });
  }
}
