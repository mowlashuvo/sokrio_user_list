import 'package:flutter/material.dart';

import '../theme/design_system.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isDisabled;
  final bool isSubmitting;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isDisabled = false,
    this.isSubmitting = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDisabled
              ? AppColors.disabledBackground
              : AppColors.primaryAction,
          foregroundColor: AppColors.surfacePrimary,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadii.borderRPill,
          ),
          padding: const EdgeInsets.symmetric(vertical: AppSpaces.s16),
          elevation: 0, // Flat design without shadow
        ),
        child: isSubmitting
            ? const CircularProgressIndicator.adaptive()
            : Text(
                text,
                style: AppTextStyles.button.copyWith(
                  color: isDisabled
                      ? AppColors.secondaryText
                      : AppColors.surfacePrimary,
                ),
              ),
      ),
    );
  }
}
