import 'package:flutter/material.dart';

class AppTheme {
  // ── WARNA UTAMA (PASTEL AESTHETIC) ──────────────────
  static const Color primary = Color(0xFF9F7AEA);      // Soft Lavender
  static const Color primaryLight = Color(0xFFD6BCFA); // Light Purple
  static const Color accent = Color(0xFFFBB6CE);       // Pastel Pink

  static const Color background = Color(0xFFFAF5FF);   // Soft background
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFF87171);

  static const Color textPrimary = Color(0xFF2D3748);
  static const Color textSecondary = Color(0xFF718096);
  static const Color divider = Color(0xFFE9D8FD);

  // ── GRADIENT BRAND ────────────────────────────────
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF9F7AEA),
      Color(0xFFD6BCFA),
      Color(0xFFFBB6CE),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ── STATUS SINYAL (SUDAH DISESUAIKAN UI KAMU) ───────
  static const Color networkWifi = Color(0xFFD6BCFA);   // lavender soft
  static const Color networkMobile = Color(0xFFFBB6CE); // pastel pink
  static const Color networkOffline = Color(0xFFF87171);

  // background badge sinyal (IMPORTANT)
  static const Color networkBadgeBg = Color(0xFF3B2F5A); // dark soft purple

  // ── LIGHT THEME ──────────────────────────────────
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        secondary: accent,
        surface: surface,
        error: error,
      ),
      scaffoldBackgroundColor: background,

      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE9D8FD)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE9D8FD)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primary, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        labelStyle: const TextStyle(color: textSecondary),
      ),

      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: Colors.white,
      ),
    );
  }

  // ── DARK THEME (PASTEL AESTHETIC DARK) ─────────────
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.dark,
        primary: primary,
        secondary: accent,
        surface: const Color(0xFF2D2A3A),
        error: error,
      ),
      scaffoldBackgroundColor: const Color(0xFF1F1B2E),

      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF9F7AEA),
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      cardTheme: CardThemeData(
        color: const Color(0xFF2D2A3A),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: Colors.white,
      ),
    );
  }
}