import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.blueGray10001,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    displayLarge: GoogleFonts.notoSans(
      color: colorScheme.primary,
      fontSize: 25.fSize,
      
      fontWeight: FontWeight.w800,
    ),
    displayMedium:GoogleFonts.notoSans(
      color: colorScheme.primary,
      fontSize: 18.fSize,
      
      fontWeight: FontWeight.w800,
    ),
    displaySmall:GoogleFonts.notoSans(
      color: colorScheme.primary,
      fontSize: 16.fSize,
      
      fontWeight: FontWeight.w800,
    ),
    bodyLarge:GoogleFonts.notoSans(
      color: colorScheme.primary,
      fontSize: 16.fSize,
      
      fontWeight: FontWeight.w400,
    ),
    bodyMedium:GoogleFonts.notoSans(
      color: colorScheme.primary,
      fontSize: 14.fSize,
      
      fontWeight: FontWeight.w400,
    ),
    bodySmall:GoogleFonts.notoSans(
      color: colorScheme.primary,
      fontSize: 12.fSize,
      
      fontWeight: FontWeight.w300,
    ),

  );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF113A58),
    primaryContainer: Color(0XFFA9BCD3),
    errorContainer: Color(0XFF30628E),
    onErrorContainer: Color(0XFF000B35),
    onPrimary: Color(0X33FFFFFF),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Blackf
  Color get black9003f => Color(0X3F000000);
// BlueGray
  Color get blueGray100 => Color(0XFFCED9E5);
  Color get blueGray10001 => Color(0XFFCED8E5);
  Color get blueGray400 => Color(0XFF8A8E91);
// Indigo
  Color get indigo50 => Color(0XFFE4E9EF);
// Lime
  Color get lime200 => Color(0XFFEDE09A);
  Color get green0 => Color(0XFF79BC81);
}

