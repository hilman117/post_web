import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/screen/landing_page/controller/home_section_controller.dart';
import 'package:provider/provider.dart';

class RegisterLoginButton extends StatelessWidget {
  final VoidCallback callback;
  final String buttonName;
  final IconData iconData;
  final bool isHover;
  const RegisterLoginButton(
      {Key? key,
      required this.callback,
      required this.buttonName,
      required this.iconData,
      required this.isHover})
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
          width: 150,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isHover ? 25 : 5),
              border: Border.all(color: Colors.white, width: 2),
              color: isHover ? Colors.white : const Color(0xff3152D9)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  iconData,
                  size: 20,
                  color: isHover ? const Color(0xff3152D9) : Colors.white,
                ),
                Text(buttonName,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
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
