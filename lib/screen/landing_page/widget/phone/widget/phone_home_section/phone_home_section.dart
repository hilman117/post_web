import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/landing_page/landing_page_controller.dart';
import 'package:provider/provider.dart';

class PhoneHomeSection extends StatelessWidget {
  const PhoneHomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        child: LayoutBuilder(
            builder: (p0, p1) => Consumer<LandingPageController>(
                  builder: (context, value, child) => Stack(
                    children: [
                      SizedBox(
                        height: 600,
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,

                              // color: ,
                              height: 400,
                              width: size.width,
                              color: mainColor,
                              child: Image.asset("images/wavetop.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 400),
                              child: Image.asset("images/shadowwave.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 370),
                              child: Image.asset("images/wavedown.png"),
                            ),
                            Positioned(
                              left: 20,
                              right: 20,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: SizedBox(
                                  width: size.width,
                                  child: SizedBox(
                                    width: p1.maxWidth * 0.8,
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
                                                  "images/apple.png",
                                                  width: p1.maxWidth * 0.2,
                                                )),
                                            SizedBox(
                                              width: p1.maxWidth * 0.030,
                                            ),
                                            InkWell(
                                                onTap: () {},
                                                child: Image.asset(
                                                  "images/Google.png",
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
                          top: 325,
                          left: p1.maxWidth * 0.30,
                          child: Image.asset("images/mokap.png",
                              width: p1.maxWidth * 0.4)),
                    ],
                  ),
                )));
  }
}
