import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvr_field_staff/core/theme/app_colors.dart';
import 'package:kvr_field_staff/core/theme/app_spacing.dart';
import 'package:kvr_field_staff/views/staff/staff_home_sccree.dart';

class StaffClockInSccreen extends StatelessWidget {
  const StaffClockInSccreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "CLOCKED IN",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.teal.withOpacity(0.25),

                            blurRadius: 15,
                            offset: Offset(0, 6),
                          ),
                        ],
                        gradient: LinearGradient(
                          begin: AlignmentGeometry.topStart,
                          colors: [AppColors.teal, AppColors.blue],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6,
                              ),

                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(30),
                              ),

                              child: Text(
                                "ACTIVE",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),

                            SizedBox(height: 24),

                            Text(
                              "02:14:32",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 10),

                            Text(
                              "You are currently working",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),

                            SizedBox(height: 24),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),

                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(16),
                              ),

                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                    size: 18,
                                  ),

                                  SizedBox(width: 8),

                                  Text(
                                    "Clocked in at 09:42 AM",
                                    style: GoogleFonts.inter(
                                      color: Colors.white.withOpacity(0.7),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 28),

                            SizedBox(
                              width: double.infinity,
                              height: 48,

                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: AppColors.teal,

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),

                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StaffHomeSccreen(),
                                    ),
                                  );
                                },

                                child: Text(
                                  "Clock Out",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),

                                decoration: BoxDecoration(
                                  color: AppColors.teal.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),

                                child: Icon(
                                  Icons.work_outline,
                                  color: AppColors.teal,
                                ),
                              ),

                              SizedBox(width: 12),

                              Text(
                                "Current Task",
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.navy,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16),

                          Text(
                            "task name",
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),

                          SizedBox(height: 10),

                          Text(
                            "In Progress",
                            style: GoogleFonts.inter(
                              color: AppColors.teal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),

                                decoration: BoxDecoration(
                                  color: AppColors.teal.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),

                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.teal,
                                ),
                              ),

                              SizedBox(width: 12),

                              Text(
                                "GPS/Location Activity",
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.navy,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16),

                          Text(
                            "location name",
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),

                          SizedBox(height: 10),

                          Text(
                            "In Progress",
                            style: GoogleFonts.inter(
                              color: AppColors.teal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
