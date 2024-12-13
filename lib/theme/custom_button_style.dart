import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillOnPrimary => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.onPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.h),
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.h),
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );
  static ButtonStyle get fillPrimaryContainer => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primaryContainer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.h),
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );
// Outline button style
  static ButtonStyle get outlineBlackF => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.errorContainer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.h),
    ),
    shadowColor: appTheme.black9003f,
    elevation: 4,
    padding: EdgeInsets.zero,
  );
  static ButtonStyle get outlineBlackFTL10 => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.h),
    ),
    shadowColor: appTheme.black9003f,
    elevation: 4,
    padding: EdgeInsets.zero,
  );
// text button style
  static ButtonStyle get none => ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
      elevation: WidgetStateProperty.all<double>(0),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      side: WidgetStateProperty.all<BorderSide>(
        BorderSide(color: Colors.transparent),
      ));
}

