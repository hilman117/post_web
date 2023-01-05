// import 'package:flutter/material.dart';
// import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
// import 'package:google_fonts/google_fonts.dart';

// String introText =
//     "There is no hospitality like understanding your guest's needs. Make their stay much more memorable with POST, a hotel internal messaging system for service and maintenance requests in hotels and resorts";

// class RowContact extends StatefulWidget {
//   const RowContact(
//       {Key? key, required this.scrollProsition, required this.screenSize})
//       : super(key: key);
//   final double scrollProsition;
//   final double screenSize;

//   @override
//   State<RowContact> createState() => _RowContactState();
// }

// class _RowContactState extends State<RowContact> {
//   @override
//   Widget build(BuildContext context) {
//     return widget.scrollProsition < widget.screenSize
//         ? Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: SizedBox(
//               width: 1100,
//               child: Row(
//                 children: [
//                   const SizedBox(
//                     width: 60,
//                   ),
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

// Widget downloadButton(String title, double width, double height) {
//   return Container(
//     alignment: Alignment.center,
//     width: width,
//     height: height,
//     decoration: BoxDecoration(
//         color: Colors.blue.shade900, borderRadius: BorderRadius.circular(5)),
//     child: Padding(
//       padding: const EdgeInsets.only(top: 3),
//       child: Text(
//         title,
//         style: GoogleFonts.josefinSans(
//             color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
//       ),
//     ),
//   );
// }

// Widget downloadButton2(String title) {
//   return Container(
//     alignment: Alignment.center,
//     width: 158,
//     height: 50,
//     decoration: BoxDecoration(
//       color: Colors.blue.shade50,
//       borderRadius: BorderRadius.circular(5),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.5),
//           spreadRadius: 5,
//           blurRadius: 7,
//           offset: const Offset(0, 3), // changes position of shadow
//         ),
//       ],
//     ),
//     child: Padding(
//       padding: const EdgeInsets.only(top: 3),
//       child: Text(
//         title,
//         style: GoogleFonts.josefinSans(
//             color: Colors.blue.shade900,
//             fontSize: 16,
//             fontWeight: FontWeight.w600),
//       ),
//     ),
//   );
// }

// Widget featureButtton(String title) {
//   return Container(
//     alignment: Alignment.center,
//     width: 200,
//     height: 45,
//     decoration: BoxDecoration(
//       color: Colors.blue.shade50,
//       borderRadius: BorderRadius.circular(5),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.5),
//           spreadRadius: 5,
//           blurRadius: 7,
//           offset: const Offset(0, 3), // changes position of shadow
//         ),
//       ],
//     ),
//     child: Padding(
//       padding: const EdgeInsets.only(top: 3),
//       child: Text(
//         title,
//         style: GoogleFonts.josefinSans(
//             color: Colors.blue.shade900,
//             fontSize: 16,
//             fontWeight: FontWeight.w600),
//       ),
//     ),
//   );
// }

// class MenuBox extends StatefulWidget {
//   const MenuBox({
//     Key? key,
//     required this.opacity,
//     required this.scrollposition,
//     required this.screenSize,
//     required this.autoscroll,
//   }) : super(key: key);
//   final double opacity;
//   final double scrollposition;
//   final double screenSize;
//   final Function autoscroll;

//   @override
//   State<MenuBox> createState() => _MenuBoxState();
// }

// class _MenuBoxState extends State<MenuBox> {
//   int index = 0;
//   List<bool> isHover = [false, false, false, false, false];
//   final menu = ["Overview", "Dashboard", "Features", "Benefit to Hotel"];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.bottomCenter,
//       height: widget.scrollposition > widget.screenSize ? 60 : 90,
//       width: double.infinity,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           color: Colors.white70.withOpacity(widget.opacity)),
//       child: SizedBox(
//         width: 1100,
//         child: Row(
//           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               height: 59,
//               width: 200,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   widget.scrollposition > widget.screenSize
//                       ? Image.asset(
//                           "image/post.png",
//                           width: 35,
//                         )
//                       : Image.asset(
//                           "image/post1.png",
//                           width: 35,
//                         ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Text("POST",
//                       style: GoogleFonts.josefinSans(
//                           color: (widget.scrollposition > widget.screenSize)
//                               ? Colors.blue.shade600
//                               : Colors.white,
//                           fontSize: 26,
//                           fontWeight: FontWeight.bold))
//                 ],
//               ),
//             ),
//             Expanded(
//               child: SizedBox(
//                 height: 59,
//                 // width: 500,
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 3),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       InkWell(
//                         onTap: () => widget.autoscroll,
//                         onHover: (value) {
//                           setState(() {
//                             value ? isHover[0] = true : isHover[0] = false;
//                           });
//                         },
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               menu[0],
//                               style: GoogleFonts.josefinSans(
//                                   color: (isHover[0] == true)
//                                       ? Colors.blue.shade900
//                                       : (widget.scrollposition >
//                                               widget.screenSize)
//                                           ? Colors.blue.shade600
//                                           : Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             Visibility(
//                               maintainAnimation: true,
//                               maintainState: true,
//                               maintainSize: true,
//                               visible: isHover[0],
//                               child: Container(
//                                 width: 90,
//                                 height: 2,
//                                 color: Colors.blue.shade900,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         onHover: (value) {
//                           setState(() {
//                             value ? isHover[1] = true : isHover[1] = false;
//                           });
//                         },
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               menu[1],
//                               style: GoogleFonts.josefinSans(
//                                   color: (isHover[1] == true)
//                                       ? Colors.blue.shade900
//                                       : (widget.scrollposition >
//                                               widget.screenSize)
//                                           ? Colors.blue.shade600
//                                           : Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             Visibility(
//                               maintainAnimation: true,
//                               maintainState: true,
//                               maintainSize: true,
//                               visible: isHover[1],
//                               child: Container(
//                                 width: 90,
//                                 height: 2,
//                                 color: Colors.blue.shade900,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         onHover: (value) {
//                           setState(() {
//                             value ? isHover[2] = true : isHover[2] = false;
//                           });
//                         },
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               menu[2],
//                               style: GoogleFonts.josefinSans(
//                                   color: (isHover[2] == true)
//                                       ? Colors.blue.shade900
//                                       : (widget.scrollposition >
//                                               widget.screenSize)
//                                           ? Colors.blue.shade600
//                                           : Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             Visibility(
//                               maintainAnimation: true,
//                               maintainState: true,
//                               maintainSize: true,
//                               visible: isHover[2],
//                               child: Container(
//                                 width: 90,
//                                 height: 2,
//                                 color: Colors.blue.shade900,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         onHover: (value) {
//                           setState(() {
//                             value ? isHover[3] = true : isHover[3] = false;
//                           });
//                         },
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               menu[3],
//                               style: GoogleFonts.josefinSans(
//                                   color: (isHover[3] == true)
//                                       ? Colors.blue.shade900
//                                       : (widget.scrollposition >
//                                               widget.screenSize)
//                                           ? Colors.blue.shade600
//                                           : Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             Visibility(
//                               maintainAnimation: true,
//                               maintainState: true,
//                               maintainSize: true,
//                               visible: isHover[3],
//                               child: Container(
//                                 width: 90,
//                                 height: 2,
//                                 color: Colors.blue.shade900,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5),
//               child: Row(
//                 children: [
//                   InkWell(
//                       onTap: () {},
//                       child: OnHoveredCustomer(
//                           child: downloadButton("Customer Login", 158, 50))),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   InkWell(
//                       onTap: () {},
//                       child: OnHoverRegister(
//                           child: downloadButton("Register", 158, 50))),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget box() {
//   return Stack(
//     children: [
//       Padding(
//         padding: const EdgeInsets.only(top: 187, left: 50),
//         child: Image.asset(
//           "image/kotak.png",
//           width: 535,
//         ),
//       ),
//       Positioned(
//         left: 0,
//         top: 238,
//         right: 50,
//         child: Container(
//           height: 400,
//           width: 570,
//           color: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "A POWERFULL APP MAKES FASTER OPERATIONAL",
//                   style: GoogleFonts.josefinSans(
//                       color: const Color(0xff5956E9),
//                       fontSize: 36,
//                       fontWeight: FontWeight.bold,
//                       height: 1.5),
//                 ),
//                 Text(
//                   introText,
//                   style: GoogleFonts.josefinSans(
//                     fontSize: 20,
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
//                       fontSize: 25, color: const Color(0xff232233)),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     Image.asset(
//                       "image/android.jpg",
//                       width: 180,
//                     ),
//                     const SizedBox(
//                       width: 14,
//                     ),
//                     Image.asset(
//                       "image/appstore.jpg",
//                       width: 180,
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

// Widget isiboxBiru() {
//   return Row(
//     children: [
//       box(),
//       Padding(
//         padding: const EdgeInsets.only(top: 150, left: 100),
//         child: Image.asset(
//           "image/iphone.png",
//           width: 270,
//         ),
//       )
//     ],
//   );
// }

// Widget overview() {
//   return Container(
//     width: double.infinity,
//     decoration: const BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage("image/bg.png"), fit: BoxFit.cover)),
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 30),
//       child: Column(
//         children: [isiboxBiru()],
//       ),
//     ),
//   );
// }

// Widget feature(String title, String descrip, TextAlign textAlign,
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
//               fontSize: 25, fontWeight: FontWeight.w300),
//           textAlign: textAlign,
//           overflow: TextOverflow.clip,
//         ),
//       ),
//     ],
//   );
// }

// Widget otherFeatureDesktop(String title, String descrip, TextAlign textAlign,
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
//       Text(
//         title,
//         style: GoogleFonts.josefinSans(
//             color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
//         textAlign: textAlign,
//         overflow: TextOverflow.clip,
//       ),
//       SizedBox(
//         width: 450,
//         child: Text(
//           descrip,
//           style: GoogleFonts.josefinSans(
//             color: Colors.white,
//             fontSize: 25,
//             fontWeight: FontWeight.w300,
//           ),
//           textAlign: textAlign,
//           overflow: TextOverflow.clip,
//         ),
//       ),
//     ],
//   );
// }

// Widget featuresPageDesktop(Callback callback, IconData iconData) {
//   return Container(
//     alignment: Alignment.center,
//     height: 850,
//     width: double.infinity,
//     child: Padding(
//       padding: const EdgeInsets.only(top: 30),
//       child: SizedBox(
//         height: 1000,
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
//               Text(
//                 "Post connects different departments for faster guest service and better maintenance operations",
//                 style: GoogleFonts.josefinSans(fontSize: 20),
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
//                       feature(
//                           "Auto - Dispatch Request",
//                           "Auto-dispatch system automatically sends a request to the right department",
//                           TextAlign.end,
//                           CrossAxisAlignment.end),
//                       const SizedBox(height: 200),
//                       feature(
//                           "Hotel Internal Messaging System",
//                           "Cross-department communication makes problem-solving more efficient.",
//                           TextAlign.end,
//                           CrossAxisAlignment.end)
//                     ],
//                   ),
//                   const SizedBox(
//                     width: 40,
//                   ),
//                   Image.asset(
//                     "image/iphone.png",
//                     width: 300,
//                   ),
//                   const SizedBox(
//                     width: 40,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       feature(
//                           "Department - Specific Workflow",
//                           "Customizable view with daily tasks makes sure nothing goes unfinished.",
//                           TextAlign.start,
//                           CrossAxisAlignment.start),
//                       const SizedBox(height: 200),
//                       feature(
//                           "Reports",
//                           "Request analysis for a better understanding of common issues.",
//                           TextAlign.start,
//                           CrossAxisAlignment.start)
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               InkWell(
//                   onTap: callback,
//                   child: OnHoverSeeAllFeature(
//                       child: downloadButton("See All Feature", 200, 45)))
//               // ElevatedButton(
//               //     onPressed: callback,
//               //     child: Container(
//               //         alignment: Alignment.center,
//               //         height: 45,
//               //         width: 200,
//               //         child: Row(
//               //           mainAxisAlignment: MainAxisAlignment.spaceAround,
//               //           children: [
//               //             const Text("See All Features"),
//               //             Icon(
//               //               iconData,
//               //               color: Colors.white,
//               //             )
//               //           ],
//               //         )))
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

// Widget allFeaturesDesktop(bool x) {
//   return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 500),
//       child: x == true
//           ? Container(
//               height: 620,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage("image/bg.png"), fit: BoxFit.cover)),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Text("OTHER FEATURES",
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
//                           width: 300,
//                           child: otherFeatureDesktop(
//                             "",
//                             "Automated dispatching workflows that automatically assign each ticket to the correct person.",
//                             TextAlign.start,
//                             CrossAxisAlignment.start,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 300,
//                           child: otherFeatureDesktop(
//                               "",
//                               "Track every single request, regardless of how it comes in.",
//                               TextAlign.start,
//                               CrossAxisAlignment.start),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         SizedBox(
//                           width: 300,
//                           child: otherFeatureDesktop(
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
//                           width: 300,
//                           child: otherFeatureDesktop(
//                             "",
//                             "Allow your staff to enter tickets / work orders from anywhere",
//                             TextAlign.start,
//                             CrossAxisAlignment.start,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 300,
//                           child: otherFeatureDesktop(
//                               "",
//                               "Push message notifications.",
//                               TextAlign.start,
//                               CrossAxisAlignment.start),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         SizedBox(
//                           width: 300,
//                           child: otherFeatureDesktop("", "10+ language.",
//                               TextAlign.start, CrossAxisAlignment.start),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 30),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         SizedBox(
//                           width: 300,
//                           child: otherFeatureDesktop(
//                             "",
//                             "Custom workflows that map your unique business processes",
//                             TextAlign.start,
//                             CrossAxisAlignment.start,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 300,
//                           child: otherFeatureDesktop(
//                               "",
//                               "Every department, one system, full transparency.",
//                               TextAlign.start,
//                               CrossAxisAlignment.start),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         SizedBox(
//                           width: 300,
//                           child: otherFeatureDesktop("", "Real time chat",
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

// Widget benefitPointDesktop(String image, String title, String descrip) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       // ignore: unnecessary_brace_in_string_interps
//       Image.asset("image/${image}.png", width: 100),
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
//           Text(
//             title,
//             style: GoogleFonts.josefinSans(
//                 color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//       const SizedBox(height: 15),
//       SizedBox(
//           width: 400,
//           child: Text(descrip,
//               style: GoogleFonts.josefinSans(
//                 fontWeight: FontWeight.w300,
//                 color: Colors.white,
//                 fontSize: 22,
//                 height: 1.3,
//               )))
//     ],
//   );
// }

// Widget benefitToHotelDesktop() {
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
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               benefitPointDesktop("time", "Efficiency",
//                   "Improved interaction across departments, increasing efficiency & accountability"),
//               benefitPointDesktop("group", "Mobile Staff",
//                   "Access all work and requests being done on property in real time from any mobile device"),
//               benefitPointDesktop("message", "Communication",
//                   "Communicate easily across every department while on the go"),
//             ],
//           ),
//           const SizedBox(height: 100),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               benefitPointDesktop("anywhere", "Access from Anywhere",
//                   "Monitor your property from anywhere, on any device"),
//               benefitPointDesktop("user", "Unlimited User",
//                   "Unlimited user that can registered under your property"),
//               benefitPointDesktop("ticket", "Ticket Management",
//                   "Access all work and requests being done on property in real time from any mobile device"),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget dashboardDesktop() {
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
//                 width: 700,
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
//                       width: 400,
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
//                       width: 400,
//                       child: Text(
//                         "Report shows analytics for request families, departments, location, etc",
//                         style: GoogleFonts.josefinSans(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w300,
//                             fontSize: 22,
//                             height: 1.3),
//                         textAlign: TextAlign.end,
//                       ))
//                 ],
//               ),
//               Image.asset(
//                 "image/report.png",
//                 width: 700,
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget footerContact() {
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
//               style: GoogleFonts.josefinSans(fontSize: 25),
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
//               style: GoogleFonts.josefinSans(fontSize: 25),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

// Widget stack() {
//   return Stack(children: [
//     Column(
//       children: [
//         dashboardDesktop(),
//         Container(
//           height: 200,
//           width: double.infinity,
//           color: const Color(0xff232233),
//         ),
//       ],
//     ),
//     Positioned(bottom: 120, left: 300, child: footerContact()),
//   ]);
// }

// class OnHoveredCustomer extends StatefulWidget {
//   const OnHoveredCustomer({Key? key, this.child}) : super(key: key);
//   // ignore: prefer_typing_uninitialized_variables
//   final child;
//   @override
//   State<OnHoveredCustomer> createState() => _OnHoveredCustomerState();
// }

// // ignore: unused_element
// class _OnHoveredCustomerState extends State<OnHoveredCustomer> {
//   bool isHovered = false;
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (event) => onEnter(true),
//       onExit: (event) => onEnter(false),
//       child: AnimatedSwitcher(
//         duration: const Duration(seconds: 1000),
//         child: isHovered ? downloadButton2("Customer Login") : widget.child,
//       ),
//     );
//   }

//   void onEnter(bool isHovered) => setState(() {
//         this.isHovered = isHovered;
//       });
// }

// class OnHoverRegister extends StatefulWidget {
//   const OnHoverRegister({Key? key, this.child}) : super(key: key);
//   // ignore: prefer_typing_uninitialized_variables
//   final child;
//   @override
//   State<OnHoverRegister> createState() => _OnHoverRegisterState();
// }

// class _OnHoverRegisterState extends State<OnHoverRegister> {
//   bool isHovered = false;
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (event) => onEnter(true),
//       onExit: (event) => onEnter(false),
//       child: AnimatedSwitcher(
//         duration: const Duration(seconds: 1000),
//         child: isHovered ? downloadButton2("Register") : widget.child,
//       ),
//     );
//   }

//   void onEnter(bool isHovered) => setState(() {
//         this.isHovered = isHovered;
//       });
// }

// class OnHoverSeeAllFeature extends StatefulWidget {
//   const OnHoverSeeAllFeature({Key? key, this.child}) : super(key: key);
//   final child;

//   @override
//   State<OnHoverSeeAllFeature> createState() => _OnHoverSeeAllFeatureState();
// }

// class _OnHoverSeeAllFeatureState extends State<OnHoverSeeAllFeature> {
//   bool isHovered = false;
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (event) => onEnter(true),
//       onExit: (event) => onEnter(false),
//       child: AnimatedSwitcher(
//         duration: const Duration(seconds: 1000),
//         child: isHovered ? featureButtton("See All Feature") : widget.child,
//       ),
//     );
//   }

//   void onEnter(bool isHovered) => setState(() {
//         this.isHovered = isHovered;
//       });
// }
