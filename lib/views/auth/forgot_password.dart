import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvr_field_staff/core/theme/app_colors.dart';
import 'package:kvr_field_staff/views/auth/login_screen.dart';
import 'package:kvr_field_staff/widgets/textformfield.dart';

class Myforgotpasswordpage extends StatelessWidget {
  //  Myforgotpasswordpage({super.key});
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 300,
            child: Card(
              elevation: 7,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Customtextformfield(
                      controller: emailController,
                      hintText: "Email",
                      label: "Email",
                      validator: (p0) {
                        Appvalidators.validateEmail;
                      },
                    ),
                    SizedBox(height: 15),
                    CustomButton(text: "Send Recovery Link", onPressed: () {}),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Myloginpage(),
                          ),
                        );
                      },
                      child: Text(
                        "Back to Sign In",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: AppColors.teal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
