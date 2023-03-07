import 'package:flutter/material.dart';
import 'package:post_web/const.dart';

import 'package:post_web/screen/landing_page/widget/desktop/widget/benefit_to_hotel/widget/point.dart';

class BenefitTab extends StatelessWidget {
  const BenefitTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
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
          ],
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
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
          ],
        )
      ],
    );
  }
}
