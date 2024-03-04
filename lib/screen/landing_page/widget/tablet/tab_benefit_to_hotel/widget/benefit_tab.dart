import 'package:flutter/material.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/landing_page/widget/tablet/tab_benefit_to_hotel/widget/point.dart';

class BenefitTablet extends StatelessWidget {
  final int pixels;
  const BenefitTablet({Key? key, required this.pixels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedPadding(
          padding: EdgeInsets.only(top: pixels > 2874 ? 0 : 150),
          duration: const Duration(milliseconds: 500),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: pixels > 2874 ? 1 : 0,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
          ),
        ),
        const SizedBox(height: 40),
        AnimatedPadding(
          padding: EdgeInsets.only(top: pixels > 3104 ? 0 : 150),
          duration: const Duration(milliseconds: 500),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: pixels > 3104 ? 1 : 0,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
            ),
          ),
        )
      ],
    );
  }
}
