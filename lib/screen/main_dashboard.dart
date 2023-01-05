import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({Key? key}) : super(key: key);

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          alignment: Alignment.center,
          height: 70,
          width: double.infinity,
          color: const Color(0xffECECF1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                Row(
                  children: [
                    Text(
                      "Create",
                      style: GoogleFonts.sarabun(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff6c757d)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(Icons.arrow_drop_down)
                  ],
                ),
                const Spacer(),
                settingButton("Settings", () {}, const Color(0xff626ed4), 80),
                const SizedBox(width: 20),
                const Icon(Icons.person, size: 20, color: Color(0xff6E79D7))
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color(0xffF8F8FA),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Dashboard",
                      style: GoogleFonts.sarabun(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff333547)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              departments("Housekeeping", () {}),
                              departments("Engineering", () {}),
                              departments("Front Office", () {}),
                              departments("Room Service", () {}),
                              departments("Butler", () {}),
                              departments("Concierge", () {}),
                              departments("IT Support", () {}),
                            ]),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      width: 950,
                      height: 540,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Latest Request",
                              style: GoogleFonts.sarabun(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff6c757d)),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 110,
                                  child: Text(
                                    "Location",
                                    style: GoogleFonts.sarabun(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff6c757d)),
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    "Sender",
                                    style: GoogleFonts.sarabun(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff6c757d)),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                  child: Text(
                                    "To",
                                    style: GoogleFonts.sarabun(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff6c757d)),
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    "Title",
                                    style: GoogleFonts.sarabun(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff6c757d)),
                                  ),
                                ),
                                SizedBox(
                                  width: 170,
                                  child: Text(
                                    "Description",
                                    style: GoogleFonts.sarabun(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff6c757d)),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Status",
                                    style: GoogleFonts.sarabun(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff6c757d)),
                                  ),
                                ),
                                SizedBox(
                                  width: 130,
                                  child: Text(
                                    "Receiver",
                                    style: GoogleFonts.sarabun(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff6c757d)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Container(
                                height: 2,
                                width: double.infinity,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 950,
                              height: 400,
                              child: ListView.builder(
                                  itemCount: 20,
                                  itemBuilder: (context, index) => listOrder()),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 540,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isSelected = false;

  Widget settingButton(String buttonName, VoidCallback callback, Color color,
          double width) =>
      ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: color),
          onPressed: callback,
          child: Container(
            alignment: Alignment.center,
            width: width,
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.settings,
                  size: 14,
                ),
                Text(
                  buttonName,
                  style: GoogleFonts.sarabun(fontSize: 14, color: Colors.white),
                )
              ],
            ),
          ));

  Widget departments(String buttonName, VoidCallback callback) =>
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor:
                  isSelected ? Colors.blue.shade50 : const Color(0xffECECF1)),
          onPressed: callback,
          child: Container(
            alignment: Alignment.center,
            height: 35,
            child: Text(
              buttonName,
              style: GoogleFonts.sarabun(
                  fontSize: 13, color: const Color(0xff6c757d)),
            ),
          ));

  Widget listOrder() => ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        onTap: () {},
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      "1989",
                      style: GoogleFonts.sarabun(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff6c757d)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  SizedBox(
                    width: 155,
                    child: Text(
                      "Hilman Ramdhani",
                      style: GoogleFonts.sarabun(
                          fontSize: 13, color: const Color(0xff6c757d)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 60,
                    child: Image.asset(
                      "image/Housekeeping.png",
                      width: 25,
                    ),
                  ),
                  SizedBox(
                    width: 155,
                    child: Text(
                      "Make Up Room",
                      style: GoogleFonts.sarabun(
                          fontSize: 13, color: const Color(0xff6c757d)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        "Please Now Please Now Please Now Please Now",
                        style: GoogleFonts.sarabun(
                            fontSize: 13, color: const Color(0xff6c757d)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xff028B82),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      child: Text("Assigned to",
                          style: GoogleFonts.sarabun(
                              fontSize: 13, color: Colors.white)),
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  SizedBox(
                    width: 135,
                    child: Text(
                      "Fulan bin Fulan",
                      style: GoogleFonts.sarabun(
                          fontSize: 13, color: const Color(0xff6c757d)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 0, right: 0),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
}
