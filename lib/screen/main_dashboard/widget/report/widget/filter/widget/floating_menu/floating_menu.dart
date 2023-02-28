import 'package:flutter/material.dart';
import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/filter/widget/floating_menu/widget/clear_cancel_apply.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/filter/widget/floating_menu/widget/date_filter.dart';
import 'package:provider/provider.dart';

import 'widget/status_filter.dart';

class FloatingMenuWidget extends StatelessWidget {
  const FloatingMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ReportController>(
        builder: (context, value, child) => SizedBox(
              width: size.width * 0.3,
              child: Column(
                children: [
                  const Triangle(),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.grey.shade300, width: 1.5)),
                    height: size.height * 0.20,
                    width: size.width * 0.3,
                    // color: Colors.blue,
                    child: Material(
                      child: LayoutBuilder(
                        builder: (p0, p1) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              width: p1.maxWidth,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: p1.maxWidth * 0.15,
                                  )
                                ],
                              ),
                            ),
                            FilterStatus(
                              p1: p1,
                            ),
                            DateFilter(p1: p1),
                            ClearCancelApply(p1: p1)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}

class Triangle extends StatelessWidget {
  const Triangle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: ClipPath(
            clipper: TraingleClip(),
            child: Container(
              height: 8,
              width: 15,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                color: Colors.grey.shade200,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TraingleClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    Path path = Path();
    path.lineTo(width * 0.5, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.lineTo(width * 0.5, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
