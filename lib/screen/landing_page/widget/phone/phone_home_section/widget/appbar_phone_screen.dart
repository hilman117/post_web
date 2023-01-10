import 'package:flutter/material.dart';
import 'package:post_web/other.dart';
import 'package:post_web/screen/landing_page/controller/home_section_controller.dart';
import 'package:provider/provider.dart';

class AppBarPhoneScreen extends StatelessWidget {
  const AppBarPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller =
        Provider.of<HomeSectionController>(context, listen: false);
    return Consumer<HomeSectionController>(
      builder: (context, value, child) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: size.width,
          height: 50,
          color: Colors.white,
          child: LayoutBuilder(
            builder: (p0, p1) => Row(
              children: [
                InkWell(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: Icon(
                    value.isCollapsing ? Icons.cancel : Icons.menu,
                    color: mainColor,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  "image/icon.png",
                  width: p1.maxWidth * 0.1,
                ),
                SizedBox(
                  width: p1.maxWidth * 0.05,
                ),
                const Text(
                  "Post",
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
              ],
            ),
          )),
    );
  }
}
