import 'package:flutter/material.dart';
import 'package:post_web/other.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/benefit_to_hotel/widget/point.dart';

class BenefitTab extends StatelessWidget {
  const BenefitTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> point = [
      Point(
          imageIcon: "image/eficiency.png",
          title: "Efficiency",
          subtitle: eficiency,
          color: mainColor),
      Point(
          imageIcon: "image/mobile_staff.png",
          title: "Mobile Staﬀ",
          subtitle: mobileStaff,
          color: secondaryColor),
      Point(
          imageIcon: "image/accessanywhere.png",
          title: "Access from Anywhere",
          subtitle: accessAnywhere,
          color: mainColor),
      Point(
          imageIcon: "image/easy_communication.png",
          title: "Communication",
          subtitle: communication,
          color: secondaryColor),
      Point(
          imageIcon: "image/ticketmanagement.png",
          title: "Ticket Management",
          subtitle: ticketManagement,
          color: mainColor),
    ];
    return SizedBox(
        width: 1000,
        height: 700,
        child: GridView.count(
          crossAxisCount: 3,
          children: point,
        ));
  }
}
