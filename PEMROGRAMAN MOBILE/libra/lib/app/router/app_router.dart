import 'package:flutter/material.dart';

import 'package:libra/app/router/route_names.dart';
import 'package:libra/features/auth/login.dart';
import 'package:libra/features/auth/register_page.dart';
import 'package:libra/features/home/home_page.dart';
import 'package:libra/features/onboarding/onboarding_page.dart';
import 'package:libra/features/splash/splase_page.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Splash Screen
      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: settings,
        );

      // Onboarding
      case RouteNames.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
          settings: settings,
        );

      // login
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
          settings: settings,
        );

      case RouteNames.register:
        return MaterialPageRoute(
          builder: (_) => RegisterPage(),
          settings: settings,
        );

      // Home Page
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );

      // Default jika route tidak ditemukan
      default:
        return MaterialPageRoute(
          builder: (_) => UnknownRoutePage(routeName: settings.name),
          settings: settings,
        );
    }
  }
}

class UnknownRoutePage extends StatelessWidget {
  final String? routeName;

  const UnknownRoutePage({super.key, this.routeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Halaman Tidak Ditemukan')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline_rounded,
                size: 70,
                color: Colors.red,
              ),
              const SizedBox(height: 20),
              const Text(
                '404',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Halaman tidak ditemukan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                'Route ${routeName ?? "-"} belum terdaftar.',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.home,
                    (route) => false,
                  );
                },
                child: const Text('Kembali ke Beranda'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
