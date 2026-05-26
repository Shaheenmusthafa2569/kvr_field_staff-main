import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvr_field_staff/core/theme/app_colors.dart';
import 'package:kvr_field_staff/views/auth/login_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  bool visible = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        visible = true;
      });
    });
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MySigninpage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset("name", fit: BoxFit.cover, height: 150),
            Text(
              "KVR Field Staff",
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 22,
              width: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: AppColors.teal,
              ),
            ),
            SizedBox(height: 15),
            AnimatedOpacity(
              opacity: visible ? 1 : 0,
              duration: Duration(seconds: 2),
              child: Text(
                "Detecting your role...",
                style: GoogleFonts.inter(
                  color: AppColors.background,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
