import 'package:flutter/material.dart';

import 'package:libra/app/router/route_names.dart';
import 'package:libra/app/themes/app_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  void _register() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!_agreeTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Silakan setujui syarat dan ketentuan terlebih dahulu.',
          ),
        ),
      );

      return;
    }

    // Sementara hanya untuk testing UI.
    // Nanti akan diganti dengan proses register
    // ke Laravel API.

    Navigator.pushReplacementNamed(context, RouteNames.home);
  }

  void _goToLogin() {
    Navigator.pushReplacementNamed(context, RouteNames.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // =================================================
                // HEADER
                // =================================================
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 58,
                        height: 58,

                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(16),
                        ),

                        child: const Icon(
                          Icons.person_add_alt_1_rounded,
                          color: AppColors.textWhite,
                          size: 30,
                        ),
                      ),

                      const SizedBox(height: 14),

                      const Text(
                        'Buat Akun',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Daftar untuk mulai menggunakan LIBRA.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // =================================================
                // NAMA LENGKAP
                // =================================================
                const Text(
                  'Nama Lengkap',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                TextFormField(
                  controller: _nameController,

                  textInputAction: TextInputAction.next,

                  textCapitalization: TextCapitalization.words,

                  decoration: const InputDecoration(
                    hintText: 'Masukkan nama lengkap',

                    prefixIcon: Icon(Icons.person_outline_rounded),
                  ),

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama lengkap wajib diisi';
                    }

                    if (value.trim().length < 3) {
                      return 'Nama minimal 3 karakter';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

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
                    hintText: 'Masukkan email',

                    prefixIcon: Icon(Icons.email_outlined),
                  ),

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email wajib diisi';
                    }

                    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Masukkan email yang valid';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

                // =================================================
                // NOMOR TELEPON
                // =================================================
                const Text(
                  'Nomor Telepon',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                TextFormField(
                  controller: _phoneController,

                  keyboardType: TextInputType.phone,

                  textInputAction: TextInputAction.next,

                  decoration: const InputDecoration(
                    hintText: 'Masukkan nomor telepon',

                    prefixIcon: Icon(Icons.phone_outlined),
                  ),

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nomor telepon wajib diisi';
                    }

                    if (value.trim().length < 10) {
                      return 'Nomor telepon tidak valid';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

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

                  textInputAction: TextInputAction.next,

                  decoration: InputDecoration(
                    hintText: 'Buat password',

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

                const SizedBox(height: 18),

                // =================================================
                // KONFIRMASI PASSWORD
                // =================================================
                const Text(
                  'Konfirmasi Password',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                TextFormField(
                  controller: _confirmPasswordController,

                  obscureText: _obscureConfirmPassword,

                  textInputAction: TextInputAction.done,

                  onFieldSubmitted: (_) {
                    _register();
                  },

                  decoration: InputDecoration(
                    hintText: 'Ulangi password',

                    prefixIcon: const Icon(Icons.lock_outline_rounded),

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },

                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Konfirmasi password wajib diisi';
                    }

                    if (value != _passwordController.text) {
                      return 'Password tidak sama';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // =================================================
                // TERMS
                // =================================================
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Checkbox(
                      value: _agreeTerms,

                      onChanged: (value) {
                        setState(() {
                          _agreeTerms = value ?? false;
                        });
                      },
                    ),

                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 11),

                        child: Text(
                          'Saya menyetujui syarat dan ketentuan serta kebijakan privasi LIBRA.',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // =================================================
                // REGISTER BUTTON
                // =================================================
                SizedBox(
                  width: double.infinity,
                  height: 52,

                  child: ElevatedButton(
                    onPressed: _register,

                    child: const Text('Daftar'),
                  ),
                ),

                const SizedBox(height: 24),

                // =================================================
                // LOGIN
                // =================================================
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Text(
                      'Sudah memiliki akun? ',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),

                    TextButton(
                      onPressed: _goToLogin,

                      child: const Text('Masuk'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
