import 'package:flutter/material.dart';

class MenuHover extends StatelessWidget {
  final double size;
  final bool menu;
  final VoidCallback callback;
  final String menuName;
  const MenuHover(
      {Key? key,
      required this.size,
      required this.menu,
      required this.callback,
      required this.menuName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: SizedBox(
        width: size,
        child: Column(
          children: [
            Text(menuName, style: const TextStyle(color: Color(0xfffce7e7))),
            const SizedBox(
              height: 5,
            ),
            AnimatedPadding(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.only(right: menu ? 0 : size),
              child: Container(
                color: Colors.white,
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
