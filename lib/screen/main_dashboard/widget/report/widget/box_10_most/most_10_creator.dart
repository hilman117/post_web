import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/other.dart';
import 'package:post_web/style.dart';

class Most10Creator extends StatelessWidget {
  const Most10Creator({
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
                    "10 Pembuat Terbanyak",
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
                        // defaultVerticalAlignment:
                        //     TableCellVerticalAlignment.middle,
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
        .map((cell) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Text(
                cell,
                style: GoogleFonts.sarabun(
                  fontSize: 12,
                ),
                textAlign: TextAlign.left,
              ),
            ))
        .toList());

List<String> headerCell = [
  "Pengguna",
  "Jml",
];

List<TableRow> listTable = [
  buildCell(
    [
      "Hilman Ramdhani",
      "23820",
    ],
  ),
  buildCell(
    [
      "Abdul Mahmud",
      "22323",
    ],
  ),
  buildCell(
    [
      "Maman Abdurrahman",
      "18326",
    ],
  ),
  buildCell(
    [
      "Bambang Pamungkas",
      "17717",
    ],
  ),
  buildCell(
    [
      "Cristiano Ronaldo",
      "23820",
    ],
  ),
  buildCell(
    [
      "Muhadi",
      "9077",
    ],
  ),
  buildCell(
    [
      "Saepul Mahdum",
      "8865",
    ],
  ),
  buildCell(
    [
      "Suhel Muhammad Suhel",
      "23820",
    ],
  ),
  buildCell(
    [
      "Jepri T-rex",
      "8490",
    ],
  ),
  buildCell(
    [
      "Brontosaurus Sahdun",
      "23820",
    ],
  ),
];
