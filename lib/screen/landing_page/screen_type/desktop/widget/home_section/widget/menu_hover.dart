import 'package:flutter/material.dart';

class MenuHover extends StatelessWidget {
  final double size;
  final double pixels;
  final double startPosition;
  final double endPosition;
  final bool menu;
  final VoidCallback callback;
  final String menuName;
  const MenuHover(
      {Key? key,
      required this.size,
      required this.menu,
      required this.callback,
      required this.menuName,
      required this.pixels,
      required this.startPosition,
      required this.endPosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: SizedBox(
        width: size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(menuName,
                style: TextStyle(
                    color: (menu == true)
                        ? Colors.white
                        : (pixels > startPosition && endPosition > pixels)
                            ? Colors.blue
                            : (pixels > endPosition && startPosition > pixels)
                                ? Colors.white
                                : Colors.black54,
                    fontSize: 13)),
            const SizedBox(
              height: 5,
            ),
            AnimatedPadding(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.only(
                  right: (menu == true)
                      ? 0
                      : (pixels > startPosition && endPosition > pixels)
                          ? 0
                          : (pixels > endPosition && startPosition > pixels)
                              ? 0
                              : size),
              child: Container(
                color: (pixels > 95)
                    ? Colors.blue
                    : (pixels > startPosition && endPosition > pixels)
                        ? Colors.blue
                        : (pixels > endPosition && startPosition > pixels)
                            ? Colors.blue
                            : Colors.white,
                height: 2,
                width: size,
              ),
            )
          ],
        ),
      ),
    );
  }
}
