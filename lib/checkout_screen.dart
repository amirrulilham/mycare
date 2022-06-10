import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycare/constant.dart';
import 'package:mycare/model/checkin.model.dart';
import 'package:intl/intl.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<Checkin> checkin = <Checkin>[];

  @override
  void initState() {
    super.initState();
    getCheckin();
  }

  Future<void> getCheckin() async {
    final String response =
        await rootBundle.loadString('asset/json/checkinlist.json');
    final checkindata = checkinFromJson(response);
    setState(() {
      checkin.addAll(checkindata);
    });
  }

  void checkout(int index) {
    setState(() {
      checkin[index].checkin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData().copyWith(color: Colors.black),
      ),
      body: SafeArea(
          bottom: false,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
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
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: checkin.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Align(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.sp),
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5)),
                          child: checkin.isEmpty
                              ? Container()
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0.sp, vertical: 25.sp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Check In at:",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w700,
                                              color: secondaryColor)),
                                      SizedBox(height: 15.sp),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(checkin[index].locationName!,
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
                                                      .format(checkin[index]
                                                          .createdAt!),
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
                                      ),
                                      SizedBox(height: 20.sp),
                                      checkin[index].checkin!
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.25,
                                                    height: 40.sp,
                                                    child: ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty.all(
                                                                    secondaryColor),
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0)))),
                                                        onPressed: () {
                                                          checkout(index);
                                                        },
                                                        child: Text("Checkout",
                                                            style: TextStyle(
                                                                fontSize: 12.sp,
                                                                fontWeight: FontWeight.w400,
                                                                color: Colors.white)))),
                                              ],
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
