import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvr_field_staff/core/theme/app_colors.dart';
import 'package:kvr_field_staff/views/auth/forgot_password.dart';
import 'package:kvr_field_staff/views/auth/signup.dart';
import 'package:kvr_field_staff/widgets/textformfield.dart';

class Myloginpage extends StatefulWidget {
  Myloginpage({super.key});

  @override
  State<Myloginpage> createState() => _MyloginpageState();
}

class _MyloginpageState extends State<Myloginpage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 500,
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
                        "KVR Field Staff",
                        style: GoogleFonts.inter(
                          color: AppColors.navy,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(height: 5),
                      // Text(
                      //   "Welcome Back",
                      //   style: GoogleFonts.inter(
                      //     fontSize: 25,
                      //     fontWeight: FontWeight.w500,
                      //     color: AppColors.teal,
                      //   ),
                      // ),
                      SizedBox(height: 5),
                      Text(
                        "Sign in to access your dashboard",
                        style: GoogleFonts.inter(
                          color: AppColors.navy,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 15),
                      Customtextformfield(
                        controller: emailController,
                        hintText: "Email Address",
                        prefixIcon: Icons.mail,
                        label: "Email Address",
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

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Myforgotpasswordpage(),
                            ),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.inter(
                            color: AppColors.teal,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      CustomButton(
                        text: "Sign in",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("Login successful");
                          } else {
                            print("Login failed due to invalid errors");
                          }
                        },
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont have an Account yet? ",
                            style: TextStyle(
                              color: AppColors.navy,
                              fontSize: 15,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Mysignuppage(),
                                ),
                              );
                            },
                            child: Text(
                              "Signup",
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
