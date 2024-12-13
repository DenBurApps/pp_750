import 'package:flutter/material.dart';

import '../core/app_export.dart';

class AppDecoration {
  // Background decorations
  static BoxDecoration get background => BoxDecoration(
        color: appTheme.blueGray10001,
      );

// Bluegradient decorations
  static BoxDecoration get bluegradient => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, -1),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.indigo50,
            theme.colorScheme.primary,
          ],
        ),
      );

// Fill decorations
  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigo50,
      );

// Primary decorations
  static BoxDecoration get primary => BoxDecoration(
        color: theme.colorScheme.primary,
      );

// Secondary decorations
  static BoxDecoration get secondary => BoxDecoration(
        color: theme.colorScheme.errorContainer,
      );

// Surface decorations
  static BoxDecoration get surface => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      );

// Transparentwhite decorations
  static BoxDecoration get transparentwhite => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );

// White decorations
  static BoxDecoration get white => BoxDecoration(
        color: appTheme.indigo50,
        // boxShadow: [
        //   BoxShadow(
        //     color: appTheme.black9003f,
        //     spreadRadius: 2.h,
        //     blurRadius: 2.h,
        //     offset: Offset(
        //       0,
        //       4,
        //     ),
        //   )
        // ],
      );
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderTL20 => BorderRadius.vertical(
        top: Radius.circular(20.h),
      );

// Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );

  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );

  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
}
