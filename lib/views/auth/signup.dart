import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvr_field_staff/core/theme/app_colors.dart';
import 'package:kvr_field_staff/views/auth/login_screen.dart';
import 'package:kvr_field_staff/widgets/textformfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/main.dart';

class Mysignuppage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> saveData(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final preferrenceVariable = await SharedPreferences.getInstance();
      await preferrenceVariable.setString("Username", usernameController.text);
      await preferrenceVariable.setString("Email", emailController.text);
      await preferrenceVariable.setString("Password", passwordController.text);
      await preferrenceVariable.setString(
        "Confirmed Password",
        confirmPasswordController.text,
      );
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Saved Sign in successfully")));
  }

  Future<void> cleardata() async {
    final preferrenceVariable = await SharedPreferences.getInstance();
    await preferrenceVariable.clear();
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  Mysignuppage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
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
              SizedBox(height: 11),
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
                validator: Appvalidators.validatePassword,
              ),
              SizedBox(height: 11),
              Customtextformfield(
                controller: confirmPasswordController,
                hintText: "Confirm Password",
                label: "Confirm Password",
                prefixIcon: Icons.lock,
                validator: (p0) => Appvalidators.validateConfirmPassword(
                  confirmPasswordController.text,
                  passwordController.text,
                ),
              ),
              SizedBox(height: 11),
              CustomButton(
                text: "Get Started",
                onPressed: () {
                  saveData(context);
                },
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Myloginpage()),
                      );
                    },
                    child: Text("Sign in"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
