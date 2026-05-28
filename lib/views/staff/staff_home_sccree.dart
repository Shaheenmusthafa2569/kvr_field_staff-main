import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvr_field_staff/core/theme/app_colors.dart';
import 'package:kvr_field_staff/core/theme/app_spacing.dart';
import 'package:kvr_field_staff/widgets/primarybutton.dart';

class StaffHomeSccreen extends StatefulWidget {
  const StaffHomeSccreen({super.key});

  @override
  State<StaffHomeSccreen> createState() => _StaffHomeSccreenState();
}

class _StaffHomeSccreenState extends State<StaffHomeSccreen> {
  String twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  DateTime currentTime = DateTime.now();
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String period = currentTime.hour >= 12 ? "PM" : "AM";

    int hour = currentTime.hour > 12 ? currentTime.hour - 12 : currentTime.hour;

    if (hour == 0) {
      hour = 12;
    }
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Stack(
        children: [
          Container(
            height: 300,
            width: double.infinity,

            decoration: BoxDecoration(
              color: AppColors.navy,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.teal,
                        child: Icon(Icons.person),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Morning",
                            style: GoogleFonts.inter(
                              color: AppColors.background,
                            ),
                          ),
                          Text(
                            "Employee 1",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${twoDigits(hour)}:${twoDigits(currentTime.minute)} $period",
                    style: GoogleFonts.inter(
                      // color: Colors.white,
                      color: AppColors.blue,
                      fontSize: 45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),

                  Card(
                    elevation: 6,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),

                    child: SizedBox(
                      height: 200,
                      width: double.infinity,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Not Clocked In",
                            style: GoogleFonts.inter(
                              color: AppColors.navy,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: AppSpacing.sm),
                          Text(
                            "Attendance",
                            style: GoogleFonts.inter(
                              color: AppColors.navy.withOpacity(0.9),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: AppSpacing.xl,
                              right: AppSpacing.xl,
                              top: AppSpacing.sm,
                            ),
                            child: PrimaryCustomButton(
                              text: "Clock In",
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Analytics",
                          style: GoogleFonts.inter(
                            color: AppColors.navy,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
                          },
                          child: Text(
                            "View all",
                            style: GoogleFonts.inter(
                              color: AppColors.teal,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),

                          child: SizedBox(
                            height: 200,

                            child: Padding(
                              padding: const EdgeInsets.all(AppSpacing.sm),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Today",
                                    style: GoogleFonts.inter(
                                      color: AppColors.navy,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "3h",
                                    style: GoogleFonts.inter(
                                      color: AppColors.teal,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Today's working hours",
                                    style: GoogleFonts.inter(
                                      color: AppColors.navy.withOpacity(0.8),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),

                          child: SizedBox(
                            height: 200,

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text("Hours")],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
