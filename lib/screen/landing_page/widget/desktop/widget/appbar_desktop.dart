import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/screen/landing_page/controller/landing_page_controller.dart';
import 'package:provider/provider.dart';

import '../../../widget/menu_hover.dart';
import '../../../widget/register_login_button.dart';

class AppBarDesktop extends StatelessWidget {
  const AppBarDesktop({
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
                      "image/icon.png",
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
                              size: p1.maxWidth * 0.055,
                              menu: value.isHomeHover,
                              callback: () => controller.scrollToSection(
                                  scrollController, 0),
                              menuName: "Home",
                              pixels: pixels,
                              startPosition: 0,
                              endPosition: 653,
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
                                size: p1.maxWidth * 0.055,
                                menu: value.isFeatureHover,
                                callback: () => controller.scrollToSection(
                                    scrollController, 1064),
                                menuName: "Feature",
                                pixels: pixels,
                                startPosition: 653,
                                endPosition: 1373,
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
                                size: p1.maxWidth * 0.1,
                                menu: value.isPreviewHover,
                                callback: () => controller.scrollToSection(
                                    scrollController, 1697),
                                menuName: "Benefit to Hotel",
                                pixels: pixels,
                                startPosition: 1373,
                                endPosition: 1963,
                              ),
                            )),
                        MouseRegion(
                            onEnter: (event) => controller.reportHovering(true),
                            onExit: (event) => controller.reportHovering(false),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: p1.maxWidth * 0.01),
                              child: MenuHover(
                                size: p1.maxWidth * 0.055,
                                menu: value.isReportHover,
                                callback: () => controller.scrollToSection(
                                    scrollController, 2316),
                                menuName: "Preview",
                                pixels: pixels,
                                startPosition: 1963,
                                endPosition: 2731,
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
                                size: p1.maxWidth * 0.15,
                                menu: value.isBenefit,
                                callback: () => controller.scrollToSection(
                                    scrollController, 3104),
                                menuName: "Dashboard and Report",
                                pixels: pixels,
                                startPosition: 2731,
                                endPosition: 4000,
                              ),
                            )),
                        MouseRegion(
                          onEnter: (event) =>
                              controller.registerButtonHovering(true),
                          onExit: (event) =>
                              controller.registerButtonHovering(false),
                          child: RegisterLoginButton(
                            callback: () {},
                            buttonName: "Register now",
                            iconData: Icons.whatsapp_rounded,
                            isHover: value.isRegisterButtonHover,
                            width: p1,
                          ),
                        ),
                        SizedBox(
                          width: p1.maxWidth * 0.01,
                        ),
                        MouseRegion(
                            onEnter: (event) =>
                                controller.loginButtonHovering(true),
                            onExit: (event) =>
                                controller.loginButtonHovering(false),
                            child: RegisterLoginButton(
                              callback: () {},
                              buttonName: "User login",
                              iconData: Icons.login_rounded,
                              isHover: value.isLoginButtonHover,
                              width: p1,
                            ))
                      ],
                    )
                  ],
                ),
              )),
    );
  }
}
