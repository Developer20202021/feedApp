import 'package:feed/DeveloperAccess/DeveloperAccess.dart';
import 'package:feed/Screens/AdminPanel/AdminHomePage.dart';
import 'package:feed/Screens/AdminPanel/DailySales.dart';
import 'package:feed/Screens/AdminPanel/DueCustomers.dart';
import 'package:feed/Screens/CommonScreen/LogIn.dart';
import 'package:feed/Screens/StockManagement.dart';
import 'package:feed/Screens/StockUpload.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:upgrader/upgrader.dart';

void main() async{


    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: const FirebaseOptions(apiKey: "AIzaSyAhIzls4mKC9qKhl9xR-NKFFprmiruDEQI", appId: "1:906341423350:android:e7887f6c99d1636e1bf4d7", messagingSenderId: "906341423350", projectId: "tvsapp-ac523")
    
  );


  // NotificationService().initNotification();
  // tz.initializeTimeZones();


  await Future.delayed(const Duration(seconds: 3));

  FlutterNativeSplash.remove();


  await Hive.initFlutter();
  var box = await Hive.openBox('feedBox');










  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feed App',
      theme: ThemeData(
        fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: ColorName().appColor),
        useMaterial3: true,
      ),
      home: UpgradeAlert(child: AdminLogInScreen()),
    );
  }
}

