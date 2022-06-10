import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycare/checkin_screen.dart';
import 'package:mycare/constant.dart';
import 'package:mycare/checkout_screen.dart';
import 'package:mycare/history_screen.dart';
import 'package:mycare/model/checkin.model.dart';
import 'package:mycare/model/credential.model.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Credential user = Credential();
  List<Checkin> checkin = <Checkin>[];

  @override
  void initState() {
    super.initState();
    getCredential();
    getCheckin();
  }

  Future<void> getCredential() async {
    final String response =
        await rootBundle.loadString('asset/json/credential.json');
    final credential = credentialFromJson(response);
    setState(() {
      user = credential;
    });
  }

  Future<void> getCheckin() async {
    final String response =
        await rootBundle.loadString('asset/json/checkinlist.json');
    final checkindata = checkinFromJson(response);
    setState(() {
      checkin.addAll(checkindata);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Icon(Icons.shield_moon, size: 150.sp, color: secondaryColor),
            SizedBox(height: 10.sp),
            Text("MyCare",
                style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                    color: secondaryColor)),
            SizedBox(height: 40.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.sp),
              child: Column(
                children: [
                  Text(user.name == null ? "" : user.name!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: secondaryColor)),
                  SizedBox(height: 15.sp),
                  Text(user.newIc == null ? "" : user.newIc!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: secondaryColor)),
                ],
              ),
            ),
            SizedBox(height: 40.sp),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              child: checkin.isEmpty
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0.sp, vertical: 25.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Last Check In :",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: secondaryColor)),
                          SizedBox(height: 15.sp),
                          ...checkin
                              .asMap()
                              .map((key, value) => MapEntry(
                                  key,
                                  key == 1
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(value.locationName!,
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: secondaryColor)),
                                            SizedBox(height: 15.sp),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                    DateFormat("MMM d, yyyy")
                                                        .add_jms()
                                                        .format(
                                                            value.createdAt!),
                                                    style: TextStyle(
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black)),
                                              ],
                                            ),
                                          ],
                                        )
                                      : Container()))
                              .values
                              .toList(),
                        ],
                      ),
                    ),
            ),
            SizedBox(height: 10.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 40.sp,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(secondaryColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HistoryScreen()),
                            );
                          },
                          child: Text("History",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)))),
                ],
              ),
            ),
            SizedBox(height: 45.sp),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.48,
                height: 65.sp,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(secondaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(18.0)))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CheckoutScreen()),
                      );
                    },
                    child: const Text("Check-out"))),
            SizedBox(height: 30.sp),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.48,
                height: 65.sp,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(secondaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(18.0)))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CheckinScreen()),
                      );
                    },
                    child: const Text("Check-in")))
          ],
        ),
      )),
    );
  }
}
