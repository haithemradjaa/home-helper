/// Theme Configuration for Home Helper Application
///
/// Provides a centralized, comprehensive theming system
/// that ensures consistent design across the entire application.
///
/// Key Responsibilities:
/// - Define application-wide design system
/// - Create light and dark theme variants
/// - Implement Material Design 3 guidelines
/// - Provide consistent color and typography
///
/// Theme Components:
/// - Color scheme
/// - Typography
/// - Component styles
/// - Elevation and spacing
///
/// Design Principles:
/// - Material Design 3 compliance
/// - Adaptive color system
/// - Consistent visual language
/// - Accessibility considerations
///
/// Color Palette:
/// - Primary color: Green (#4CAF50)
/// - Secondary colors
/// - Error and neutral colors
/// - Surface and background colors
///
/// Typography Configuration:
/// - Font family: Poppins
/// - Responsive text sizes
/// - Weight and style variations
///
/// Theming Features:
/// - Light mode configuration
/// - Dark mode support (future)
/// - Component-specific styling
/// - Consistent design tokens
///
/// Typical Use Cases:
/// - Global app styling
/// - Consistent UI components
/// - Brand identity representation
///
/// Example Theme Usage:
/// ```dart
/// MaterialApp(
///   theme: AppTheme.lightTheme,
///   // Application configuration
/// )
/// ```
///
/// Future Extensibility:
/// - Dark mode implementation
/// - Dynamic theme generation
/// - Customizable theme variants
/// - Internationalization support

import 'package:flutter/material.dart';

/// A class that contains all the theming configurations for the app.
/// This centralizes our theme definitions and makes it easier to maintain
/// consistent styling throughout the application.
class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  /// Primary color swatch
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF4CAF50,
    <int, Color>{
      50: Color(0xFFE8F5E9),
      100: Color(0xFFC8E6C9),
      200: Color(0xFFA5D6A7),
      300: Color(0xFF81C784),
      400: Color(0xFF66BB6A),
      500: Color(0xFF4CAF50), // Primary color
      600: Color(0xFF43A047),
      700: Color(0xFF388E3C),
      800: Color(0xFF2E7D32),
      900: Color(0xFF1B5E20),
    },
  );

  /// Text Styles
  static const TextStyle displayLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -1.0,
    fontFamily: 'Poppins',
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
    fontFamily: 'Poppins',
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    letterSpacing: 0.5,
    fontFamily: 'Poppins',
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
  );

  /// Button Styles
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(double.infinity, 48),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 0,
  );

  static final ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    minimumSize: const Size(double.infinity, 48),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  /// Input Decoration
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[100],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: primarySwatch),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.red[300]!),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),
  );

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primarySwatch,
      brightness: Brightness.light,
    ),
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      bodyLarge: bodyLarge,
      labelLarge: labelLarge,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: elevatedButtonStyle,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: outlinedButtonStyle,
    ),
    inputDecorationTheme: inputDecorationTheme,
  );
}
