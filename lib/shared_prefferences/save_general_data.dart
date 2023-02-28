import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:post_web/models/general_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveGeneralData {
  static Future<void> saveGeneralData(
      BuildContext context, GeneralData data) async {
    // getOntroller.getGeneralData(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> generalDataHotel = data.toJson();
    prefs.setString('generalDataHotel', jsonEncode(generalDataHotel));
  }

  // static Future<UserDetails?> getUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   UserDetails? user;
  //   String? userString = prefs.getString('user');
  //   if (userString != null) {
  //     Map<String, dynamic> userMap = jsonDecode(userString);
  //     user = UserDetails.fromJson(userMap);
  //     final cUser = Get.put(CUser());
  //     cUser.setData(user);
  //   }
  //   return user;
  // }

  // static Future<void> clear() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.remove('user');
  // }
}
