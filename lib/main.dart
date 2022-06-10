import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycare/constant.dart';
import 'login_screen.dart';

Future<void> main() async {
  runApp(ScreenUtilInit(
    designSize: const Size(412, 869),
    minTextAdapt: true,
    builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyCare',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: backgroundPrimary),
        home: child,
      );
    },
    child: const LoginScreen(),
  ));
}
