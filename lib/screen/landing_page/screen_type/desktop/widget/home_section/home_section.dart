import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/screen/landing_page/controller/home_section_controller.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/home_section/widget/menu_hover.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/register_login_button.dart';
import 'package:post_web/other.dart';
import 'package:provider/provider.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<HomeSectionController>(context, listen: false);
    return Consumer<HomeSectionController>(
      builder: (context, value, child) => Stack(
        children: [
          Container(
            // color: ,
            height: 750,
            width: double.infinity,
            color: mainColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 70),
                    child: Row(
                      children: [
                        Image.asset(
                          "image/icon.png",
                          width: 70,
                          height: 70,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Post",
                          style: GoogleFonts.poppins(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            MouseRegion(
                                onEnter: (event) =>
                                    controller.homeHovering(true),
                                onExit: (event) =>
                                    controller.homeHovering(false),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: MenuHover(
                                      size: 60,
                                      menu: value.isHomeHover,
                                      callback: () {},
                                      menuName: "Home"),
                                )),
                            MouseRegion(
                                onEnter: (event) =>
                                    controller.featureHovering(true),
                                onExit: (event) =>
                                    controller.featureHovering(false),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: MenuHover(
                                      size: 60,
                                      menu: value.isFeatureHover,
                                      callback: () {},
                                      menuName: "Feature"),
                                )),
                            MouseRegion(
                                onEnter: (event) =>
                                    controller.previewHovering(true),
                                onExit: (event) =>
                                    controller.previewHovering(false),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: MenuHover(
                                      size: 60,
                                      menu: value.isPreviewHover,
                                      callback: () {},
                                      menuName: "Preview"),
                                )),
                            MouseRegion(
                                onEnter: (event) =>
                                    controller.reportHovering(true),
                                onExit: (event) =>
                                    controller.reportHovering(false),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: MenuHover(
                                      size: 150,
                                      menu: value.isReportHover,
                                      callback: () {},
                                      menuName: "Dashboard & Report"),
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
                                  isHover: value.isRegisterButtonHover),
                            ),
                            const SizedBox(
                              width: 15,
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
                                    isHover: value.isLoginButtonHover))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Image.asset("image/wavetop.png"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 780),
            child: Image.asset("image/shadowwave.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 750),
            child: Image.asset("image/wavedown.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200, left: 100, right: 100),
            child: Row(
              children: [
                SizedBox(
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("UNDERSTANDING YOUR GUEST WITH",
                          style: GoogleFonts.poppins(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xfff1f1f8))),
                      Row(
                        children: [
                          Text("FAST ",
                              style: GoogleFonts.poppins(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xfff1f1f8))),
                          AnimatedTextKit(repeatForever: true, animatedTexts: [
                            TyperAnimatedText(
                              "SERVICE",
                              textStyle: GoogleFonts.poppins(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xfff1f1f8)),
                            ),
                            TyperAnimatedText("RESPONSE",
                                textStyle: GoogleFonts.poppins(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xfff1f1f8))),
                            TyperAnimatedText("DELIVERY",
                                textStyle: GoogleFonts.poppins(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xfff1f1f8))),
                          ])
                        ],
                      ),
                      Text(
                          "There is no hospitality like understanding your guest’s needs. Make their stay much more memorable with POST, a messaging system for service and maintenance requests in hotels and resorts.",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              height: 1.5,
                              color: const Color(0xfff1f1f8))),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                          "Post connects different departments for faster guest service and better maintenance operations",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              height: 1.5,
                              color: const Color(0xfff1f1f8))),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "image/apple.png",
                                width: 200,
                              )),
                          const SizedBox(
                            width: 30,
                          ),
                          InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "image/Google.png",
                                width: 200,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Image.asset("image/mokap.png", width: 500)
              ],
            ),
          )
        ],
      ),
    );
  }
}
