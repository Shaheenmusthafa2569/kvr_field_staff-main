import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvr_field_staff/core/theme/app_colors.dart';

class Customtextformfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String label;
  final InputDecoration? decoration;

  const Customtextformfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,

    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    required this.label,
    this.decoration,
  });

  @override
  State<Customtextformfield> createState() => _CustomtextformfieldState();
}

class _CustomtextformfieldState extends State<Customtextformfield> {
  late bool _isObscured;
  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 48,
      child: TextFormField(
        controller: widget.controller,
        obscureText: _isObscured,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        decoration: InputDecoration(
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.navy,
                  ),
                )
              : null,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon)
              : null,
          prefixIconColor: AppColors.navy,
          hintStyle: GoogleFonts.inter(color: AppColors.navy),
          filled: true,
          fillColor: Colors.white,
          labelText: widget.label,
          // alignLabelWithHint: fa,
          labelStyle: GoogleFonts.inter(color: AppColors.navy),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.navy, width: 2),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.blue, width: 2),
          ),

          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.navy, width: 1.5),
          ),

          // Error Styling
          errorStyle: const TextStyle(
            color: AppColors.red,
            fontWeight: FontWeight.w500,
          ),
          
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.red, width: 2),
          ),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 0,
          ),
        ),
      ),
    );
  }
}

class Appvalidators {
  //passwordvalidators
  static String? validatePassword(String? passwordController) {
    if (passwordController == null || passwordController.isEmpty) {
      return "Please enter your password";
    }
    if (passwordController.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!passwordController.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  //emailvalidator
  static String? validateEmail(String? emailController) {
    if (emailController == null || emailController.isEmpty) {
      return "Please enter your email";
    }
    final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (!emailRegExp.hasMatch(emailController)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  //username
  static String? validateUsername(String? UsernameController) {
    if (UsernameController == null || UsernameController.isEmpty) {
      return "Please enter your Username";
    }
    final usernameRegExp = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!usernameRegExp.hasMatch(UsernameController)) {
      return 'Only letters, numbers, and underscores allowed';
    }
    return null;
  }

  //confirmpass
  static String? validateConfirmPassword(
    String confirmPasswordController,
    String passwordController,
  ) {
    if (confirmPasswordController.isEmpty) {
      return "Please enter the password again";
    }
    if (confirmPasswordController != passwordController) {
      return "Password do not match";
    }
    return null;
  }
}
