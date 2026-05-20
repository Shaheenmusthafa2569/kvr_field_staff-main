import 'package:flutter/material.dart';
import 'package:kvr_field_staff/core/theme/app_colors.dart';

class Customtextformfield extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        prefixIconColor: AppColors.navy,
        hintStyle: TextStyle(color: AppColors.navy),
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        alignLabelWithHint: true,
        labelStyle: TextStyle(color: AppColors.navy),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.navy, width: 2),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.blue, width: 2),
        ),

        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.navy, width: 1.5),
        ),

        // Error Styling
        errorStyle: const TextStyle(
          color: AppColors.red,
          fontWeight: FontWeight.w500,
        ),
        helperText: "",
        helperStyle: TextStyle(fontSize: 12, height: 1),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.red, width: 2),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
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
    if (confirmPasswordController == null ||
        confirmPasswordController.isEmpty) {
      return "Please enter the password again";
    }
    if (confirmPasswordController != passwordController) {
      return "Password do not match";
    }
    return null;
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool isLoading;
  final bool isFullWidth;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor = AppColors.background,
    this.backgroundColor = AppColors.navy,
    this.isFullWidth = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: 48, // Premium height for better touch targets
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 2,
          shadowColor: backgroundColor.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
      ),
    );
  }
}
