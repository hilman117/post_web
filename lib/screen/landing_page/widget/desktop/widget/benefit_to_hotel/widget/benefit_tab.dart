import 'package:flutter/material.dart';
import 'package:post_web/const.dart';

import 'package:post_web/screen/landing_page/widget/desktop/widget/benefit_to_hotel/widget/point.dart';

class BenefitTab extends StatelessWidget {
  const BenefitTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Point(
                imageIcon: "images/eficiency.png",
                title: "Efficiency",
                subtitle: eficiency,
                color: mainColor),
            Point(
                imageIcon: "images/mobile_staff.png",
                title: "Mobile Staﬀ",
                subtitle: mobileStaff,
                color: secondaryColor),
            Point(
                imageIcon: "images/accessanywhere.png",
                title: "Access from Anywhere",
                subtitle: accessAnywhere,
                color: mainColor),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Point(
                imageIcon: "images/easy_communication.png",
                title: "Communication",
                subtitle: communication,
                color: secondaryColor),
            Point(
                imageIcon: "images/ticketmanagement.png",
                title: "Ticket Management",
                subtitle: ticketManagement,
                color: mainColor),
          ],
        )
      ],
    );
  }
}
