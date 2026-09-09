import 'package:flutter/material.dart';
import 'package:libra/app/themes/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<String> categories = [
    'Semua',
    'Teknologi',
    'Sains',
    'Novel',
    'Bisnis',
  ];

  int selectedCategory = 0;

  final List<Map<String, String>> books = [
    {
      'title': 'Dasar Pemrograman',
      'author': 'Abdul Kadir',
      'category': 'Teknologi',
    },
    {
      'title': 'Pemrograman Flutter',
      'author': 'John Doe',
      'category': 'Teknologi',
    },
    {
      'title': 'Cloud Computing',
      'author': 'Thomas Erl',
      'category': 'Teknologi',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            _buildHomeContent(),
            _buildBooksPage(),
            _buildLoansPage(),
            _buildProfilePage(),
          ],
        ),
      ),

      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColors.background,
        selectedIndex: _currentIndex,

        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Beranda',
          ),

          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book_rounded),
            label: 'Buku',
          ),

          NavigationDestination(
            icon: Icon(Icons.bookmark_outline_rounded),
            selectedIcon: Icon(Icons.bookmark_rounded),
            label: 'Pinjaman',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  // ============================================================
  // HOME CONTENT
  // ============================================================

  Widget _buildHomeContent() {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),

      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),

          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _buildHeader(),

              const SizedBox(height: 24),

              _buildSearch(),

              const SizedBox(height: 28),

              _buildSectionHeader(
                title: 'Kategori',
                action: 'Lihat semua',
                onPressed: () {},
              ),

              const SizedBox(height: 14),

              _buildCategories(),

              const SizedBox(height: 28),

              _buildActiveLoan(),

              const SizedBox(height: 30),

              _buildSectionHeader(
                title: 'Buku Populer',
                action: 'Lihat semua',
                onPressed: () {},
              ),

              const SizedBox(height: 16),

              _buildPopularBooks(),

              const SizedBox(height: 30),

              _buildSectionHeader(
                title: 'Rekomendasi Untukmu',
                action: 'Lihat semua',
                onPressed: () {},
              ),

              const SizedBox(height: 16),

              _buildRecommendation(),

              const SizedBox(height: 20),
            ]),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selamat pagi,',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
              ),

              const SizedBox(height: 4),

              const Text(
                'Julfikar 👋',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Temukan buku favoritmu hari ini.',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
              ),
            ],
          ),
        ),

        Stack(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: const Icon(
                Icons.notifications_none_rounded,
                color: AppColors.iconPrimary,
              ),
            ),

            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.error,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // SEARCH
  // ============================================================

  Widget _buildSearch() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.available,
            style: BorderStyle.solid,
          ),
        ),
        hintText: 'Cari buku, penulis, atau kategori...',

        prefixIcon: const Icon(Icons.search_rounded),

        suffixIcon: Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.tune_rounded,
            color: AppColors.textWhite,
            size: 20,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SECTION HEADER
  // ============================================================

  Widget _buildSectionHeader({
    required String title,
    required String action,
    required VoidCallback onPressed,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        TextButton(
          onPressed: onPressed,
          child: Text(
            action,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // CATEGORIES
  // ============================================================

  Widget _buildCategories() {
    return SizedBox(
      height: 42,

      child: ListView.separated(
        scrollDirection: Axis.horizontal,

        physics: const BouncingScrollPhysics(),

        itemCount: categories.length,

        separatorBuilder: (_, _) {
          return const SizedBox(width: 10);
        },

        itemBuilder: (context, index) {
          final isSelected = selectedCategory == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = index;
              });
            },

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),

              padding: const EdgeInsets.symmetric(horizontal: 18),

              alignment: Alignment.center,

              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.surface,

                borderRadius: BorderRadius.circular(12),

                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.border,
                ),
              ),

              child: Text(
                categories[index],
                style: TextStyle(
                  color: isSelected
                      ? AppColors.textWhite
                      : AppColors.textSecondary,

                  fontSize: 12,

                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // ACTIVE LOAN
  // ============================================================

  Widget _buildActiveLoan() {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: AppColors.primary,

        borderRadius: BorderRadius.circular(18),

        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 15,
            offset: Offset(0, 6),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,

                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: const Icon(
                  Icons.menu_book_rounded,
                  color: AppColors.primary,
                  size: 21,
                ),
              ),

              const SizedBox(width: 12),

              const Expanded(
                child: Text(
                  'Peminjaman Aktif',
                  style: TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.primaryLight,
                size: 14,
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            'Dasar Pemrograman',
            style: TextStyle(
              color: AppColors.textWhite,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'Jatuh tempo: 28 Agustus 2026',
            style: TextStyle(color: AppColors.primaryLight, fontSize: 12),
          ),

          const SizedBox(height: 16),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),

            child: const LinearProgressIndicator(
              value: 0.7,

              minHeight: 7,

              backgroundColor: Color(0xFF356777),

              valueColor: AlwaysStoppedAnimation(AppColors.accent),
            ),
          ),

          const SizedBox(height: 8),

          const Row(
            children: [
              Text(
                'Masa peminjaman',
                style: TextStyle(color: AppColors.primaryLight, fontSize: 11),
              ),

              Spacer(),

              Text(
                '3 hari tersisa',
                style: TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // POPULAR BOOKS
  // ============================================================

  Widget _buildPopularBooks() {
    return SizedBox(
      height: 265,

      child: ListView.separated(
        scrollDirection: Axis.horizontal,

        physics: const BouncingScrollPhysics(),

        itemCount: books.length,

        separatorBuilder: (_, _) {
          return const SizedBox(width: 14);
        },

        itemBuilder: (context, index) {
          return _buildBookCard(books[index]);
        },
      ),
    );
  }

  Widget _buildBookCard(Map<String, String> book) {
    return GestureDetector(
      onTap: () {},

      child: SizedBox(
        width: 145,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              height: 180,

              decoration: BoxDecoration(
                color: AppColors.primarySoft,

                borderRadius: BorderRadius.circular(14),

                border: Border.all(color: AppColors.borderLight),
              ),

              child: Stack(
                children: [
                  const Center(
                    child: Icon(
                      Icons.menu_book_rounded,
                      size: 54,
                      color: AppColors.primary,
                    ),
                  ),

                  Positioned(
                    top: 10,
                    right: 10,

                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 5,
                      ),

                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.circular(7),
                      ),

                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Colors.white,
                            size: 11,
                          ),

                          SizedBox(width: 2),

                          Text(
                            '4.8',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Text(
              book['title'] ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,

              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              book['author'] ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,

              style: const TextStyle(
                color: AppColors.textTertiary,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // RECOMMENDATION
  // ============================================================

  Widget _buildRecommendation() {
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: AppColors.surface,

        borderRadius: BorderRadius.circular(16),

        border: Border.all(color: AppColors.border),
      ),

      child: Row(
        children: [
          Container(
            width: 65,
            height: 80,

            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(10),
            ),

            child: const Icon(
              Icons.auto_stories_rounded,
              color: AppColors.primary,
              size: 30,
            ),
          ),

          const SizedBox(width: 14),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'Rekomendasi untukmu',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  'Belajar Flutter untuk Pemula',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  'Teknologi • 2026',
                  style: TextStyle(color: AppColors.textTertiary, fontSize: 11),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.chevron_right_rounded,
            color: AppColors.iconSecondary,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BOOKS PAGE
  // ============================================================

  Widget _buildBooksPage() {
    return const Center(
      child: Text(
        'Daftar Buku',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
      ),
    );
  }

  // ============================================================
  // LOANS PAGE
  // ============================================================

  Widget _buildLoansPage() {
    return const Center(
      child: Text(
        'Peminjaman',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
      ),
    );
  }

  // ============================================================
  // PROFILE PAGE
  // ============================================================

  Widget _buildProfilePage() {
    return const Center(
      child: Text(
        'Profil',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
      ),
    );
  }
}
