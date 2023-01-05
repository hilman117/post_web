import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_web/screen/landing_page/landing_page.dart';
import 'package:post_web/screen/landing_page/controller/home_section_controller.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB48e286_xyb3imd4HioBfzLjznIh_n3Io",
          appId: "1:992209537475:web:9e9ce94d54c1f0261a9576",
          messagingSenderId: "992209537475",
          projectId: "post-212c8"));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomeSectionController(),
      )
    ],
    child: const GetMaterialApp(
        debugShowCheckedModeBanner: false, home: LandingPage()),
  ));
}


//  tabletScreen: 768

// desktopScreen : 657 

// phoneScreen : 
