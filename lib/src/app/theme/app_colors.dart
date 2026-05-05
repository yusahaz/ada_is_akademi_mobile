import 'package:flutter/material.dart';

@immutable
class AppColors {
  const AppColors._();

  // Brand / Ocean
  static const Color oceanMint = Color(0xFF14F1D9);
  static const Color oceanMintHover = Color(0xFF62FFEE);
  static const Color oceanSky = Color(0xFF0EA5E9);
  static const Color oceanSky600 = Color(0xFF0284C7);

  // Light Theme
  static const Color lightBackground = Color(0xFFF4F7FB);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceAlt = Color(0xFFF0F9FF);
  static const Color lightCard = Color(0xFFE0F2FE);
  static const Color lightBorder = Color(0xFFBAE6FD);
  static const Color lightBorderStrong = Color(0xFF7DD3FC);

  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF334155);
  static const Color lightTextMuted = Color(0xFF475569);

  // Dark Theme
  static const Color darkBackground = Color(0xFF0B0E14);
  static const Color darkSurface = Color(0xFF111827);
  static const Color darkGlass = Color(0x0FFFFFFF);
  static const Color darkBorder = Color(0x1AFFFFFF);
  static const Color darkBorderSoft = Color(0x2EFFFFFF);

  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xB3FFFFFF);
  static const Color darkTextMuted = Color(0xA6FFFFFF);
}

final ColorScheme lightColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.oceanMint,
  onPrimary: Color(0xFF041014),
  secondary: AppColors.oceanSky,
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFDC2626),
  onError: Color(0xFFFFFFFF),
  surface: AppColors.lightSurface,
  onSurface: AppColors.lightTextPrimary,
).copyWith(
  outline: AppColors.lightBorder,
  surfaceContainerHighest: AppColors.lightSurfaceAlt,
);

final ColorScheme darkColorScheme = const ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.oceanMint,
  onPrimary: Color(0xFF041014),
  secondary: AppColors.oceanSky,
  onSecondary: Color(0xFF041014),
  error: Color(0xFFEF4444),
  onError: Color(0xFF1F2937),
  surface: AppColors.darkSurface,
  onSurface: AppColors.darkTextPrimary,
).copyWith(
  outline: AppColors.darkBorder,
  surfaceContainerHighest: const Color(0xFF1F2937),
);

@immutable
class AppGradients {
  const AppGradients._();

  static const List<Color> heroLightLayer1 = [
    Color(0x2E06B6D4),
    Color(0x0006B6D4),
  ];

  static const List<Color> heroLightLayer2 = [
    Color(0x293B82F6),
    Color(0x003B82F6),
  ];

  static const List<Color> heroLightLayer3 = [
    Color(0x1A0EA5E9),
    Color(0x000EA5E9),
  ];

  static const List<Color> heroDarkLayer1 = [
    Color(0x2E14F1D9),
    Color(0x0014F1D9),
  ];

  static const List<Color> heroDarkLayer2 = [
    Color(0x296366F1),
    Color(0x006366F1),
  ];

  static const List<Color> heroDarkLayer3 = [
    Color(0x1414F1D9),
    Color(0x0014F1D9),
  ];

  static const List<Color> ctaLight = [
    Color(0x3822D3EE),
    Color(0x1438BDF8),
    Color(0x00000000),
  ];

  static const List<Color> ctaDark = [
    Color(0x2E14F1D9),
    Color(0x0A14F1D9),
    Color(0x00000000),
  ];
}
