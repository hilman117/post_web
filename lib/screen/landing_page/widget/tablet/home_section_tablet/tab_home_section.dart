import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/other.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_section_controller.dart';

class TabHomeSection extends StatelessWidget {
  const TabHomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        child: LayoutBuilder(
            builder: (p0, p1) => Consumer<HomeSectionController>(
                  builder: (context, value, child) => Stack(
                    children: [
                      SizedBox(
                        height: 920,
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,

                              // color: ,
                              height: 600,
                              width: size.width,
                              color: mainColor,
                              child: Image.asset("image/wavetop.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 600),
                              child: Image.asset("image/shadowwave.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 570),
                              child: Image.asset("image/wavedown.png"),
                            ),
                            Positioned(
                              left: 20,
                              right: 20,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 50, left: 50, right: 50),
                                child: SizedBox(
                                  width: size.width,
                                  child: SizedBox(
                                    width: p1.maxWidth * 0.50,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                            "UNDERSTANDING YOUR GUEST WITH FAST ",
                                            style: GoogleFonts.poppins(
                                                fontSize: p1.maxWidth * 0.040,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    const Color(0xfff1f1f8))),
                                        AnimatedTextKit(
                                            repeatForever: true,
                                            animatedTexts: [
                                              TyperAnimatedText(
                                                "SERVICE",
                                                textStyle: GoogleFonts.poppins(
                                                    fontSize:
                                                        p1.maxWidth * 0.040,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color(
                                                        0xfff1f1f8)),
                                              ),
                                              TyperAnimatedText("RESPONSE",
                                                  textStyle:
                                                      GoogleFonts.poppins(
                                                          fontSize:
                                                              p1.maxWidth *
                                                                  0.040,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: const Color(
                                                              0xfff1f1f8))),
                                              TyperAnimatedText("DELIVERY",
                                                  textStyle:
                                                      GoogleFonts.poppins(
                                                          fontSize:
                                                              p1.maxWidth *
                                                                  0.040,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: const Color(
                                                              0xfff1f1f8))),
                                            ]),
                                        Text(
                                          "There is no hospitality like understanding your guest’s needs. Make their stay much more memorable with POST, a messaging system for service and maintenance requests in hotels and resorts.",
                                          style: GoogleFonts.poppins(
                                              fontSize: p1.maxWidth * 0.025,
                                              height: 1.5,
                                              color: const Color(0xfff1f1f8)),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          "Post connects different departments for faster guest service and better maintenance operations",
                                          style: GoogleFonts.poppins(
                                              fontSize: p1.maxWidth * 0.025,
                                              height: 1.5,
                                              color: const Color(0xfff1f1f8)),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: 500,
                          left: p1.maxWidth * 0.33,
                          child: Image.asset("image/mokap.png",
                              width: p1.maxWidth * 0.4)),
                    ],
                  ),
                )));
  }
}
