import 'package:flutter/material.dart';

class CustomDrawe extends StatelessWidget {
  const CustomDrawe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          child: Image.asset("image/icon.png"),
        ),
        Container(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            height: size.height * 0.04,
            width: double.infinity,
            child: LayoutBuilder(
              builder: (p0, p1) => Text(
                "Home",
                style: TextStyle(fontSize: p1.maxWidth * 0.04),
              ),
            )),
        Container(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            height: size.height * 0.04,
            width: double.infinity,
            child: LayoutBuilder(
              builder: (p0, p1) => Text(
                "Feature",
                style: TextStyle(fontSize: p1.maxWidth * 0.04),
              ),
            )),
        Container(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            height: size.height * 0.04,
            width: double.infinity,
            child: LayoutBuilder(
              builder: (p0, p1) => Text(
                "Benefit to Hotel",
                style: TextStyle(fontSize: p1.maxWidth * 0.04),
              ),
            )),
        Container(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            height: size.height * 0.04,
            width: double.infinity,
            child: LayoutBuilder(
              builder: (p0, p1) => Text(
                "Preview",
                style: TextStyle(fontSize: p1.maxWidth * 0.04),
              ),
            )),
        Container(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            height: size.height * 0.04,
            width: double.infinity,
            child: LayoutBuilder(
              builder: (p0, p1) => Text(
                "Dasboard & Report",
                style: TextStyle(fontSize: p1.maxWidth * 0.04),
              ),
            )),
      ],
    );
  }
}
