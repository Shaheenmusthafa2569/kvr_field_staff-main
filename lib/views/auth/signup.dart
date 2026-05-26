import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvr_field_staff/core/theme/app_colors.dart';
import 'package:kvr_field_staff/core/theme/app_spacing.dart';
import 'package:kvr_field_staff/views/auth/login_screen.dart';
import 'package:kvr_field_staff/views/myhomepage.dart';
import 'package:kvr_field_staff/widgets/primarybutton.dart';
import 'package:kvr_field_staff/widgets/textformfield.dart';

class Mysignuppage extends StatefulWidget {
  Mysignuppage({super.key});

  @override
  State<Mysignuppage> createState() => _MysignuppageState();
}

class _MysignuppageState extends State<Mysignuppage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Center(
          child: SizedBox(
            height: 600,
            child: Card(
              elevation: 7,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create Your Account",
                        style: GoogleFonts.inter(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: AppColors.navy,
                        ),
                      ),
                      SizedBox(height: AppSpacing.md),
                      Customtextformfield(
                        controller: usernameController,
                        hintText: "Username",
                        prefixIcon: Icons.person,
                        label: "Username",
                        validator: Appvalidators.validateUsername,
                      ),
                      SizedBox(height: AppSpacing.sm),
                      Customtextformfield(
                        controller: emailController,
                        hintText: "Email Address",
                        label: "Email Address",
                        prefixIcon: Icons.mail,
                        validator: Appvalidators.validateEmail,
                      ),
                      SizedBox(height: AppSpacing.sm),
                      Customtextformfield(
                        controller: passwordController,
                        hintText: "Password",
                        prefixIcon: Icons.lock,
                        label: "Password",
                        obscureText: true,
                        validator: Appvalidators.validatePassword,
                      ),
                      SizedBox(height: AppSpacing.sm),
                      Customtextformfield(
                        controller: confirmPasswordController,
                        hintText: "Confirm Password",
                        label: "Confirm Password",
                        prefixIcon: Icons.lock,
                        obscureText: true,
                        validator: (p0) =>
                            Appvalidators.validateConfirmPassword(
                              confirmPasswordController.text,
                              passwordController.text,
                            ),
                      ),
                      SizedBox(height: AppSpacing.sm),
                      PrimaryCustomButton(
                        text: "Get Started",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("Login successful");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Myhomepage(),
                              ),
                            );
                          } else {
                            print("Login failed due to invalid errors");
                          }
                        },
                      ),
                      SizedBox(height: AppSpacing.lg),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              color: AppColors.navy,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MySigninpage(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign in",
                              style: GoogleFonts.inter(
                                color: AppColors.teal,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
