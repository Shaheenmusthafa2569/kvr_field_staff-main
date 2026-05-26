import 'package:flutter/material.dart';
import 'package:kvr_field_staff/core/theme/app_colors.dart';

class PrimaryCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const PrimaryCustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null || isLoading;

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: Opacity(
        opacity: isDisabled ? 0.6 : 1,
        child: ElevatedButton(
          onPressed: isDisabled ? null : onPressed,

          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.teal,
            foregroundColor: Colors.white,
            elevation: 0,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}