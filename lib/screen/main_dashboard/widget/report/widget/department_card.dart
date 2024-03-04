// import 'package:flutter/material.dart';
// import 'package:post_web/const.dart';
// import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
// import 'package:provider/provider.dart';

// class DepartmentCard extends StatelessWidget {
//   const DepartmentCard(
//       {Key? key,
//       required this.department,
//       required this.totalOfRequest,
//       required this.percent,
//       required this.p1,
//       required this.index})
//       : super(key: key);
//   final String department;
//   final String totalOfRequest;
//   final String percent;
//   final BoxConstraints p1;
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     final controller = Provider.of<ReportController>(context, listen: false);
//     return Consumer<ReportController>(
//         builder: (context, value, child) => Container(
//             width: p1.maxWidth * 0.1,
//             height: p1.maxHeight,
//             margin: EdgeInsets.symmetric(horizontal: p1.maxWidth * 0.01),
//             padding: EdgeInsets.all(p1.maxWidth * 0.01),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: value.departmentIndexReport == index
//                     ? secondaryColor.withOpacity(0.1)
//                     : const Color(0xffF8FCFC),
//                 boxShadow: value.departmentIndexReport == index
//                     ? []
//                     : const [
//                         BoxShadow(
//                             blurRadius: 2,
//                             offset: Offset(1.0, 1.0),
//                             color: Colors.grey)
//                       ]),
//             child: InkWell(
//               onTap: () => controller.departmenReportSelected(index),
//               child: LayoutBuilder(
//                 builder: (p0, p2) => Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       totalOfRequest,
//                       style: TextStyle(
//                           fontSize: p2.maxWidth * 0.2,
//                           fontWeight: FontWeight.bold,
//                           color: mainColor),
//                     ),
//                     SizedBox(
//                       height: p2.maxHeight * 0.05,
//                     ),
//                     Text(
//                       department,
//                       style: TextStyle(
//                           fontSize: p2.maxWidth * 0.13,
//                           fontWeight: FontWeight.bold,
//                           color: mainColor),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     SizedBox(
//                       height: p2.maxHeight * 0.05,
//                     ),
//                     SizedBox(
//                       width: p2.maxWidth,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Text(
//                             "$percent%",
//                             style: TextStyle(
//                                 fontSize: p2.maxWidth * 0.10,
//                                 fontWeight: FontWeight.bold,
//                                 color: mainColor.withOpacity(0.2)),
//                           ),
//                           SizedBox(
//                             width: p2.maxWidth * 0.1,
//                           ),
//                           Text(
//                             "Closed",
//                             style: TextStyle(
//                                 fontSize: p2.maxWidth * 0.10,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.grey.shade300),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )));
//   }
// }
