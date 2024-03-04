import 'package:flutter/material.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/landing_page/widget/phone/widget/phone_benefit_to_hotel/widget/point.dart';

class BenefitTablet extends StatelessWidget {
  final int pixels;
  const BenefitTablet({Key? key, required this.pixels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        height: size.height * 1,
        child: LayoutBuilder(
          builder: (p0, p1) => Column(
            children: [
              AnimatedPadding(
                padding: EdgeInsets.only(top: pixels > 1663 ? 0 : 150),
                duration: const Duration(milliseconds: 500),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: pixels > 1663 ? 1 : 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Point(
                        imageIcon: "images/eficiency.png",
                        title: "Efficiency",
                        subtitle: eficiency,
                        color: mainColor,
                        size: p1,
                      ),
                      Point(
                        imageIcon: "images/mobile_staff.png",
                        title: "Mobile Staﬀ",
                        subtitle: mobileStaff,
                        color: secondaryColor,
                        size: p1,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              AnimatedPadding(
                padding: EdgeInsets.only(top: pixels > 1848 ? 0 : 150),
                duration: const Duration(milliseconds: 500),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: pixels > 1848 ? 1 : 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Point(
                        imageIcon: "images/accessanywhere.png",
                        title: "Access from Anywhere",
                        subtitle: accessAnywhere,
                        color: mainColor,
                        size: p1,
                      ),
                      Point(
                        imageIcon: "images/easy_communication.png",
                        title: "Communication",
                        subtitle: communication,
                        color: secondaryColor,
                        size: p1,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              AnimatedPadding(
                padding: EdgeInsets.only(top: pixels > 2164 ? 0 : 100),
                duration: const Duration(milliseconds: 500),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: pixels > 2164 ? 1 : 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Point(
                        imageIcon: "images/ticketmanagement.png",
                        title: "Ticket Management",
                        subtitle: ticketManagement,
                        color: mainColor,
                        size: p1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
