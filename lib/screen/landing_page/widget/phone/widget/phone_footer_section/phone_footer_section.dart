import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:post_web/screen/landing_page/landing_page_controller.dart';
import 'package:post_web/screen/landing_page/widget/register_login_button.dart';
import 'package:post_web/other.dart';
import 'package:provider/provider.dart';

class PhoneFooterSection extends StatelessWidget {
  final ScrollController scrollController;
  const PhoneFooterSection({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<LandingPageController>(context, listen: false);
    return Consumer<LandingPageController>(
      builder: (context, value, child) => SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Image.asset("image/footerwave.png"),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [mainColor, Colors.blue.shade200])),
              child: LayoutBuilder(
                builder: (p0, p1) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Links",
                                style: GoogleFonts.poppins(
                                    fontSize: p1.maxWidth * 0.020,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.right,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () => controller.scrollToSection(
                                    scrollController, 0),
                                child: Text(
                                  "Home",
                                  style: GoogleFonts.poppins(
                                      fontSize: p1.maxWidth * 0.015,
                                      color: Colors.white,
                                      height: 1.5),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              InkWell(
                                onTap: () => controller.scrollToSection(
                                    scrollController, 930),
                                child: Text(
                                  "Feature",
                                  style: GoogleFonts.poppins(
                                      fontSize: p1.maxWidth * 0.015,
                                      color: Colors.white,
                                      height: 1.5),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              InkWell(
                                onTap: () => controller.scrollToSection(
                                    scrollController, 2966),
                                child: Text(
                                  "Benefit to Hotel",
                                  style: GoogleFonts.poppins(
                                      fontSize: p1.maxWidth * 0.015,
                                      color: Colors.white,
                                      height: 1.5),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              InkWell(
                                onTap: () => controller.scrollToSection(
                                    scrollController, 3559),
                                child: Text(
                                  "Preview",
                                  style: GoogleFonts.poppins(
                                      fontSize: p1.maxWidth * 0.015,
                                      color: Colors.white,
                                      height: 1.5),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              InkWell(
                                onTap: () => controller.scrollToSection(
                                    scrollController, 4324),
                                child: Text(
                                  "Dashboard & Report",
                                  style: GoogleFonts.poppins(
                                      fontSize: p1.maxWidth * 0.015,
                                      color: Colors.white,
                                      height: 1.5),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Download Now",
                                style: GoogleFonts.poppins(
                                    fontSize: p1.maxWidth * 0.020,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    "image/Apple.png",
                                    width: p1.maxWidth * 0.2,
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    "image/Google.png",
                                    width: p1.maxWidth * 0.2,
                                  )),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Register",
                                style: GoogleFonts.poppins(
                                    fontSize: p1.maxWidth * 0.025,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              MouseRegion(
                                  onEnter: (event) =>
                                      controller.registerButtonHovering(true),
                                  onExit: (event) =>
                                      controller.registerButtonHovering(false),
                                  child: RegisterLoginButton(
                                    callback: () {},
                                    buttonName: "Register now",
                                    iconData: Icons.phone_iphone_outlined,
                                    isHover: value.isRegisterButtonHover,
                                    width: p1,
                                  ))
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 2,
                        color: Colors.white60,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Theme by POST 2022",
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: Colors.white, height: 1.5),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
