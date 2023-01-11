import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Point extends StatelessWidget {
  final BoxConstraints size;
  final Color color;
  final String imageIcon;
  final String title;
  final String subtitle;
  const Point(
      {Key? key,
      required this.imageIcon,
      required this.title,
      required this.subtitle,
      required this.color,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imageIcon,
          width: size.maxWidth * 0.20,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: size.maxHeight * 0.20,
          child: Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: size.maxWidth * 0.030,
                color: color,
                fontWeight: FontWeight.bold),
            // textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: size.maxHeight * 0.20,
          child: Text(
            subtitle,
            style: GoogleFonts.poppins(
                fontSize: size.maxWidth * 0.025,
                color: const Color(0xff333333),
                height: 1.5),
            // textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
