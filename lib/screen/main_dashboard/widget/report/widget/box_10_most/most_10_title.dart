import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/const.dart';
import 'package:post_web/style.dart';

Widget most10Title(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return Container(
      height: size.height * 0.3,
      width: size.width * 0.4,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                blurRadius: 2, offset: Offset(1.0, 1.0), color: Colors.grey)
          ]),
      child: LayoutBuilder(
        builder: (p0, p1) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: p1.maxHeight * 0.03,
                ),
                Text(
                  "10 Judul Terbanyak",
                  style: GoogleFonts.sarabun(
                      fontSize: p1.maxWidth * 0.024,
                      fontWeight: FontWeight.bold,
                      color: mainColor),
                ),
              ],
            ),
            SizedBox(
              height: p1.maxHeight * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: p1.maxWidth * 0.013),
              child: Container(
                color: secondaryColor.withOpacity(0.1),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: {
                    0: FlexColumnWidth(p1.maxWidth * 0.006),
                    3: FlexColumnWidth(p1.maxWidth * 0.003),
                    4: FlexColumnWidth(p1.maxWidth * 0.003),
                  },
                  border: TableBorder.all(color: mainColor.withOpacity(0.2)),
                  children: [header(headerCell, p1)],
                ),
              ),
            ),
            SizedBox(
              height: p1.maxHeight * 0.01,
            ),
            SizedBox(
              height: p1.maxHeight * 0.7,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: p1.maxWidth * 0.013),
                  child: Container(
                    color: Colors.white,
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: {
                        0: FlexColumnWidth(p1.maxWidth * 0.006),
                        3: FlexColumnWidth(p1.maxWidth * 0.003),
                        4: FlexColumnWidth(p1.maxWidth * 0.003),
                      },
                      border:
                          TableBorder.all(color: mainColor.withOpacity(0.2)),
                      children: List.generate(
                          listTable.length, (index) => listTable[index]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ));
}

TableRow header(List<String> cells, BoxConstraints p1) => TableRow(
    children: cells
        .map((cell) => Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: p1.maxWidth * 0.013,
                    vertical: p1.maxWidth * 0.013),
                child: Text(
                  cell,
                  style: style11Normal,
                  textAlign: TextAlign.center,
                ),
              ),
            ))
        .toList());

TableRow buildCell(List<String> cells) => TableRow(
    children: cells
        .map((cell) => Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                child: Text(
                  cell,
                  style: style11Normal,
                  textAlign: TextAlign.center,
                ),
              ),
            ))
        .toList());

List<String> headerCell = [
  "Judul Request",
  "Jml",
  "Ditutup",
  "Waktu Resolusi",
  "Rate Resolution"
];

List<TableRow> listTable = [
  buildCell(
    [
      "(Luggage) Pick Up From  Room",
      "23820",
      "23820",
      "11 h",
      "100.00%",
    ],
  ),
  buildCell(
    [
      "(service)) Make Up Room",
      "22323",
      "22317",
      "13 h 16m",
      "99.97%",
    ],
  ),
  buildCell(
    [
      "New room Service Order",
      "18326",
      "18323",
      "1h 26m",
      "99.98%",
    ],
  ),
  buildCell(
    [
      "Mineral Water",
      "17717",
      "17717",
      "17m",
      "100.00%",
    ],
  ),
  buildCell(
    [
      "(Luggage) Pick Up From  Room",
      "23820",
      "23820",
      "11 h",
      "100.00%",
    ],
  ),
  buildCell(
    [
      "Butler Assistance",
      "9077",
      "9077",
      "2h 12m",
      "100.00%",
    ],
  ),
  buildCell(
    [
      "-Other Request (Please Specify)-",
      "8865",
      "8865",
      "11 h",
      "99.97%",
    ],
  ),
  buildCell(
    [
      "(Luggage) Pick Up From  Room",
      "23820",
      "23820",
      "11 h",
      "100.00%",
    ],
  ),
  buildCell(
    [
      "(Luggage) Deliver to Room",
      "8490",
      "8490",
      "15m",
      "100.00%",
    ],
  ),
  buildCell(
    [
      "(Luggage) Pick Up From  Room",
      "23820",
      "23820",
      "11 h",
      "100.00%",
    ],
  ),
];
