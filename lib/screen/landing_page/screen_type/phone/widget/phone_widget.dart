// import 'package:flutter/material.dart';
// import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:post_web/screen/my_app/screen_size/desktop_widget.dart';

// Widget whiteBox() {
//   return Container(
//     width: 320,
//     color: Colors.white,
//     child: Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "A POWERFULL APP MAKES FASTER OPERATIONAL",
//             style: GoogleFonts.josefinSans(
//                 color: const Color(0xff5956E9),
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 height: 1.5),
//           ),
//           Text(
//             introText,
//             style: GoogleFonts.josefinSans(
//               fontSize: 13,
//               height: 1.5,
//             ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           Text(
//             "DONWLOAD NOW",
//             style: GoogleFonts.josefinSans(
//                 fontSize: 18,
//                 color: const Color(0xff232233),
//                 fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             children: [
//               Image.asset(
//                 "image/android.jpg",
//                 width: 100,
//               ),
//               const SizedBox(
//                 width: 14,
//               ),
//               Image.asset(
//                 "image/appstore.jpg",
//                 width: 100,
//               ),
//             ],
//           )
//         ],
//       ),
//     ),
//   );
// }

// Widget overviewPhone() {
//   return Container(
//     height: 500,
//     width: double.infinity,
//     decoration: const BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage("image/bg.png"), fit: BoxFit.cover)),
//     // child: Padding(
//     //   padding: const EdgeInsets.symmetric(horizontal: 20),
//     //   child: Column(
//     //     children: [
//     //       Padding(
//     //         padding: const EdgeInsets.only(bottom: 20, top: 500),
//     //         child: Image.asset(
//     //           "image/iphone.png",
//     //           width: 200,
//     //         ),
//     //       )
//     //     ],
//     //   ),
//     // ),
//   );
// }

// Widget featurePointPhone(String title, String descrip, TextAlign textAlign,
//     CrossAxisAlignment crossAxisAlignment) {
//   return Column(
//     crossAxisAlignment: crossAxisAlignment,
//     children: [
//       Container(
//         height: 15,
//         width: 15,
//         decoration: BoxDecoration(
//             color: Colors.blue.shade900,
//             borderRadius: BorderRadius.circular(2)),
//       ),
//       const SizedBox(
//         height: 5,
//       ),
//       Container(
//         width: 200,
//         child: Text(
//           title,
//           style: GoogleFonts.josefinSans(
//               color: Colors.blue.shade900,
//               fontSize: 18,
//               fontWeight: FontWeight.bold),
//           textAlign: textAlign,
//           overflow: TextOverflow.clip,
//         ),
//       ),
//       SizedBox(
//         width: 340,
//         child: Text(
//           descrip,
//           style: GoogleFonts.josefinSans(
//               fontSize: 16, fontWeight: FontWeight.w300, height: 1.5),
//           textAlign: textAlign,
//           overflow: TextOverflow.clip,
//         ),
//       ),
//     ],
//   );
// }

// Widget featurePagePhone(Callback callback, IconData iconData) {
//   return Container(
//     width: double.infinity,
//     color: Colors.white,
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 30,
//           ),
//           Text(
//             "App Features",
//             style: GoogleFonts.josefinSans(
//                 fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 18,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: SizedBox(
//               width: double.infinity,
//               child: Text(
//                 "Post connects different departments for faster guest service and better maintenance operations",
//                 style: GoogleFonts.josefinSans(fontSize: 18),
//                 overflow: TextOverflow.clip,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           SizedBox(
//             width: double.infinity,
//             child: featurePointPhone(
//                 "Auto - Dispatch Request",
//                 "Auto-dispatch system automatically sends a request to the right department",
//                 TextAlign.end,
//                 CrossAxisAlignment.end),
//           ),
//           const SizedBox(
//             height: 50,
//           ),
//           SizedBox(
//             width: double.infinity,
//             child: featurePointPhone(
//                 "Hotel Internal Messaging System",
//                 "Cross-department communication makes problem-solving more efficient.",
//                 TextAlign.end,
//                 CrossAxisAlignment.end),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Image.asset(
//             "image/iphone.png",
//             width: 200,
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           SizedBox(
//             width: double.infinity,
//             child: featurePointPhone(
//                 "Department - Specific Workflow",
//                 "Customizable view with daily tasks makes sure nothing goes unfinished.",
//                 TextAlign.start,
//                 CrossAxisAlignment.start),
//           ),
//           const SizedBox(height: 50),
//           SizedBox(
//             width: double.infinity,
//             child: featurePointPhone(
//                 "Reports",
//                 "Request analysis for a better understanding of common issues.",
//                 TextAlign.start,
//                 CrossAxisAlignment.start),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           InkWell(
//               onTap: callback,
//               child: OnHoverSeeAllFeature(
//                 child: downloadButton("See All Feature", 200, 45),
//               ))
//         ],
//       ),
//     ),
//   );
// }

// Widget allFeaturePointPoint(String title, String descrip, TextAlign textAlign,
//     CrossAxisAlignment crossAxisAlignment) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Container(
//         height: 15,
//         width: 15,
//         decoration: BoxDecoration(
//             color: Colors.blue, borderRadius: BorderRadius.circular(2)),
//       ),
//       Text(
//         title,
//         style: GoogleFonts.josefinSans(
//             color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
//         textAlign: textAlign,
//         overflow: TextOverflow.clip,
//       ),
//       Text(
//         descrip,
//         style: GoogleFonts.josefinSans(
//             color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
//         textAlign: textAlign,
//         overflow: TextOverflow.clip,
//       ),
//     ],
//   );
// }

// Widget allFeaturePhone(bool x) {
//   return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 1000),
//       switchInCurve: Curves.bounceIn,
//       switchOutCurve: Curves.bounceOut,
//       child: x == true
//           ? Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage("image/bg.png"), fit: BoxFit.cover)),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Text("Other Features",
//                         style: GoogleFonts.josefinSans(
//                             fontSize: 22,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold)),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           width: 150,
//                           child: allFeaturePointPoint(
//                             "",
//                             "Automated dispatching workflows that automatically assign each ticket to the correct person.",
//                             TextAlign.start,
//                             CrossAxisAlignment.start,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 150,
//                           child: allFeaturePointPoint(
//                               "",
//                               "Track every single request, regardless of how it comes in.",
//                               TextAlign.start,
//                               CrossAxisAlignment.start),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 30),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           width: 150,
//                           child: allFeaturePointPoint(
//                               "",
//                               "Add internal notes for easy message relaying.",
//                               TextAlign.start,
//                               CrossAxisAlignment.start),
//                         ),
//                         SizedBox(
//                           width: 150,
//                           child: allFeaturePointPoint(
//                             "",
//                             "Allow your staff to enter tickets / work orders from anywhere",
//                             TextAlign.start,
//                             CrossAxisAlignment.start,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 30),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           width: 150,
//                           child: allFeaturePointPoint(
//                               "",
//                               "Push message notifications.",
//                               TextAlign.start,
//                               CrossAxisAlignment.start),
//                         ),
//                         SizedBox(
//                           width: 150,
//                           child: allFeaturePointPoint("", "10+ language.",
//                               TextAlign.start, CrossAxisAlignment.start),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 30),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           width: 150,
//                           child: allFeaturePointPoint(
//                             "",
//                             "Custom workflows that map your unique business processes",
//                             TextAlign.start,
//                             CrossAxisAlignment.start,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 150,
//                           child: allFeaturePointPoint(
//                               "",
//                               "Every department, one system, full transparency.",
//                               TextAlign.start,
//                               CrossAxisAlignment.start),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 30),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 150,
//                           child: allFeaturePointPoint("", "Real time chat",
//                               TextAlign.start, CrossAxisAlignment.start),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           : const Text(""));
// }

// Widget benefitPointPhone(String image, String title, String descrip) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       // ignore: unnecessary_brace_in_string_interps
//       Image.asset("image/${image}.png", width: 30),
//       const SizedBox(height: 20),
//       Row(
//         children: [
//           Container(
//             height: 20,
//             width: 20,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadiusDirectional.circular(5)),
//           ),
//           const SizedBox(width: 10),
//           SizedBox(
//             width: 200,
//             child: Text(
//               title,
//               style: GoogleFonts.josefinSans(
//                   color: Colors.white,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//       const SizedBox(height: 15),
//       SizedBox(
//         width: 300,
//         child: Text(
//           descrip,
//           style: GoogleFonts.josefinSans(
//               fontWeight: FontWeight.w300,
//               color: Colors.white,
//               fontSize: 18,
//               height: 1.3),
//           overflow: TextOverflow.clip,
//         ),
//       )
//     ],
//   );
// }

// Widget benefitToHotelPhone() {
//   return Container(
//     width: double.infinity,
//     decoration: const BoxDecoration(color: Color(0xff6192AB)),
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//       child: Column(
//         children: [
//           Text("Benefits to Hotels",
//               style: GoogleFonts.josefinSans(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white)),
//           const SizedBox(height: 40),
//           benefitPointPhone("time", "Efficiency",
//               "Improved interaction across departments, increasing efficiency & accountability"),
//           const SizedBox(height: 40),
//           benefitPointPhone("group", "Mobile Staff",
//               "Access all work and requests being done on property in real time from any mobile device"),
//           const SizedBox(height: 40),
//           benefitPointPhone("message", "Communication",
//               "Communicate easily across every department while on the go"),
//           const SizedBox(height: 40),
//           benefitPointPhone("anywhere", "Access from Anywhere",
//               "Monitor your property from anywhere, on any device"),
//           const SizedBox(height: 40),
//           benefitPointPhone("user", "Unlimited User",
//               "Unlimited user that can registered under your property"),
//           const SizedBox(height: 40),
//           benefitPointPhone("ticket", "Ticket Management",
//               "Access all work and requests being done on property in real time from any mobile device"),
//         ],
//       ),
//     ),
//   );
// }

// Widget dashboardPhone() {
//   return Container(
//     width: double.infinity,
//     decoration: const BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage("image/bg.png"), fit: BoxFit.cover)),
//     child: Padding(
//       padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
//       child: Column(
//         children: [
//           Text("Dashboard & Reports",
//               style: GoogleFonts.josefinSans(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white)),
//           const SizedBox(height: 40),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Image.asset(
//                 "image/dashboard.png",
//                 width: 350,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: 20,
//                     width: 20,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadiusDirectional.circular(5)),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                       width: 300,
//                       child: Text(
//                           "Real time dashboards for operators to view pending and closed requests",
//                           style: GoogleFonts.josefinSans(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w300,
//                               fontSize: 22,
//                               height: 1.3)))
//                 ],
//               )
//             ],
//           ),
//           const SizedBox(height: 100),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Container(
//                     height: 20,
//                     width: 20,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadiusDirectional.circular(5)),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                       width: 300,
//                       child: Text(
//                         "Report shows analytics for request families, departments, location, etc",
//                         style: GoogleFonts.josefinSans(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w300,
//                             fontSize: 22,
//                             height: 1.3),
//                         textAlign: TextAlign.end,
//                         overflow: TextOverflow.clip,
//                       ))
//                 ],
//               ),
//               Image.asset(
//                 "image/report.png",
//                 width: 350,
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }
