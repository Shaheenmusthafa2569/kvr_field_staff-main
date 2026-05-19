import 'package:flutter/material.dart';
import 'package:kvr_field_staff/core/theme/app_colors.dart';
import 'package:kvr_field_staff/widgets/textformfield.dart';

class Myloginpage extends StatelessWidget {
  Myloginpage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("KVR Field Staff"),
            Customtextformfield(
              controller: emailController,
              hintText: "Email Address",
              prefixIcon: Icons.person,
            ),
            SizedBox(height: 20),
            Customtextformfield(
              controller: passwordController,
              hintText: "Password",
              prefixIcon: Icons.lock,
            ),
            Text("Forgot Password?"),
            ElevatedButton(onPressed: () {}, child: Text("Sign In")),
          ],
        ),
      ),
    );
  }
}
