import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvr_field_staff/core/theme/app_colors.dart';
import 'package:kvr_field_staff/views/auth/login_screen.dart';
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
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            height: 600,
            child: Card(
              elevation: 7,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
                      SizedBox(height: 12),
                      Customtextformfield(
                        controller: usernameController,
                        hintText: "Username",
                        prefixIcon: Icons.person,
                        label: "Username",
                        validator: Appvalidators.validateUsername,
                      ),
                      SizedBox(height: 5),
                      Customtextformfield(
                        controller: emailController,
                        hintText: "Email Address",
                        label: "Email Address",
                        prefixIcon: Icons.mail,
                        validator: Appvalidators.validateEmail,
                      ),
                      SizedBox(height: 11),
                      Customtextformfield(
                        controller: passwordController,
                        hintText: "Password",
                        prefixIcon: Icons.lock,
                        label: "Password",
                        obscureText: true,
                        validator: Appvalidators.validatePassword,
                      ),
                      SizedBox(height: 11),
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
                      SizedBox(height: 11),
                      CustomButton(
                        text: "Get Started",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Myloginpage(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.navy,
                            ),
                          ),
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
                              "Sign in",
                              style: TextStyle(
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
