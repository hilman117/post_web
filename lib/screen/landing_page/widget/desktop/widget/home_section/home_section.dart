import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/screen/landing_page/controller/home_section_controller.dart';
import 'package:post_web/other.dart';
import 'package:provider/provider.dart';

class HomeSection extends StatelessWidget {
  final ScrollController scrollController;
  const HomeSection({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Consumer<HomeSectionController>(
        builder: (context, value, child) => Stack(
          children: [
            Container(
              // color: ,
              height: 750,
              width: size.width,
              color: mainColor,
              child: LayoutBuilder(
                builder: (p0, p1) => Image.asset("image/wavetop.png"),
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
              padding: const EdgeInsets.only(top: 100, left: 100, right: 100),
              child: SizedBox(
                width: size.width,
                child: LayoutBuilder(
                  builder: (p0, p1) => Row(
                    children: [
                      SizedBox(
                        width: p1.maxWidth * 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("UNDERSTANDING YOUR GUEST WITH",
                                style: GoogleFonts.poppins(
                                    fontSize: p1.maxWidth * 0.045,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xfff1f1f8))),
                            Row(
                              children: [
                                Text("FAST ",
                                    style: GoogleFonts.poppins(
                                        fontSize: p1.maxWidth * 0.045,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xfff1f1f8))),
                                AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        "SERVICE",
                                        textStyle: GoogleFonts.poppins(
                                            fontSize: p1.maxWidth * 0.045,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xfff1f1f8)),
                                      ),
                                      TyperAnimatedText("RESPONSE",
                                          textStyle: GoogleFonts.poppins(
                                              fontSize: p1.maxWidth * 0.045,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xfff1f1f8))),
                                      TyperAnimatedText("DELIVERY",
                                          textStyle: GoogleFonts.poppins(
                                              fontSize: p1.maxWidth * 0.045,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xfff1f1f8))),
                                    ])
                              ],
                            ),
                            Text(
                                "There is no hospitality like understanding your guest’s needs. Make their stay much more memorable with POST, a messaging system for service and maintenance requests in hotels and resorts.",
                                style: GoogleFonts.poppins(
                                    fontSize: p1.maxWidth * 0.015,
                                    height: 1.5,
                                    color: const Color(0xfff1f1f8))),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                                "Post connects different departments for faster guest service and better maintenance operations",
                                style: GoogleFonts.poppins(
                                    fontSize: p1.maxWidth * 0.015,
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
                                      width: p1.maxWidth * 0.2,
                                    )),
                                SizedBox(
                                  width: p1.maxWidth * 0.030,
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                      "image/Google.png",
                                      width: p1.maxWidth * 0.2,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Image.asset("image/mokap.png", width: p1.maxWidth * 0.4)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
