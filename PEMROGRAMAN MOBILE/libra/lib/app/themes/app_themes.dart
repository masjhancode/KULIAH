import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      // ============================================================
      // COLOR SCHEME
      // ============================================================
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.textOnPrimary,

        primaryContainer: AppColors.primaryLight,
        onPrimaryContainer: AppColors.primaryDark,

        secondary: AppColors.secondary,
        onSecondary: AppColors.textOnPrimary,

        secondaryContainer: AppColors.primarySoft,
        onSecondaryContainer: AppColors.primaryDark,

        tertiary: AppColors.accent,
        onTertiary: AppColors.textOnAccent,

        tertiaryContainer: AppColors.accentSoft,
        onTertiaryContainer: AppColors.textPrimary,

        error: AppColors.error,
        onError: AppColors.textOnPrimary,

        errorContainer: AppColors.errorLight,
        onErrorContainer: AppColors.errorText,

        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,

        surfaceContainerHighest: AppColors.backgroundSecondary,
        onSurfaceVariant: AppColors.textSecondary,

        outline: AppColors.border,
        outlineVariant: AppColors.borderLight,
      ),

      // ============================================================
      // SCAFFOLD
      // ============================================================
      scaffoldBackgroundColor: AppColors.background,

      // ============================================================
      // APP BAR
      // ============================================================
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,

        elevation: 0,
        scrolledUnderElevation: 0,

        surfaceTintColor: Colors.transparent,

        centerTitle: false,

        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),

        iconTheme: IconThemeData(color: AppColors.iconPrimary, size: 24),
      ),

      // ============================================================
      // CARD
      // ============================================================
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.border, width: 1),
        ),
      ),

      // ============================================================
      // ELEVATED BUTTON
      // ============================================================
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(Size(0, 48)),

          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          ),

          backgroundColor: const WidgetStatePropertyAll(AppColors.primary),

          foregroundColor: const WidgetStatePropertyAll(
            AppColors.textOnPrimary,
          ),

          elevation: const WidgetStatePropertyAll(0),

          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),

          textStyle: const WidgetStatePropertyAll(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ),

      // ============================================================
      // OUTLINED BUTTON
      // ============================================================
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(Size(0, 48)),

          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          ),

          foregroundColor: const WidgetStatePropertyAll(AppColors.primary),

          side: const WidgetStatePropertyAll(
            BorderSide(color: AppColors.border, width: 1),
          ),

          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),

          textStyle: const WidgetStatePropertyAll(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ),

      // ============================================================
      // TEXT BUTTON
      // ============================================================
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: const WidgetStatePropertyAll(AppColors.primary),

          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),

          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),

          textStyle: const WidgetStatePropertyAll(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ),

      // ============================================================
      // INPUT / TEXT FIELD
      // ============================================================
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.inputBackground,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),

        hintStyle: const TextStyle(
          color: AppColors.inputPlaceholder,
          fontSize: 14,
        ),

        labelStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
        ),

        prefixIconColor: AppColors.iconSecondary,
        suffixIconColor: AppColors.iconSecondary,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.inputBorder),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.inputBorder),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.inputFocusBorder,
            width: 1.5,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.inputErrorBorder),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.inputErrorBorder,
            width: 1.5,
          ),
        ),

        errorStyle: const TextStyle(color: AppColors.error, fontSize: 12),
      ),

      // ============================================================
      // NAVIGATION BAR
      // ============================================================
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.navigationBackground,

        indicatorColor: AppColors.navigationIndicator,

        elevation: 0,

        height: 72,

        labelTextStyle: const WidgetStatePropertyAll(
          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),

        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(
              color: AppColors.navigationActive,
              size: 24,
            );
          }

          return const IconThemeData(
            color: AppColors.navigationInactive,
            size: 23,
          );
        }),
      ),

      // ============================================================
      // CHIP
      // ============================================================
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.backgroundSecondary,

        selectedColor: AppColors.primaryLight,

        disabledColor: AppColors.surfaceDisabled,

        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),

        labelStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),

        side: const BorderSide(color: AppColors.border),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),

      // ============================================================
      // DIALOG
      // ============================================================
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,

        surfaceTintColor: Colors.transparent,

        elevation: 8,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

        titleTextStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),

        contentTextStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
          height: 1.5,
        ),
      ),

      // ============================================================
      // SNACKBAR
      // ============================================================
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.textPrimary,

        behavior: SnackBarBehavior.floating,

        elevation: 0,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

        contentTextStyle: const TextStyle(
          color: AppColors.textWhite,
          fontSize: 14,
        ),
      ),

      // ============================================================
      // DIVIDER
      // ============================================================
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),

      // ============================================================
      // ICON
      // ============================================================
      iconTheme: const IconThemeData(color: AppColors.iconPrimary, size: 24),

      // ============================================================
      // LIST TILE
      // ============================================================
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.iconSecondary,

        textColor: AppColors.textPrimary,

        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),

        subtitleTextStyle: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 12,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),

      // ============================================================
      // CHECKBOX
      // ============================================================
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

        side: const BorderSide(color: AppColors.borderDark, width: 1.5),

        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }

          return Colors.transparent;
        }),

        checkColor: const WidgetStatePropertyAll(AppColors.textOnPrimary),
      ),

      // ============================================================
      // RADIO
      // ============================================================
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }

          return AppColors.borderDark;
        }),
      ),

      // ============================================================
      // SWITCH
      // ============================================================
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.surface;
          }

          return AppColors.textTertiary;
        }),

        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }

          return AppColors.border;
        }),
      ),

      // ============================================================
      // PROGRESS INDICATOR
      // ============================================================
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.primaryLight,
        circularTrackColor: AppColors.primaryLight,
      ),

      // ============================================================
      // TAB BAR
      // ============================================================
      tabBarTheme: const TabBarThemeData(
        labelColor: AppColors.primary,

        unselectedLabelColor: AppColors.textSecondary,

        indicatorColor: AppColors.primary,

        dividerColor: AppColors.border,

        labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),

        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),

      // ============================================================
      // TEXT SELECTION
      // ============================================================
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primary,
        selectionColor: AppColors.primaryLight,
        selectionHandleColor: AppColors.primary,
      ),
    );
  }
}
