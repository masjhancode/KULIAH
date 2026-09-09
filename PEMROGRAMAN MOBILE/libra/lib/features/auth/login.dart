import 'package:flutter/material.dart';

import 'package:libra/app/router/route_names.dart';
import 'package:libra/app/themes/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Sementara hanya untuk testing UI.
    // Nanti akan diganti dengan proses login ke Laravel API.

    Navigator.pushReplacementNamed(context, RouteNames.home);
  }

  void _goToRegister() {
    Navigator.pushNamed(context, RouteNames.register);
  }

  void _forgotPassword() {
    Navigator.pushNamed(context, RouteNames.forgotPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 32),

                // =================================================
                // LOGO
                // =================================================
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 64,
                        height: 64,

                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(18),
                        ),

                        child: const Icon(
                          Icons.menu_book_rounded,
                          color: AppColors.textWhite,
                          size: 34,
                        ),
                      ),

                      const SizedBox(height: 14),

                      const Text(
                        'LIBRA',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                // =================================================
                // TITLE
                // =================================================
                const Text(
                  'Selamat Datang Kembali',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Masuk untuk melanjutkan ke akun LIBRA Anda.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 32),

                // =================================================
                // EMAIL
                // =================================================
                const Text(
                  'Email',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                TextFormField(
                  controller: _emailController,

                  keyboardType: TextInputType.emailAddress,

                  textInputAction: TextInputAction.next,

                  decoration: const InputDecoration(
                    hintText: 'Masukkan email Anda',

                    prefixIcon: Icon(Icons.email_outlined),
                  ),

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email wajib diisi';
                    }

                    if (!value.contains('@')) {
                      return 'Masukkan email yang valid';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // =================================================
                // PASSWORD
                // =================================================
                const Text(
                  'Password',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                TextFormField(
                  controller: _passwordController,

                  obscureText: _obscurePassword,

                  textInputAction: TextInputAction.done,

                  onFieldSubmitted: (_) {
                    _login();
                  },

                  decoration: InputDecoration(
                    hintText: 'Masukkan password Anda',

                    prefixIcon: const Icon(Icons.lock_outline_rounded),

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },

                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password wajib diisi';
                    }

                    if (value.length < 6) {
                      return 'Password minimal 6 karakter';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 12),

                // =================================================
                // REMEMBER + FORGOT
                // =================================================
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,

                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                    ),

                    const Text(
                      'Ingat saya',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),

                    const Spacer(),

                    TextButton(
                      onPressed: _forgotPassword,

                      child: const Text('Lupa password?'),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // =================================================
                // LOGIN BUTTON
                // =================================================
                SizedBox(
                  width: double.infinity,
                  height: 52,

                  child: ElevatedButton(
                    onPressed: _login,

                    child: const Text('Masuk'),
                  ),
                ),

                const SizedBox(height: 28),

                // =================================================
                // DIVIDER
                // =================================================
                Row(
                  children: [
                    const Expanded(child: Divider()),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),

                      child: Text(
                        'atau',
                        style: TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 12,
                        ),
                      ),
                    ),

                    const Expanded(child: Divider()),
                  ],
                ),

                const SizedBox(height: 28),

                // =================================================
                // REGISTER
                // =================================================
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Text(
                      'Belum memiliki akun? ',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),

                    TextButton(
                      onPressed: _goToRegister,

                      child: const Text('Daftar'),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
