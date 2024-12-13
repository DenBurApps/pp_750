import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get notoSans {
    return copyWith(
      fontFamily: 'Noto Sans',
    );
  }

  TextStyle get sFProText {
    return copyWith(
      fontFamily: 'SF Pro Text',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  static TextStyle get displayLarge => theme.textTheme.displayLarge!;
  static TextStyle get displayMedium => theme.textTheme.displayMedium!;
  static TextStyle get displaySmall => theme.textTheme.displaySmall!;

  static TextStyle get bodyLarge => theme.textTheme.bodyLarge!;
  static TextStyle get bodyMedium => theme.textTheme.bodyMedium!;
  static TextStyle get bodySmall => theme.textTheme.bodySmall!;
  // Body text style
  static TextStyle get bodyLargeBluegray100 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray100,
      );
  static TextStyle get bodyMediumBluegray100 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray100,
      );
  static TextStyle get bodyMediumBluegray100_1 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray100,
      );
  static TextStyle get bodyMediumBluegray400 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray400,
      );
  static TextStyle get bodyMediumSFProTextBluegray100 =>
      theme.textTheme.bodyMedium!.sFProText.copyWith(
        color: appTheme.blueGray100,
        fontSize: 15.fSize,
      );
  static TextStyle get bodySmallBluegray100 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray100,
      );
// Title text style
  static TextStyle get displaySmall18 => theme.textTheme.displaySmall!.copyWith(
    fontSize: 18.fSize,
  );
  static TextStyle get displaySmallBluegray100 =>
      theme.textTheme.displaySmall!.copyWith(
        color: appTheme.blueGray100,
        fontSize: 18.fSize,
      );
  static TextStyle get displaySmallBluegray400 =>
      theme.textTheme.displaySmall!.copyWith(
        color: appTheme.blueGray400,
        fontSize: 18.fSize,
      );
  static TextStyle get displaySmallIndigo50 =>
      theme.textTheme.displaySmall!.copyWith(
        color: appTheme.indigo50,
        fontSize: 18.fSize,
      );
}

