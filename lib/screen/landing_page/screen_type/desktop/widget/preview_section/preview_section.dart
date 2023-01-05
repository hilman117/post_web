import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PreviewSection extends StatelessWidget {
  const PreviewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
        child: Column(
          children: [
            Text("PREVIEW",
                style: GoogleFonts.poppins(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff333333))),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Communicate easily across every department while on the go, Monitor your property from anywhere, on any device",
              style: GoogleFonts.poppins(
                  fontSize: 15, color: const Color(0xff333333), height: 1.5),
              textAlign: TextAlign.right,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                height: 500,
                width: 700,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("image/videomage.jpg"),
                        fit: BoxFit.cover)),
                child: Lottie.asset("image/play.json", width: 82)),
          ],
        ),
      ),
    );
  }
}
