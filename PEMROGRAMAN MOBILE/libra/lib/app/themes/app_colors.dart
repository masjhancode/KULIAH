import 'package:flutter/material.dart';

/// Design System Color Palette untuk LIBRA
/// Library Management System
class AppColors {
  AppColors._();

  // ============================================================
  // BRAND COLORS
  // ============================================================

  /// Warna utama LIBRA
  static const Color primary = Color(0xFF174A5B);

  /// Primary untuk state lebih gelap
  static const Color primaryDark = Color(0xFF123C4A);

  /// Primary dengan tone lebih terang
  static const Color primaryLight = Color(0xFFD5EEF2);

  /// Primary dengan opacity / tint tambahan
  static const Color primarySoft = Color(0xFFEAF5F6);

  /// Warna secondary
  static const Color secondary = Color(0xFF4F6F68);

  /// Accent / gold
  static const Color accent = Color(0xFFC8953E);

  /// Accent soft
  static const Color accentSoft = Color(0xFFF7EEDC);

  // ============================================================
  // BACKGROUND
  // ============================================================

  /// Background utama aplikasi
  static const Color background = Color(0xFFF8F9F7);

  /// Background halaman alternatif
  static const Color backgroundSecondary = Color(0xFFF2F5F4);

  /// Background untuk section tertentu
  static const Color backgroundTertiary = Color(0xFFEDF2F1);

  // ============================================================
  // SURFACE
  // ============================================================

  /// Surface utama / Card
  static const Color surface = Color(0xFFFFFFFF);

  /// Surface kedua
  static const Color surfaceSecondary = Color(0xFFF9FAFA);

  /// Surface untuk hover
  static const Color surfaceHover = Color(0xFFF3F7F7);

  /// Surface untuk selected state
  static const Color surfaceSelected = Color(0xFFEAF5F6);

  /// Surface untuk disabled
  static const Color surfaceDisabled = Color(0xFFE9ECEC);

  // ============================================================
  // TEXT COLORS
  // ============================================================

  /// Text utama
  static const Color textPrimary = Color(0xFF172124);

  /// Text sekunder
  static const Color textSecondary = Color(0xFF647174);

  /// Text tersier / caption
  static const Color textTertiary = Color(0xFF8A9699);

  /// Text disabled
  static const Color textDisabled = Color(0xFFA7B0B2);

  /// Text di atas primary
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  /// Text di atas accent
  static const Color textOnAccent = Color(0xFFFFFFFF);

  /// Text putih
  static const Color textWhite = Color(0xFFFFFFFF);

  // ============================================================
  // BORDER & DIVIDER
  // ============================================================

  /// Border utama
  static const Color border = Color(0xFFDDE3E4);

  /// Border lebih terang
  static const Color borderLight = Color(0xFFE8EDEE);

  /// Border lebih gelap
  static const Color borderDark = Color(0xFFC5CDCF);

  /// Divider
  static const Color divider = Color(0xFFE2E7E8);

  // ============================================================
  // SEMANTIC COLORS
  // ============================================================

  // -------------------------
  // SUCCESS
  // -------------------------

  static const Color success = Color(0xFF2E7D5B);

  static const Color successLight = Color(0xFFE5F3EC);

  static const Color successBorder = Color(0xFFB9DEC9);

  static const Color successText = Color(0xFF236447);

  // -------------------------
  // WARNING
  // -------------------------

  static const Color warning = Color(0xFFB7791F);

  static const Color warningLight = Color(0xFFFFF3DC);

  static const Color warningBorder = Color(0xFFE8CF9E);

  static const Color warningText = Color(0xFF8A5A14);

  // -------------------------
  // ERROR
  // -------------------------

  static const Color error = Color(0xFFBA3A3A);

  static const Color errorLight = Color(0xFFFBE8E8);

  static const Color errorBorder = Color(0xFFE8B9B9);

  static const Color errorText = Color(0xFF922D2D);

  // -------------------------
  // INFO
  // -------------------------

  static const Color info = Color(0xFF287D9B);

  static const Color infoLight = Color(0xFFE5F3F8);

  static const Color infoBorder = Color(0xFFB7D9E4);

  static const Color infoText = Color(0xFF21667E);

  // ============================================================
  // STATUS COLORS
  // ============================================================

  /// Buku tersedia
  static const Color available = Color(0xFF2E7D5B);

  /// Buku sedang dipinjam
  static const Color borrowed = Color(0xFF287D9B);

  /// Buku terlambat
  static const Color overdue = Color(0xFFBA3A3A);

  /// Buku rusak
  static const Color damaged = Color(0xFFB7791F);

  /// Buku hilang
  static const Color lost = Color(0xFF6B4C4C);

  /// Transaksi pending
  static const Color pending = Color(0xFFB7791F);

  /// Transaksi selesai
  static const Color completed = Color(0xFF2E7D5B);

  /// Transaksi dibatalkan
  static const Color cancelled = Color(0xFF647174);

  // ============================================================
  // ICON COLORS
  // ============================================================

  static const Color iconPrimary = Color(0xFF174A5B);

  static const Color iconSecondary = Color(0xFF647174);

  static const Color iconTertiary = Color(0xFF8A9699);

  static const Color iconDisabled = Color(0xFFA7B0B2);

  static const Color iconOnPrimary = Color(0xFFFFFFFF);

  // ============================================================
  // INPUT COLORS
  // ============================================================

  /// Background input
  static const Color inputBackground = Color(0xFFFFFFFF);

  /// Border input
  static const Color inputBorder = Color(0xFFDDE3E4);

  /// Border input ketika focus
  static const Color inputFocusBorder = Color(0xFF174A5B);

  /// Border input ketika error
  static const Color inputErrorBorder = Color(0xFFBA3A3A);

  /// Placeholder
  static const Color inputPlaceholder = Color(0xFF8A9699);

  /// Text input
  static const Color inputText = Color(0xFF172124);

  // ============================================================
  // NAVIGATION
  // ============================================================

  /// Background bottom navigation
  static const Color navigationBackground = Color(0xFFFFFFFF);

  /// Icon navigation aktif
  static const Color navigationActive = Color(0xFF174A5B);

  /// Icon navigation tidak aktif
  static const Color navigationInactive = Color(0xFF8A9699);

  /// Indicator navigation
  static const Color navigationIndicator = Color(0xFFD5EEF2);

  // ============================================================
  // OVERLAY
  // ============================================================

  /// Overlay ketika modal / dialog
  static const Color overlay = Color(0x66000000);

  /// Scrim
  static const Color scrim = Color(0x52000000);

  // ============================================================
  // CHART COLORS
  // ============================================================

  /// Warna chart utama
  static const Color chartPrimary = Color(0xFF174A5B);

  /// Warna chart secondary
  static const Color chartSecondary = Color(0xFF4F6F68);

  /// Warna chart accent
  static const Color chartAccent = Color(0xFFC8953E);

  /// Chart success
  static const Color chartSuccess = Color(0xFF2E7D5B);

  /// Chart warning
  static const Color chartWarning = Color(0xFFB7791F);

  /// Chart error
  static const Color chartError = Color(0xFFBA3A3A);

  /// Chart info
  static const Color chartInfo = Color(0xFF287D9B);

  // ============================================================
  // SHADOW
  // ============================================================

  /// Warna shadow card
  static const Color shadow = Color(0x14000000);

  /// Shadow lebih kuat untuk modal
  static const Color shadowStrong = Color(0x24000000);
}
