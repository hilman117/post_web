import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/const.dart';
import 'package:post_web/style.dart';

class Most10Location extends StatelessWidget {
  const Most10Location({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                    "10 Lokasi Terbanyak",
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
                  style: GoogleFonts.sarabun(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ))
        .toList());

List<String> headerCell = [
  "Lokasi Request",
  "Jml",
  "Ditutup",
  "Waktu Resolusi",
  "Rate Resolution"
];

List<TableRow> listTable = [
  buildCell(
    [
      "1021 Rasamala",
      "2223",
      "2220",
      "4h 57m",
      "99.87%",
    ],
  ),
  buildCell(
    [
      "1011 V13 Mahoni",
      "2029",
      "2029",
      "2h 28m",
      "100.00%",
    ],
  ),
  buildCell(
    [
      "1002 V13 Angsana",
      "1938",
      "1938",
      "2h 12m",
      "100.00%",
    ],
  ),
  buildCell(
    [
      "1003 V13 Bengkirai",
      "1897",
      "1897",
      "2h 18m",
      "2h 18m",
    ],
  ),
  buildCell(
    [
      "1001 V13 Akasia",
      "1784",
      "1784",
      "2h 59m",
      "100.00%",
    ],
  ),
  buildCell(
    [
      "1005 V12 Merantai",
      "1696",
      "1696",
      "1h 59m",
      "99.97%",
    ],
  ),
  buildCell(
    [
      "1015 V19 Trembesi",
      "1654",
      "1654",
      "2h 27m",
      "100.00%",
    ],
  ),
  buildCell(
    [
      "2601",
      "23821",
      "23820",
      "20 mnt",
      "100.00%",
    ],
  ),
  buildCell(
    [
      "4506",
      "8490",
      "8490",
      "15m",
      "100.00%",
    ],
  ),
  buildCell(
    [
      "9807",
      "23820",
      "23820",
      "11 mnt",
      "100.00%",
    ],
  ),
];
