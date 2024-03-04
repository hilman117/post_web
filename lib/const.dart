import 'dart:math';

import 'package:flutter/material.dart';

const Color mainColor = Color(0xff3100F9);
const Color mainColor2 = Color(0xff0071B1);
const Color secondaryColor = Color(0xff0FD0B6);
const Color colorTextCard = Colors.black54;
const String hotelListCollection = "Hotel List";
const String userCollection = "users";
const String taskCollection = "tasks";
const String departementDoc = "Department";
const String lfCollection = "Lost And Found";
const String administrator = "Administrator";
const String deptAdmin = "Dept. Admin";
const String noAdmin = "Non-admin";
const String bucketStorage = "gs://post-212c8.appspot.com";
const String forAllDepartment =
    "Every department on one system to improve productivity and efficiency through the automation of all requests such as Maintenance, Housekeeping, Room service, Concierge, IT… and much more.";
const String easyToUse =
    "On-the-go request entry from anywhere, push notifications, dedicated real-time chat rooms per request providing all lifecycle details.";
const String analysReport =
    "Reports Analysis of the nature of complaints and requests for a better understanding of common issues.";
const String autoDispatch =
    "Auto-dispatch request With department-specific distribution workflows, requests are sent to the right department, and automatically escalated in case of service delays.";
const String webDesktop =
    "Web desktop Real-time dashboard of daily tasks makes sure nothing goes unfinished.";
const String maintananceSchedule =
    "Task planning For scheduled maintenance and routine tasks.";
const String multiLanguage = " Apps and dashboard in 13 languages.";
const String escalationRule =
    "Enhanced escalation rules to ensure all requests are handled in a timely manner.";
const String multiProperty =
    "Multiple property management for corporate users.";
const String cloud = "Full cloud platform - no local installation.";
const String eficiency =
    "Improved interaction across departments, increasing efficiency & accountability";
const String mobileStaff =
    "Access all work and requests being done on property in real time from any mobile device";
const String accessAnywhere =
    "Monitor your property from anywhere, on any device";
const String ticketManagement =
    "Never miss a ticket due to our custom escalations";
const String communication =
    "Communicate easily across every department while on the go";

const List<String> departementIcon = [
  "images/Engineering.png",
  "images/Entertainment.png",
  "images/Front Office.png",
  "images/IT Support.png",
  "images/Room Service.png",
  "images/Housekeeping.png",
  "images/Butler.png",
  "images/Concierge.png",
  "images/entertain-2.png",
  "images/guard.png",
  "images/hr-manager.png",
  "images/laundry.png",
  "images/hotel-bell.png",
  "images/kitchen-utensils.png",
  "images/police.png",
  "images/chef.png",
  "images/menu.png"
];

const List<String> role = [
  "General Manager",
  "Assistant Executive Manager",
  "Hotel Manager",
  "Front Office Manager",
  "Director of Sales and Marketing",
  "Revenue Manager",
  "Guest Services Manager",
  "Executive Housekeeper",
  "Housekeeping Manager",
  "Food and Beverage Director",
  "Executive Chef",
  "Sous Chef",
  "Banquet Manager",
  "Bar Manager",
  "Restaurant Manager",
  "Spa Manager",
  "Guest Relations Manager",
  "Bellman",
  "Concierge",
  "Front Desk Agent",
  "Reservations Agent",
  "Night Auditor",
  "Housekeeping Attendant",
  "Laundry Attendant",
  "Room Service Attendant",
  "Bartender",
  "Waiter/Waitress",
  "Barista",
  "Chef de Partie",
  "Commis Chef",
  "Kitchen Steward",
  "Massage Therapist",
  "Fitness Trainer",
  "Engineering Attendant"
];

//id for tasks
int generateUniqueId() {
  int timestamp = DateTime.now().millisecondsSinceEpoch;
  int randomDigits =
      Random().nextInt(10000); // Ganti 1000000 sesuai kebutuhan digit acak

  return int.parse('$timestamp$randomDigits');
}

//id for notifikasi
int generateId() {
  int randomDigits = Random().nextInt(32); // Ganti  sesuai kebutuhan digit acak

  return int.parse('$randomDigits');
}
