import 'package:flutter/material.dart';
import 'package:libra/app/themes/app_colors.dart';

class SplaseLogo extends StatelessWidget {
  const SplaseLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Logo
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(28),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowStrong,
                blurRadius: 30,
                offset: Offset(0, 12),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.menu_book_rounded,
              size: 52,
              color: AppColors.primary,
            ),
          ),
        ),

        const SizedBox(height: 28),

        // LIBRA
        const Text(
          'LIBRA',
          style: TextStyle(
            color: AppColors.textWhite,
            fontSize: 38,
            fontWeight: FontWeight.w700,
            letterSpacing: 6,
          ),
        ),

        const SizedBox(height: 8),

        // Tagline
        const Text(
          'Library Management System',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primaryLight,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.8,
          ),
        ),

        const SizedBox(height: 24),

        // Accent line
        Container(
          width: 45,
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
