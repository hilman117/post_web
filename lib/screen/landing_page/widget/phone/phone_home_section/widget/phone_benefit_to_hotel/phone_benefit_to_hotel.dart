import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widget/benefit_tab.dart';

class PhoneBenefitToHotel extends StatelessWidget {
  final int pixels;
  const PhoneBenefitToHotel({Key? key, required this.pixels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: LayoutBuilder(
          builder: (p0, p1) => Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              AnimatedPadding(
                duration: const Duration(milliseconds: 500),
                padding: EdgeInsets.only(top: pixels > 1564 ? 0 : 150),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: pixels > 1564 ? 1 : 0,
                  child: Text("Benefit to hotel",
                      style: GoogleFonts.poppins(
                          fontSize: p1.maxWidth * 0.035,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff333333))),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              BenefitTablet(
                pixels: pixels,
              )
            ],
          ),
        ));
  }
}
