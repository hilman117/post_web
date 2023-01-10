import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widget/benefit_tab.dart';

class BenefitToHotelTablet extends StatelessWidget {
  final int pixels;
  const BenefitToHotelTablet({Key? key, required this.pixels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text("Benefit to hotel",
              style: GoogleFonts.poppins(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff333333))),
          const SizedBox(
            height: 30,
          ),
          BenefitTablet(
            pixels: pixels,
          )
        ],
      ),
    );
  }
}
