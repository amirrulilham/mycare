import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycare/constant.dart';
import 'package:mycare/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Icon(Icons.shield_moon, size: 150.sp, color: secondaryColor),
              Column(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500),
                            prefixIcon: const Icon(
                              Icons.password,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 50.sp,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(secondaryColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.0)))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          },
                          child: const Text("LOGIN")))
                ],
              ),
              const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w400)),
                  Text("Create account",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: secondaryColor)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
