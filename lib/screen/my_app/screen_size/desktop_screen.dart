import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({Key? key}) : super(key: key);

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  Color mainColor = const Color(0xff3152D9);
  bool selectedPage = true;
  bool appstoreIsHover = false;
  bool playstoreIsHover = false;
  // ignore: non_constant_identifier_names
  bool IsRegisterHover = false;
  bool isLoginHover = false;
  bool isHomeHover = false;
  bool isFeatureHover = false;
  bool isPreviewHover = false;
  bool isReportHover = false;
  late ScrollController controller;
  double pixels = 0.0;
  List<double> scrollExperience = [];

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    controller = ScrollController();
    controller.addListener(() {
      setState(() {
        pixels = controller.position.pixels;
        scrollExperience.addAll([pixels]);
        print(pixels);
        print(scrollExperience.length);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 750,
                  width: double.infinity,
                  color: mainColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 70),
                          child: Row(
                            children: [
                              Image.asset(
                                "image/icon.png",
                                width: 70,
                                height: 70,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Post",
                                style: GoogleFonts.poppins(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  MouseRegion(
                                      onEnter: (event) {
                                        setState(() {
                                          isHomeHover = true;
                                        });
                                      },
                                      onExit: (event) {
                                        setState(() {
                                          isHomeHover = false;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: menuHover(
                                            60, isHomeHover, () {}, "Home"),
                                      )),
                                  MouseRegion(
                                      onEnter: (event) {
                                        setState(() {
                                          isFeatureHover = true;
                                        });
                                      },
                                      onExit: (event) {
                                        setState(() {
                                          isFeatureHover = false;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: menuHover(60, isFeatureHover,
                                            () {}, "Feature"),
                                      )),
                                  MouseRegion(
                                      onEnter: (event) {
                                        setState(() {
                                          isPreviewHover = true;
                                        });
                                      },
                                      onExit: (event) {
                                        setState(() {
                                          isPreviewHover = false;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: menuHover(60, isPreviewHover,
                                            () {}, "Preview"),
                                      )),
                                  MouseRegion(
                                      onEnter: (event) {
                                        setState(() {
                                          isReportHover = true;
                                        });
                                      },
                                      onExit: (event) {
                                        setState(() {
                                          isReportHover = false;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: menuHover(150, isReportHover,
                                            () {}, "Dashboard & Reports"),
                                      )),
                                  MouseRegion(
                                    onEnter: (event) {
                                      setState(() {
                                        IsRegisterHover = true;
                                      });
                                    },
                                    onExit: (event) {
                                      setState(() {
                                        IsRegisterHover = false;
                                      });
                                    },
                                    child: registerButton(
                                        "Register Now",
                                        Icons.whatsapp_rounded,
                                        () {},
                                        IsRegisterHover),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  MouseRegion(
                                      onEnter: (event) {
                                        setState(() {
                                          isLoginHover = true;
                                        });
                                      },
                                      onExit: (event) {
                                        setState(() {
                                          isLoginHover = false;
                                        });
                                      },
                                      child: registerButton("User Login",
                                          Icons.login, () {}, isLoginHover))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Image.asset("image/wavetop.png"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 780),
                  child: Image.asset("image/shadowwave.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 750),
                  child: Image.asset("image/wavedown.png"),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 200, left: 100, right: 100),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("UNDERSTANDING YOUR GUEST WITH",
                                style: GoogleFonts.poppins(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xfff1f1f8))),
                            Row(
                              children: [
                                Text("FAST ",
                                    style: GoogleFonts.poppins(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xfff1f1f8))),
                                AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        "SERVICE",
                                        textStyle: GoogleFonts.poppins(
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xfff1f1f8)),
                                      ),
                                      TyperAnimatedText("RESPONSE",
                                          textStyle: GoogleFonts.poppins(
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xfff1f1f8))),
                                      TyperAnimatedText("DELIVERY",
                                          textStyle: GoogleFonts.poppins(
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xfff1f1f8))),
                                    ])
                              ],
                            ),
                            Text(
                                "There is no hospitality like understanding your guest’s needs. Make their stay much more memorable with POST, a messaging system for service and maintenance requests in hotels and resorts.",
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    height: 1.5,
                                    color: const Color(0xfff1f1f8))),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                                "Post connects different departments for faster guest service and better maintenance operations",
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    height: 1.5,
                                    color: const Color(0xfff1f1f8))),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                MouseRegion(
                                  onEnter: (event) {
                                    setState(() {
                                      appstoreIsHover = true;
                                    });
                                  },
                                  onExit: (event) {
                                    setState(() {
                                      appstoreIsHover = false;
                                    });
                                  },
                                  child: InkWell(
                                      onTap: () {},
                                      child: buttonDownload(
                                          "APP STORE",
                                          "image/applewhite.png",
                                          "image/appleblue.png",
                                          appstoreIsHover)),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                MouseRegion(
                                  onEnter: (event) {
                                    setState(() {
                                      playstoreIsHover = true;
                                    });
                                  },
                                  onExit: (event) {
                                    setState(() {
                                      playstoreIsHover = false;
                                    });
                                  },
                                  child: InkWell(
                                      onTap: () {},
                                      child: buttonDownload(
                                          "PLAYSTORE",
                                          "image/playstorewhite.png",
                                          "image/playstoreblue.png",
                                          playstoreIsHover)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Image.asset("image/mokap.png", width: 500)
                    ],
                  ),
                )
              ],
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  Text("FEATURES",
                      style: GoogleFonts.poppins(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff333333))),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 300),
                    child: SizedBox(
                      width: double.maxFinite,
                      // ignore: prefer_const_constructors
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 47),
                            child: Container(
                              width: double.maxFinite,
                              height: 4.5,
                              color: Colors.grey[350],
                            ),
                          ),
                          TabBar(
                              labelStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              unselectedLabelColor: Colors.grey[350],
                              indicatorColor: mainColor,
                              indicatorWeight: 5,
                              labelColor: mainColor,
                              controller: tabController,
                              tabs: [
                                Tab(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.star_border_rounded),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Key Features"),
                                    ],
                                  ),
                                ),
                                Tab(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.more_sharp),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Others Features"),
                                    ],
                                  ),
                                ),
                                Tab(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.apps_rounded),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Benefit"),
                                    ],
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 450,
                    width: double.maxFinite,
                    child: TabBarView(
                        controller: tabController,
                        children: [keyFeatures(), otherTab(), benefit()]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
                child: Column(
                  children: [
                    Text("PREVIEW",
                        style: GoogleFonts.poppins(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff333333))),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Communicate easily across every department while on the go, Monitor your property from anywhere, on any device",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: const Color(0xff333333),
                          height: 1.5),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        height: 500,
                        width: 700,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("image/videomage.jpg"),
                                fit: BoxFit.cover)),
                        child: Lottie.asset("image/play.json", width: 82)),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
                child: Column(
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: (scrollExperience.contains(1800))
                          ? 1.0
                          : (pixels >= 1800)
                              ? 1.0
                              : 0.0,
                      child: AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(
                            top: (scrollExperience.contains(1800))
                                ? 0.0
                                : (pixels >= 1800)
                                    ? 0.0
                                    : 50.0),
                        child: Text("DASHBOARD & REPORT",
                            style: 
                            GoogleFonts.poppins(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff333333))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 800),
                          opacity: (scrollExperience.contains(2000))
                              ? 1.0
                              : (pixels >= 2000)
                                  ? 1.0
                                  : 0.0,
                          child: AnimatedPadding(
                            duration: const Duration(milliseconds: 800),
                            padding: EdgeInsets.only(
                                right: (scrollExperience.contains(2000))
                                    ? 0.0
                                    : (pixels >= 2000)
                                        ? 0.0
                                        : 80.0),
                            child: Image.asset("image/report.png", width: 600),
                          ),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 800),
                          opacity: (scrollExperience.contains(2000))
                              ? 1.0
                              : (pixels >= 2000)
                                  ? 1.0
                                  : 0.0,
                          child: AnimatedPadding(
                            duration: const Duration(milliseconds: 800),
                            padding: EdgeInsets.only(
                                left: (scrollExperience.contains(2000))
                                    ? 0.0
                                    : (pixels >= 2000)
                                        ? 0.0
                                        : 80.0),
                            child: rightPoint(
                                "Realtime",
                                "Real time dashboards for operators to view pending and closed requests",
                                Icons.history),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 800),
                          opacity: (scrollExperience.contains(2500))
                              ? 1.0
                              : (pixels >= 2500)
                                  ? 1.0
                                  : 0.0,
                          child: AnimatedPadding(
                            duration: const Duration(milliseconds: 800),
                            padding: EdgeInsets.only(
                                right: (scrollExperience.contains(2500))
                                    ? 0.0
                                    : (pixels >= 2500)
                                        ? 0.0
                                        : 80.0),
                            child: leftPoint(
                                "Analytics",
                                "Report shows analytics for request families, departments, location, etc",
                                Icons.analytics),
                          ),
                        ),
                        AnimatedOpacity(
                            duration: const Duration(milliseconds: 800),
                            opacity: (scrollExperience.contains(2500))
                                ? 1.0
                                : (pixels >= 2500)
                                    ? 1.0
                                    : 0.0,
                            child: AnimatedPadding(
                                duration: const Duration(milliseconds: 800),
                                padding: EdgeInsets.only(
                                    left: (scrollExperience.contains(2500))
                                        ? 0.0
                                        : (pixels >= 2500)
                                            ? 0.0
                                            : 80.0),
                                child: Image.asset("image/report.png",
                                    width: 600))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  Image.asset("image/footerwave.png"),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [mainColor, Colors.blue.shade200])),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 200),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Links",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.right,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Home",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Colors.white,
                                        height: 1.5),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Feature",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Colors.white,
                                        height: 1.5),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Preview",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Colors.white,
                                        height: 1.5),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Dashboard & Report",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Colors.white,
                                        height: 1.5),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Download Now",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  MouseRegion(
                                    onEnter: (event) {
                                      setState(() {
                                        appstoreIsHover = true;
                                      });
                                    },
                                    onExit: (event) {
                                      setState(() {
                                        appstoreIsHover = false;
                                      });
                                    },
                                    child: InkWell(
                                        onTap: () {},
                                        child: buttonDownload(
                                            "APP STORE",
                                            "image/applewhite.png",
                                            "image/appleblue.png",
                                            appstoreIsHover)),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  MouseRegion(
                                    onEnter: (event) {
                                      setState(() {
                                        playstoreIsHover = true;
                                      });
                                    },
                                    onExit: (event) {
                                      setState(() {
                                        playstoreIsHover = false;
                                      });
                                    },
                                    child: InkWell(
                                        onTap: () {},
                                        child: buttonDownload(
                                            "PLAYSTORE",
                                            "image/playstorewhite.png",
                                            "image/playstoreblue.png",
                                            playstoreIsHover)),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Register",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  MouseRegion(
                                    onEnter: (event) {
                                      setState(() {
                                        IsRegisterHover = true;
                                      });
                                    },
                                    onExit: (event) {
                                      setState(() {
                                        IsRegisterHover = false;
                                      });
                                    },
                                    child: registerButton(
                                        "Register Now",
                                        Icons.whatsapp_rounded,
                                        () {},
                                        IsRegisterHover),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 2,
                            color: Colors.white60,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Theme by POST 2022",
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.white,
                                    height: 1.5),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget registerButton(String buttonName, IconData iconData,
          VoidCallback callback, bool ishover) =>
      InkWell(
        onTap: callback,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutSine,
          alignment: Alignment.center,
          width: 150,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ishover ? 25 : 5),
              border: Border.all(color: Colors.white, width: 2),
              color: ishover ? Colors.white : const Color(0xff3152D9)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  iconData,
                  size: 20,
                  color: ishover ? const Color(0xff3152D9) : Colors.white,
                ),
                Text(buttonName,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: ishover ? const Color(0xff3152D9) : Colors.white,
                    ))
              ],
            ),
          ),
        ),
      );

  Widget menuHover(
          double size, bool menu, VoidCallback callback, String menuName) =>
      InkWell(
        onTap: callback,
        child: SizedBox(
          width: size,
          child: Column(
            children: [
              Text(menuName,
                  style: TextStyle(
                      color: selectedPage
                          ? const Color(0xfffce7e7)
                          : Colors.white54)),
              const SizedBox(
                height: 5,
              ),
              AnimatedPadding(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.only(right: menu ? 0 : size),
                child: Container(
                  color: Colors.white,
                  height: 2,
                  width: size,
                ),
              )
            ],
          ),
        ),
      );

  Widget benefit() => SizedBox(
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "image/mokap2.png",
              width: 400,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                poinOtherTab(
                    "Efficiency",
                    "Improved interaction across departments, increasing efficiency & accountability",
                    Icons.accessibility_rounded),
                poinOtherTab(
                    "Mobile Staff",
                    "Access all work and requests being done on property in real time from any mobile device",
                    Icons.group),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                poinOtherTab(
                    "Communication",
                    "Communicate easily across every department while on the go",
                    Icons.chat_rounded),
                poinOtherTab(
                    "Ticket Management",
                    "Never miss a ticket due to our custom escalations",
                    Icons.timer),
              ],
            ),
          ],
        ),
      );

  Widget otherTab() => SizedBox(
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "image/mokap2.png",
              width: 400,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                poinOtherTab(
                    "Tracking",
                    "Track every single request, regardless of how it comes in.",
                    Icons.history),
                poinOtherTab(
                    "Nofitication",
                    "Push message notifications, Schedule Notification, Escalaton Notification",
                    Icons.notifications),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                poinOtherTab(
                    "All Departments",
                    "Every department, one system, full transparency.",
                    Icons.group),
                poinOtherTab(
                    "Message",
                    "Add internal notes for easy message relaying.",
                    Icons.note),
              ],
            ),
          ],
        ),
      );

  Widget poinOtherTab(String title, String subtitle, IconData icon) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(shape: BoxShape.circle, color: mainColor),
            child: Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 20, color: mainColor, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 300,
            child: Text(
              subtitle,
              style: GoogleFonts.poppins(
                  fontSize: 15, color: const Color(0xff333333), height: 1.5),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      );

  Widget keyFeatures() => SizedBox(
        width: double.maxFinite,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: (scrollExperience.contains(600))
                    ? 1.0
                    : (pixels >= 600)
                        ? 1.0
                        : 0.0,
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 800),
                  padding: EdgeInsets.only(
                      left: (scrollExperience.contains(600))
                          ? 0
                          : (pixels >= 600)
                              ? 0
                              : 870),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      leftPoint(
                          "Auto - Dispatch Request",
                          "Auto-dispatch system automatically sends a request to the right department",
                          Icons.navigation),
                      leftPoint(
                          "Internal Communication Tool",
                          "Cross-department communication makes problem-solving more efficient.",
                          Icons.chat_rounded),
                      leftPoint(
                          "Department - Specific Workflow",
                          "Customizable view with daily tasks makes sure nothing goes unfinished.",
                          Icons.checklist_rounded),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: (scrollExperience.contains(600))
                    ? 1.0
                    : (pixels >= 600)
                        ? 1.0
                        : 0.0,
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 800),
                  padding: EdgeInsets.only(
                      top: (scrollExperience.contains(600))
                          ? 0.0
                          : (pixels >= 600)
                              ? 0.0
                              : 70.0),
                  child: Image.asset(
                    "image/mokap2.png",
                    width: 400,
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: (scrollExperience.contains(600))
                  ? 1.0
                  : (pixels >= 600)
                      ? 1.0
                      : 0.0,
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 800),
                padding: EdgeInsets.only(
                    left: (scrollExperience.contains(600))
                        ? 870
                        : (pixels >= 600)
                            ? 870
                            : 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    rightPoint(
                        "Reports",
                        "Request analysis for a better understanding of common issues.",
                        Icons.report),
                    rightPoint(
                        "Automated dispatching",
                        "workflows that automatically assign each ticket to the correct person.",
                        Icons.group),
                    rightPoint(
                        "Create a task from anywhere",
                        "Allow your staff to enter tickets /work orders from anywhere",
                        Icons.add_task_rounded)
                  ],
                ),
              ),
            )
          ],
        ),
      );

  Widget leftPoint(String title, String subtitle, IconData icon) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: mainColor,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xff333333),
                      height: 1.5),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(shape: BoxShape.circle, color: mainColor),
            child: Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
          )
        ],
      );

  Widget rightPoint(String title, String subtitle, IconData icon) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(shape: BoxShape.circle, color: mainColor),
            child: Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: mainColor,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xff333333),
                      height: 1.5),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ],
      );

  Widget buttonDownload(String buttonName, String imageWhite, String imageBlue,
          bool isHover) =>
      AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutSine,
        alignment: Alignment.center,
        width: 185,
        height: 46,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white, width: 2),
            color: isHover ? Colors.white : const Color(0xff3152D9)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isHover
                ? Image.asset(
                    imageBlue,
                    width: 20,
                  )
                : Image.asset(
                    imageWhite,
                    width: 20,
                  ),
            const SizedBox(
              width: 15,
            ),
            Text(buttonName,
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: isHover ? const Color(0xff3152D9) : Colors.white,
                    fontWeight: FontWeight.bold))
          ],
        ),
      );
}
