import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Base size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Platform Checker',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const PlatformCheckerScreen(),
        );
      },
    );
  }
}

class PlatformCheckerScreen extends StatelessWidget {
  const PlatformCheckerScreen({super.key});

  String getPlatform() {
    if (kIsWeb) {
      return "Running on Web 🌍";
    } else if (Platform.isAndroid) {
      return "Running on Android 🤖";
    } else if (Platform.isIOS) {
      return "Running on iOS 🍏";
    } else if (Platform.isWindows) {
      return "Running on Windows 🖥";
    } else if (Platform.isMacOS) {
      return "Running on macOS 🍎";
    } else if (Platform.isLinux) {
      return "Running on Linux 🐧";
    } else {
      return "Unknown Platform ❓";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Platform Detector', style: TextStyle(fontSize: 20.sp))),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            getPlatform(),
            style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}