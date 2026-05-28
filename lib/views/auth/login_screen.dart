import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvr_field_staff/core/theme/app_colors.dart';
import 'package:kvr_field_staff/core/theme/app_spacing.dart';
import 'package:kvr_field_staff/views/auth/forgot_password.dart';
import 'package:kvr_field_staff/views/auth/signup.dart';
import 'package:kvr_field_staff/views/staff/staff_home_sccree.dart';
import 'package:kvr_field_staff/widgets/primarybutton.dart';
import 'package:kvr_field_staff/widgets/textformfield.dart';

class MySigninpage extends StatefulWidget {
  const MySigninpage({super.key});

  @override
  State<MySigninpage> createState() => _MySigninpageState();
}

class _MySigninpageState extends State<MySigninpage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: SizedBox(
            height: 500,
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
                      SizedBox(height: AppSpacing.xs),
                      Text(
                        "Sign in to access your dashboard",
                        style: GoogleFonts.inter(
                          color: AppColors.navy,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: AppSpacing.lg),
                      Customtextformfield(
                        controller: emailController,
                        hintText: "Email Address",
                        prefixIcon: Icons.mail,
                        label: "Email Address",
                        validator: Appvalidators.validateEmail,
                      ),
                      SizedBox(height: AppSpacing.md),
                      Customtextformfield(
                        controller: passwordController,
                        hintText: "Password",
                        prefixIcon: Icons.lock,
                        label: "Password",
                        obscureText: true,
                        validator: Appvalidators.validatePassword,
                      ),
                      SizedBox(height: AppSpacing.md),
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

                      SizedBox(height: AppSpacing.md),
                      PrimaryCustomButton(
                        text: "Sign in",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("Login successful");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StaffHomeSccreen(),
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
                            "Dont have an Account yet? ",
                            style: GoogleFonts.inter(
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
// child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,

//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Good Morning",
//                                 style: GoogleFonts.inter(
//                                   color: AppColors.background,
//                                 ),
//                               ),
//                               Text(
//                                 "Employee 1",
//                                 style: GoogleFonts.inter(
//                                   color: Colors.white,
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),

//                           CircleAvatar(
//                             radius: 24,
//                             backgroundColor: AppColors.teal,
//                             child: Icon(Icons.person),
//                           ),
//                         ],
//                       ),