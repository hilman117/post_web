import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/screen/landing_page/controller/home_section_controller.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/register_login_button.dart';
import 'package:post_web/other.dart';
import 'package:provider/provider.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<HomeSectionController>(context, listen: false);
    return Consumer<HomeSectionController>(
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 200),
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
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Home",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.white,
                                  height: 1.5),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Feature",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.white,
                                  height: 1.5),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Preview",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.white,
                                  height: 1.5),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Dashboard & Report",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.white,
                                  height: 1.5),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Download Now",
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
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
                                  width: 30,
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  "image/Google.png",
                                  width: 30,
                                )),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Register",
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            MouseRegion(
                                onEnter: (event) {},
                                onExit: (event) =>
                                    controller.registerButtonHovering(true),
                                child: RegisterLoginButton(
                                    callback: () {},
                                    buttonName: "Register Now",
                                    iconData: Icons.whatsapp_rounded,
                                    isHover: value.isRegisterButtonHover))
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
          ],
        ),
      ),
    );
  }
}
