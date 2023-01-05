import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RightPoint extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String imageIcon;
  const RightPoint(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.imageIcon,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageIcon,
          width: 60,
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            SizedBox(
              width: 300,
              child: Text(
                title,
                style: GoogleFonts.poppins(
                    fontSize: 20, color: color, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: 300,
              child: Text(
                subtitle,
                style: GoogleFonts.poppins(
                    fontSize: 12, color: const Color(0xff333333), height: 1.5),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
