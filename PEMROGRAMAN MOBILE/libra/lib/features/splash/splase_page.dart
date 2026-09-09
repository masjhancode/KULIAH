import 'dart:async';

import 'package:flutter/material.dart';
import 'package:libra/app/router/route_names.dart';
import 'package:libra/app/themes/app_colors.dart';
import 'package:libra/features/splash/splase_logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _scaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _animationController.forward();

    Timer(const Duration(seconds: 3), _navigateToNextPage);
  }

  void _navigateToNextPage() {
    if (!mounted) return;

    Navigator.pushReplacementNamed(context, RouteNames.onboarding);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Stack(
          children: [
            // Decorative elements
            Positioned(
              top: -100,
              right: -80,
              child: _buildCircle(size: 240, color: AppColors.primaryDark),
            ),

            Positioned(
              bottom: -120,
              left: -100,
              child: _buildCircle(size: 280, color: AppColors.primaryDark),
            ),

            // Main content
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: SplaseLogo(),
                ),
              ),
            ),

            // Bottom information
            Positioned(
              left: 0,
              right: 0,
              bottom: 30,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: const Column(
                  children: [
                    Text(
                      'Library Management System',
                      style: TextStyle(
                        color: AppColors.primaryLight,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.4,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Version 1.0.0',
                      style: TextStyle(
                        color: AppColors.primaryLight,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircle({required double size, required Color color}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.45),
      ),
    );
  }
}
