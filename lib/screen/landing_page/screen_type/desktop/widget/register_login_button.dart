import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/screen/landing_page/controller/home_section_controller.dart';
import 'package:provider/provider.dart';

class RegisterLoginButton extends StatelessWidget {
  final VoidCallback callback;
  final String buttonName;
  final IconData iconData;
  final bool isHover;
  final BoxConstraints width;
  const RegisterLoginButton(
      {Key? key,
      required this.callback,
      required this.buttonName,
      required this.iconData,
      required this.isHover,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeSectionController>(
      builder: (context, value, child) => InkWell(
        onTap: callback,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutSine,
          alignment: Alignment.center,
          width: width.maxWidth * 0.1,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white, width: 2),
              color: isHover ? Colors.white : const Color(0xff3152D9)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width.maxWidth * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  iconData,
                  size: width.maxWidth * 0.01,
                  color: isHover ? const Color(0xff3152D9) : Colors.white,
                ),
                Text(buttonName,
                    style: GoogleFonts.poppins(
                      fontSize: width.maxWidth * 0.01,
                      color: isHover ? const Color(0xff3152D9) : Colors.white,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
