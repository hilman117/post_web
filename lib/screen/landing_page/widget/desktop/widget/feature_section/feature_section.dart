import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widget/key_features.dart';

class FeatureSection extends StatelessWidget {
  final List<int> scrollExperience;
  final double pixels;
  const FeatureSection(
      {Key? key, required this.scrollExperience, required this.pixels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          Text("FEATURES",
              style: GoogleFonts.poppins(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff333333))),
          const SizedBox(
            height: 30,
          ),
          KeyFeatures(scrollExperience: scrollExperience, pixels: pixels),
        ],
      ),
    );
  }
}
