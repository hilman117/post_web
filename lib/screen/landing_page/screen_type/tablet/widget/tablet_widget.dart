// import 'package:flutter/material.dart';
// import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:post_web/screen/my_app/screen_size/desktop_widget.dart';

// class RowContactTab extends StatefulWidget {
//   const RowContactTab(
//       {Key? key, required this.scrollProsition, required this.screenSize})
//       : super(key: key);
//   final double scrollProsition;
//   final double screenSize;

//   @override
//   State<RowContactTab> createState() => _RowContactTabState();
// }

// class _RowContactTabState extends State<RowContactTab> {
//   @override
//   Widget build(BuildContext context) {
//     return widget.scrollProsition < widget.screenSize
//         ? Padding(
//             padding: const EdgeInsets.only(top: 25, bottom: 20),
//             child: SizedBox(
//               width: 668,
//               child: Row(
//                 children: [
//                   const Icon(
//                     Icons.email,
//                     color: Colors.white,
//                     size: 18,
//                   ),
//                   const SizedBox(
//                     width: 18,
//                   ),
//                   Text(
//                     "support@myemail.com",
//                     style: GoogleFonts.josefinSans(
//                         fontSize: 16, color: Colors.white),
//                   ),
//                   const SizedBox(width: 47),
//                   const Icon(
//                     Icons.phone,
//                     color: Colors.white,
//                     size: 18,
//                   ),
//                   const SizedBox(
//                     width: 18,
//                   ),
//                   Text(
//                     "(480) 555-0103",
//                     style: GoogleFonts.josefinSans(
//                         fontSize: 16, color: Colors.white),
//                   ),
//                   const Spacer(),
//                   SizedBox(
//                     height: 18,
//                     width: 162,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Image.asset(
//                           "image/facebook.png",
//                           width: 18,
//                         ),
//                         Image.asset(
//                           "image/twitter.png",
//                           width: 18,
//                         ),
//                         Image.asset(
//                           "image/instagram (1).png",
//                           width: 18,
//                         ),
//                         Image.asset(
//                           "image/youtube.png",
//                           width: 18,
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         : Container();
//   }
// }

// class ConMenu extends StatefulWidget {
//   const ConMenu(
//       {Key? key,
//       required this.opacity,
//       required this.scrollposition,
//       required this.screenSize})
//       : super(key: key);
//   final double opacity;
//   final double scrollposition;
//   final double screenSize;

//   @override
//   State<ConMenu> createState() => _ConMenuState();
// }

// class _ConMenuState extends State<ConMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: widget.scrollposition < widget.screenSize ? 60 : 90,
//       width: double.infinity,
//       decoration:
//           BoxDecoration(color: Colors.white70.withOpacity(widget.opacity)),
//       child: Row(
//         children: [
//           InkWell(
//             onTap: () {
//               Scaffold.of(context).openDrawer();
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Container(
//                 height: 40,
//                 width: 40,
//                 decoration: const BoxDecoration(shape: BoxShape.circle),
//                 child: Icon(
//                   Icons.menu,
//                   color: widget.scrollposition > widget.screenSize
//                       ? Colors.blue
//                       : Colors.white,
//                   size: 35,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 10),
//           widget.scrollposition > widget.screenSize
//               ? Image.asset(
//                   "image/post.png",
//                   width: 35,
//                 )
//               : Image.asset(
//                   "image/post1.png",
//                   width: 35,
//                 ),
//           const SizedBox(
//             width: 10,
//           ),
//           Text("POST",
//               style: GoogleFonts.josefinSans(
//                   color: (widget.scrollposition > widget.screenSize)
//                       ? Colors.blue.shade600
//                       : Colors.white,
//                   fontSize: 26,
//                   fontWeight: FontWeight.bold)),
//           const Spacer(),
//           OnHoveredCustomer(child: downloadButton("Customer Login", 158, 50)),
//           const SizedBox(
//             width: 20,
//           ),
//           OnHoverRegister(child: downloadButton("Register", 158, 50)),
//           const SizedBox(
//             width: 10,
//           )
//         ],
//       ),
//     );
//   }
// }

// class MenuDrawer extends StatelessWidget {
//   const MenuDrawer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("image/bg.png"), fit: BoxFit.cover)),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 30),
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Container(
//                     color: Colors.blue.shade900,
//                     alignment: Alignment.center,
//                     height: 45,
//                     width: double.infinity,
//                     child: const Text(
//                       "Overview",
//                       style: TextStyle(color: Colors.white),
//                     )),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Container(
//                     color: Colors.blue.shade900,
//                     alignment: Alignment.center,
//                     height: 45,
//                     width: double.infinity,
//                     child: const Text("Dashboard",
//                         style: TextStyle(color: Colors.white))),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Container(
//                     color: Colors.blue.shade900,
//                     alignment: Alignment.center,
//                     height: 45,
//                     width: double.infinity,
//                     child: const Text("Features",
//                         style: TextStyle(color: Colors.white))),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 20),
//                 child: Container(
//                     color: Colors.blue.shade900,
//                     alignment: Alignment.center,
//                     height: 45,
//                     width: double.infinity,
//                     child: const Text("Benefit to Hotel",
//                         style: TextStyle(color: Colors.white))),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget kotakBolong() {
//   return Stack(
//     children: [
//       Padding(
//         padding: const EdgeInsets.only(top: 187, left: 50),
//         child: Image.asset(
//           "image/kotak.png",
//           width: 400,
//         ),
//       ),
//       Positioned(
//         left: 0,
//         top: 238,
//         right: 50,
//         child: Container(
//           height: 350,
//           width: 356,
//           color: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "A POWERFULL APP MAKES FASTER OPERATIONAL",
//                   style: GoogleFonts.josefinSans(
//                       color: const Color(0xff5956E9),
//                       fontSize: 26,
//                       fontWeight: FontWeight.bold,
//                       height: 1.5),
//                 ),
//                 Text(
//                   introText,
//                   style: GoogleFonts.josefinSans(
//                     fontSize: 16,
//                     height: 1.5,
//                     fontWeight: FontWeight.w300,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   "DONWLOAD NOW",
//                   style: GoogleFonts.josefinSans(
//                       fontSize: 20, color: const Color(0xff232233)),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     Image.asset(
//                       "image/android.jpg",
//                       width: 149,
//                     ),
//                     const SizedBox(
//                       width: 14,
//                     ),
//                     Image.asset(
//                       "image/appstore.jpg",
//                       width: 149,
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Widget overviewTablet() {
//   return Container(
//     width: double.infinity,
//     decoration: const BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage("image/bg.png"), fit: BoxFit.cover)),
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           kotakBolong(),
//           Padding(
//             padding: const EdgeInsets.only(top: 200),
//             child: Image.asset(
//               "image/iphone.png",
//               width: 200,
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }

// Widget featureTablet(String title, String descrip, TextAlign textAlign,
//     CrossAxisAlignment crossAxisAlignment) {
//   return Column(
//     crossAxisAlignment: crossAxisAlignment,
//     children: [
//       Container(
//         height: 15,
//         width: 15,
//         decoration: BoxDecoration(
//             color: Colors.blue, borderRadius: BorderRadius.circular(2)),
//       ),
//       const SizedBox(
//         height: 5,
//       ),
//       SizedBox(
//         width: 200,
//         child: Text(
//           title,
//           style: GoogleFonts.josefinSans(
//               color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
//           textAlign: textAlign,
//           overflow: TextOverflow.clip,
//         ),
//       ),
//       SizedBox(
//         width: 200,
//         child: Text(
//           descrip,
//           style: GoogleFonts.josefinSans(
//               fontSize: 16, fontWeight: FontWeight.w300),
//           textAlign: textAlign,
//           overflow: TextOverflow.clip,
//         ),
//       ),
//     ],
//   );
// }

// Widget featuresPageTablet(Callback callback, IconData iconData) {
//   return Container(
//     alignment: Alignment.center,
//     width: double.infinity,
//     child: Padding(
//       padding: const EdgeInsets.only(top: 30),
//       child: SizedBox(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               Text(
//                 "App Features",
//                 style: GoogleFonts.josefinSans(
//                     fontSize: 32, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 18,
//               ),
//               SizedBox(
//                 width: 750,
//                 child: Text(
//                   "Post connects different departments for faster guest service and better maintenance operations",
//                   style: GoogleFonts.josefinSans(fontSize: 20),
//                   overflow: TextOverflow.clip,
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 30),
//                         child: featureTablet(
//                             "Auto - Dispatch Request",
//                             "Auto-dispatch system automatically sends a request to the right department",
//                             TextAlign.end,
//                             CrossAxisAlignment.end),
//                       ),
//                       const SizedBox(height: 100),
//                       featureTablet(
//                           "Hotel Internal Messaging System",
//                           "Cross-department communication makes problem-solving more efficient.",
//                           TextAlign.end,
//                           CrossAxisAlignment.end)
//                     ],
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Image.asset(
//                     "image/iphone.png",
//                     width: 200,
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 40),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 30),
//                           child: featureTablet(
//                               "Department - Specific Workflow",
//                               "Customizable view with daily tasks makes sure nothing goes unfinished.",
//                               TextAlign.start,
//                               CrossAxisAlignment.start),
//                         ),
//                         const SizedBox(height: 100),
//                         featureTablet(
//                             "Reports",
//                             "Request analysis for a better understanding of common issues.",
//                             TextAlign.start,
//                             CrossAxisAlignment.start)
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               ElevatedButton(
//                   onPressed: callback,
//                   child: Container(
//                       alignment: Alignment.center,
//                       height: 45,
//                       width: 135,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           const Text("See All Features"),
//                           Icon(
//                             iconData,
//                             color: Colors.white,
//                           )
//                         ],
//                       )))
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

// Widget otherFeatureTablet(String title, String descrip, TextAlign textAlign,
//     CrossAxisAlignment crossAxisAlignment) {
//   return Column(
//     crossAxisAlignment: crossAxisAlignment,
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
//       SizedBox(
//         width: 400,
//         child: Text(
//           descrip,
//           style: GoogleFonts.josefinSans(
//               color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300),
//           textAlign: textAlign,
//           overflow: TextOverflow.clip,
//         ),
//       ),
//     ],
//   );
// }

// Widget allFeaturesTablet(bool x) {
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
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Text("Other Features",
//                         style: GoogleFonts.josefinSans(
//                             fontSize: 32,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold)),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         SizedBox(
//                           width: 200,
//                           child: otherFeatureTablet(
//                             "",
//                             "Automated dispatching workflows that automatically assign each ticket to the correct person.",
//                             TextAlign.start,
//                             CrossAxisAlignment.start,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 200,
//                           child: otherFeatureTablet(
//                               "",
//                               "Track every single request, regardless of how it comes in.",
//                               TextAlign.start,
//                               CrossAxisAlignment.start),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         SizedBox(
//                           width: 200,
//                           child: otherFeatureTablet(
//                               "",
//                               "Add internal notes for easy message relaying.",
//                               TextAlign.start,
//                               CrossAxisAlignment.start),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 30),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         SizedBox(
//                           width: 200,
//                           child: otherFeatureTablet(
//                             "",
//                             "Allow your staff to enter tickets / work orders from anywhere",
//                             TextAlign.start,
//                             CrossAxisAlignment.start,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 200,
//                           child: otherFeatureTablet(
//                               "",
//                               "Push message notifications.",
//                               TextAlign.start,
//                               CrossAxisAlignment.start),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         SizedBox(
//                           width: 200,
//                           child: otherFeatureTablet("", "10+ language.",
//                               TextAlign.start, CrossAxisAlignment.start),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 30),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         SizedBox(
//                           width: 200,
//                           child: otherFeatureTablet(
//                             "",
//                             "Custom workflows that map your unique business processes",
//                             TextAlign.start,
//                             CrossAxisAlignment.start,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 200,
//                           child: otherFeatureTablet(
//                               "",
//                               "Every department, one system, full transparency.",
//                               TextAlign.start,
//                               CrossAxisAlignment.start),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         SizedBox(
//                           width: 200,
//                           child: otherFeatureTablet("", "Real time chat",
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

// Widget benefitPointTablet(String image, String title, String descrip) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       // ignore: unnecessary_brace_in_string_interps
//       Image.asset("image/${image}.png", width: 50),
//       const SizedBox(height: 30),
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
//           Container(
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
//         width: 200,
//         child: Text(
//           descrip,
//           style: GoogleFonts.josefinSans(
//               fontWeight: FontWeight.w300,
//               color: Colors.white,
//               fontSize: 16,
//               height: 1.3),
//           overflow: TextOverflow.clip,
//         ),
//       )
//     ],
//   );
// }

// Widget benefitToHotelTablet() {
//   return Container(
//     width: double.infinity,
//     decoration: const BoxDecoration(color: Color(0xff6192AB)),
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//       child: Column(
//         children: [
//           Text("Benefits to Hotels",
//               style: GoogleFonts.josefinSans(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white)),
//           const SizedBox(height: 40),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               benefitPointTablet("time", "Efficiency",
//                   "Improved interaction across departments, increasing efficiency & accountability"),
//               benefitPointTablet("group", "Mobile Staff",
//                   "Access all work and requests being done on property in real time from any mobile device"),
//               benefitPointTablet("message", "Communication",
//                   "Communicate easily across every department while on the go"),
//             ],
//           ),
//           const SizedBox(height: 100),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               benefitPointTablet("anywhere", "Access from Anywhere",
//                   "Monitor your property from anywhere, on any device"),
//               benefitPointTablet("user", "Unlimited User",
//                   "Unlimited user that can registered under your property"),
//               benefitPointTablet("ticket", "Ticket Management",
//                   "Access all work and requests being done on property in real time from any mobile device"),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget dashboardTablet() {
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

// Widget footerTablet() {
//   return Container(
//     height: 100,
//     width: 700,
//     decoration: BoxDecoration(
//         color: Colors.white, borderRadius: BorderRadius.circular(30)),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Row(
//           children: [
//             Container(
//               alignment: Alignment.center,
//               height: 50,
//               width: 50,
//               decoration: const BoxDecoration(
//                   shape: BoxShape.circle, color: Color(0xff5956E9)),
//               child: const Icon(
//                 Icons.mail,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(width: 18),
//             Text(
//               "support@myemail.com",
//               style: GoogleFonts.josefinSans(fontSize: 18),
//             ),
//           ],
//         ),
//         Container(
//           width: 2,
//           height: 70,
//           color: Colors.grey,
//         ),
//         Row(
//           children: [
//             Container(
//               alignment: Alignment.center,
//               height: 50,
//               width: 50,
//               decoration: const BoxDecoration(
//                   shape: BoxShape.circle, color: Color(0xff5956E9)),
//               child: const Icon(
//                 Icons.phone,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(width: 18),
//             Text(
//               "+880 321 655 9985",
//               style: GoogleFonts.josefinSans(fontSize: 18),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
