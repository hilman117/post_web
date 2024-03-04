import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PhonePreviewSection extends StatelessWidget {
  const PhonePreviewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: LayoutBuilder(
          builder: (p0, p1) => Padding(
            padding: EdgeInsets.symmetric(horizontal: p1.maxWidth * 0.1),
            child: Column(
              children: [
                Text("PREVIEW",
                    style: GoogleFonts.poppins(
                        fontSize: p1.maxWidth * 0.035,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff333333))),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Communicate easily across every department while on the go, Monitor your property from anywhere, on any device",
                  style: GoogleFonts.poppins(
                      fontSize: p1.maxWidth * 0.030,
                      color: const Color(0xff333333),
                      height: 1.5),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    height: 400,
                    width: p1.maxWidth * 1,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/videomage.jpg"),
                            fit: BoxFit.cover)),
                    child: Lottie.asset("images/play.json",
                        width: p1.maxWidth * 0.050)),
              ],
            ),
          ),
        ));
  }
}
