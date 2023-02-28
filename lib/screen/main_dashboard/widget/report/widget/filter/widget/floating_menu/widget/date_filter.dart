import 'package:flutter/material.dart';

class DateFilter extends StatelessWidget {
  const DateFilter({Key? key, required this.p1}) : super(key: key);
  final BoxConstraints p1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: p1.maxWidth * 0.03, right: p1.maxWidth * 0.09),
              child: Text("Date",
                  style: TextStyle(
                      fontSize: p1.maxWidth * 0.03, color: Colors.black54)),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: p1.maxWidth * 0.2),
                height: p1.maxHeight * 0.17,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade400)),
                      child: SizedBox(
                        height: p1.maxHeight * 0.17,
                        width: p1.maxWidth * 0.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("12-04-2023",
                                style: TextStyle(
                                    fontSize: p1.maxWidth * 0.03,
                                    color: Colors.black54)),
                            const Icon(
                              Icons.date_range_outlined,
                              color: Colors.black45,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                    Text("-",
                        style: TextStyle(
                            fontSize: p1.maxWidth * 0.03,
                            color: Colors.black54)),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade400)),
                      child: SizedBox(
                        height: p1.maxHeight * 0.17,
                        width: p1.maxWidth * 0.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Today",
                                style: TextStyle(
                                    fontSize: p1.maxWidth * 0.03,
                                    color: Colors.black26)),
                            const Icon(
                              Icons.date_range_outlined,
                              color: Colors.black45,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Divider(
          endIndent: 15,
        ),
      ],
    );
  }
}
