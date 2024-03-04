import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/screen/landing_page/landing_page_controller.dart';
import 'package:provider/provider.dart';

import '../menu_hover.dart';

class AppBarTablet extends StatelessWidget {
  const AppBarTablet({
    Key? key,
    required this.pixels,
    required this.size,
    required this.controller,
    required this.scrollController,
  }) : super(key: key);

  final double pixels;
  final Size size;
  final LandingPageController controller;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: pixels > 95 ? Colors.white : const Color(0xdd3152D9),
      // alignment: Alignment.center
      width: size.width,
      height: size.height * 0.1,
      child: LayoutBuilder(
          builder: (p0, p1) => Consumer<LandingPageController>(
                builder: (context, value, child) => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/icon.png",
                      width: p1.maxWidth * 0.1,
                      height: p1.maxHeight * 0.8,
                    ),
                    Text(
                      "Post",
                      style: GoogleFonts.poppins(
                          fontSize: p1.maxWidth * 0.035,
                          color: pixels > 95 ? Colors.black54 : Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        MouseRegion(
                            onEnter: (event) => controller.homeHovering(true),
                            onExit: (event) => controller.homeHovering(false),
                            child: MenuHover(
                              size: p1.maxWidth * 0.070,
                              menu: value.isHomeHover,
                              callback: () => controller.scrollToSection(
                                  scrollController, 0),
                              menuName: "Home",
                              pixels: pixels,
                              startPosition: 0,
                              endPosition: 398,
                            )),
                        MouseRegion(
                            onEnter: (event) =>
                                controller.featureHovering(true),
                            onExit: (event) =>
                                controller.featureHovering(false),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: p1.maxWidth * 0.01,
                              ),
                              child: MenuHover(
                                size: p1.maxWidth * 0.070,
                                menu: value.isFeatureHover,
                                callback: () => controller.scrollToSection(
                                    scrollController, 930),
                                menuName: "Feature",
                                pixels: pixels,
                                startPosition: 584,
                                endPosition: 2549,
                              ),
                            )),
                        MouseRegion(
                            onEnter: (event) =>
                                controller.previewHovering(true),
                            onExit: (event) =>
                                controller.previewHovering(false),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: p1.maxWidth * 0.01,
                              ),
                              child: MenuHover(
                                size: p1.maxWidth * 0.16,
                                menu: value.isPreviewHover,
                                callback: () => controller.scrollToSection(
                                    scrollController, 2966),
                                menuName: "Benefit to Hotel",
                                pixels: pixels,
                                startPosition: 2910,
                                endPosition: 3108,
                              ),
                            )),
                        MouseRegion(
                            onEnter: (event) => controller.reportHovering(true),
                            onExit: (event) => controller.reportHovering(false),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: p1.maxWidth * 0.01),
                              child: MenuHover(
                                size: p1.maxWidth * 0.070,
                                menu: value.isReportHover,
                                callback: () => controller.scrollToSection(
                                    scrollController, 3559),
                                menuName: "Preview",
                                pixels: pixels,
                                startPosition: 3108,
                                endPosition: 3712,
                              ),
                            )),
                        MouseRegion(
                            onEnter: (event) =>
                                controller.benefitToHotelHovering(true),
                            onExit: (event) =>
                                controller.benefitToHotelHovering(false),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: p1.maxWidth * 0.01),
                              child: MenuHover(
                                size: p1.maxWidth * 0.18,
                                menu: value.isBenefit,
                                callback: () => controller.scrollToSection(
                                    scrollController, 4324),
                                menuName: "Dashboard and Report",
                                pixels: pixels,
                                startPosition: 3712,
                                endPosition: 4393,
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              )),
    );
  }
}
