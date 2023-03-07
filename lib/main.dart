import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:post_web/models/departement.dart';
import 'package:post_web/models/general_data.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/models/user.dart';
import 'package:post_web/routes.dart';
import 'package:post_web/screen/landing_page/landing_page.dart';
import 'package:post_web/screen/login_page/login_page.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/main_dashboard.dart';
import 'package:post_web/screen/landing_page/landing_page_controller.dart';
import 'package:post_web/screen/login_page/controller_login_page.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/create_task_dialog/controller/controller_create_task.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/create_task_dialog/controller/controller_task.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:post_web/shared_prefferences/session_user.dart';
import 'package:provider/provider.dart';
import 'controller/c_user.dart';
import 'firebase/firebase_account.dart';
import 'firebase/firebase_stream_data.dart';
import 'firebase/firebase_action_task.dart';

Box? box;
final db = FirebaseStreamData();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FirebaseDatabase.instance.setPersistenceEnabled(true);
  // Intl.systemLocale = await findSystemLocale();
  await Hive.initFlutter();
  box = await Hive.openBox('boxSetting');
  SessionsUser.getUser();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB48e286_xyb3imd4HioBfzLjznIh_n3Io",
          authDomain: "post-212c8.firebaseapp.com",
          projectId: "post-212c8",
          messagingSenderId: "992209537475",
          // storageBucket: "gs://post-212c8.appspot.com",
          appId: "1:992209537475:web:9e9ce94d54c1f0261a9576"));

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LandingPageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CreateController(),
        ),
        ChangeNotifierProvider(
          create: (context) => TaskController(),
        ),
        ChangeNotifierProvider(
          create: (context) => MainDashboardController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ReportController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FirebaseAccount(),
        ),
        ChangeNotifierProvider(
          create: (context) => FirebaseActionTask(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatroomControlller(),
        ),
        StreamProvider<List<Departement>>(
          create: (BuildContext context) => db.getDepartementData(),
          initialData: const [],
        ),
        StreamProvider<GeneralData?>(
          create: (BuildContext context) => db.streamGeneralData(),
          initialData: null,
        ),
        StreamProvider<List<TaskModel>>(
          create: (BuildContext context) => db.streamTask(),
          initialData: const [],
        ),
        StreamProvider<List<UserDetails>>(
          create: (BuildContext context) => db.streamEmployeeData(),
          initialData: const [],
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(1920, 1080),
        builder: (context, child) => GetMaterialApp(
            routes: {
              Routes.landingPage: (ctx) => const LandingPage(),
              Routes.loginPage: (ctx) => const LoginPage(),
              Routes.mainDashBoard: (ctx) => const MainDashboard(),
            },
            localeResolutionCallback: (
              locale,
              supportedLocales,
            ) {
              if (supportedLocales.contains(Locale(locale!.languageCode))) {
                return locale;
              } else {
                return const Locale('en', '');
              }
            },
            // localizationsDelegates: AppLocalizations.localizationsDelegates,
            // supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeData(fontFamily: 'SF Pro Display'),
            debugShowCheckedModeBanner: false,
            home: const MyApp()),
      )));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final cUser = Get.put(CUser());

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.data == null) {
              // print('user is not signed in yet');
              return const LandingPage();
            } else if (userSnapshot.hasData &&
                cUser.data.profileImage != null) {
              // print('user is already signed in');
              return const MainDashboard();
            } else if (userSnapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Image.asset("images/error.png"),
                ),
              );
            } else if (userSnapshot.connectionState ==
                ConnectionState.waiting) {
              return const Scaffold(
                  body: Center(child: CircularProgressIndicator()));
            }
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          }),
    );
  }
}

//  tabletScreen: 768

// desktopScreen : 657 

// phoneScreen : 
