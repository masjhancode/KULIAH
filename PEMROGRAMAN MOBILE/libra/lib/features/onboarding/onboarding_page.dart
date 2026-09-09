import 'package:flutter/material.dart';

import 'package:libra/app/router/route_names.dart';
import 'package:libra/app/themes/app_colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<OnboardingItem> _items = [
    const OnboardingItem(
      icon: Icons.menu_book_rounded,
      title: 'Temukan Buku Favoritmu',
      description:
          'Cari berbagai koleksi buku perpustakaan dengan mudah dan cepat.',
    ),
    const OnboardingItem(
      icon: Icons.search_rounded,
      title: 'Cari Buku dengan Mudah',
      description:
          'Gunakan fitur pencarian untuk menemukan buku berdasarkan judul, penulis, atau kategori.',
    ),
    const OnboardingItem(
      icon: Icons.bookmark_rounded,
      title: 'Kelola Peminjaman',
      description:
          'Pantau buku yang sedang dipinjam dan tanggal pengembaliannya dalam satu aplikasi.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _goToHome();
    }
  }

  void _skip() {
    _goToHome();
  }

  void _goToHome() {
    if (!mounted) return;

    Navigator.pushReplacementNamed(context, RouteNames.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // =====================================================
            // TOP BAR
            // =====================================================
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: Row(
                children: [
                  // Logo
                  Row(
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: const Icon(
                          Icons.menu_book_rounded,
                          color: AppColors.textWhite,
                          size: 21,
                        ),
                      ),

                      const SizedBox(width: 10),

                      const Text(
                        'LIBRA',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Skip
                  TextButton(
                    onPressed: _skip,
                    child: const Text(
                      'Lewati',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // =====================================================
            // PAGE VIEW
            // =====================================================
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _items.length,

                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },

                itemBuilder: (context, index) {
                  return _buildOnboardingItem(_items[index]);
                },
              ),
            ),

            // =====================================================
            // BOTTOM AREA
            // =====================================================
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 28),
              child: Column(
                children: [
                  // Page indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_items.length, (index) {
                      final isActive = index == _currentPage;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),

                        margin: const EdgeInsets.symmetric(horizontal: 4),

                        width: isActive ? 26 : 8,
                        height: 8,

                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColors.primary
                              : AppColors.border,

                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 28),

                  // Button
                  SizedBox(
                    width: double.infinity,
                    height: 52,

                    child: ElevatedButton(
                      onPressed: _nextPage,

                      child: Text(
                        _currentPage == _items.length - 1
                            ? 'Mulai Sekarang'
                            : 'Lanjutkan',
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Page counter
                  Text(
                    '${_currentPage + 1} dari ${_items.length}',
                    style: const TextStyle(
                      color: AppColors.textTertiary,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =============================================================
  // ONBOARDING ITEM
  // =============================================================

  Widget _buildOnboardingItem(OnboardingItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),

          // Illustration
          Container(
            width: 240,
            height: 240,

            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              shape: BoxShape.circle,
            ),

            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 150,
                  height: 180,

                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(18),

                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.shadow,
                        blurRadius: 20,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(item.icon, size: 70, color: AppColors.primary),

                      const SizedBox(height: 14),

                      Container(
                        width: 70,
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppColors.borderLight,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      const SizedBox(height: 8),

                      Container(
                        width: 50,
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppColors.borderLight,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),

                // Decorative circle
                Positioned(
                  top: 30,
                  right: 30,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                Positioned(
                  bottom: 40,
                  left: 30,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 48),

          // Title
          Text(
            item.title,
            textAlign: TextAlign.center,

            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 25,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 16),

          // Description
          Text(
            item.description,
            textAlign: TextAlign.center,

            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              height: 1.6,
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}

// ===============================================================
// MODEL
// ===============================================================

class OnboardingItem {
  final IconData icon;
  final String title;
  final String description;

  const OnboardingItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}
