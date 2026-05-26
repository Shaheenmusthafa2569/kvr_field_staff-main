import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvr_field_staff/core/theme/app_colors.dart';

class Myhomepage extends StatelessWidget {
  const Myhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.navy,
        title: Text(
          "KVR Field Staff",
          style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(child: Text("On Construction", )),
    );
  }
}
