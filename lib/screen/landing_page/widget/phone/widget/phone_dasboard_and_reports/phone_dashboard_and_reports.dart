import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/landing_page/widget/left_point.dart';
import 'package:post_web/screen/landing_page/widget/right_point.dart';

class PhoneDashBoardAndReports extends StatelessWidget {
  final List<int> scrollExperience;
  final int pixels;
  const PhoneDashBoardAndReports(
      {Key? key, required this.scrollExperience, required this.pixels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      child: LayoutBuilder(
        builder: (p0, p1) => Padding(
          padding: EdgeInsets.symmetric(
              horizontal: p1.maxWidth * 0.1, vertical: p1.maxWidth * 0.1),
          child: Column(
            children: [
              AnimatedPadding(
                padding: EdgeInsets.only(top: pixels > 2871 ? 0 : 150),
                duration: const Duration(milliseconds: 500),
                child: AnimatedOpacity(
                  opacity: pixels > 2871 ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: Text("DASHBOARD & REPORT",
                      style: GoogleFonts.poppins(
                          fontSize: p1.maxWidth * 0.035,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff333333))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AnimatedPadding(
                padding: EdgeInsets.only(top: pixels > 2975 ? 0 : 150),
                duration: const Duration(milliseconds: 500),
                child: AnimatedOpacity(
                  opacity: pixels > 2975 ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("image/report.png", width: p1.maxWidth * 0.3),
                      RightPoint(
                        title: "Realtime",
                        subtitle:
                            "Real time dashboards for operators to view pending and closed requests",
                        imageIcon: "image/accessanywhere.png",
                        color: mainColor,
                        textboxSize: p1.maxWidth * 0.3,
                        imageIconSize: p1.maxWidth * 0.1,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AnimatedPadding(
                padding: EdgeInsets.only(top: pixels > 3098 ? 0 : 150),
                duration: const Duration(milliseconds: 500),
                child: AnimatedOpacity(
                  opacity: pixels > 3098 ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LeftPoint(
                        title: "Analytics",
                        subtitle:
                            "Report shows analytics for request families, departments, location, etc",
                        imageIcon: "image/analisys-report.png",
                        color: mainColor,
                        textBoxSize: p1.maxWidth * 0.3,
                        imageIconSize: p1.maxWidth * 0.1,
                        left: MainAxisAlignment.start,
                      ),
                      Image.asset("image/report.png", width: p1.maxWidth * 0.3),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
