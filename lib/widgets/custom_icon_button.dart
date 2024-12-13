import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
    color: theme.colorScheme.primaryContainer,
    borderRadius: BorderRadius.circular(20.h),
  );
  static BoxDecoration get outlineBlackF => BoxDecoration(
    color: theme.colorScheme.errorContainer,
    borderRadius: BorderRadius.circular(10.h),
    boxShadow: [
      BoxShadow(
        color: appTheme.black9003f,
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          4,
        ),
      )
    ],
  );
  static BoxDecoration get fillPrimaryContainerTL16 => BoxDecoration(
    color: theme.colorScheme.primaryContainer,
    borderRadius: BorderRadius.circular(16.h),
  );
  static BoxDecoration get none => BoxDecoration();
}

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {Key? key,
        this.alignment,
        this.height,
        this.width,
        this.decoration,
        this.padding,
        this.onTap,
        this.child})
      : super(
    key: key,
  );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final BoxDecoration? decoration;

  final EdgeInsetsGeometry? padding;

  final VoidCallback? onTap;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
        alignment: alignment ?? Alignment.center, child: iconButtonWidget)
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
    height: height ?? 40,
    width: width ?? 40,
    child: DecoratedBox(
      decoration: decoration ??
          BoxDecoration(
            color: appTheme.indigo50,
            borderRadius: BorderRadius.circular(10.h),
          ),
      child: IconButton(
        padding: padding ?? EdgeInsets.zero,
        onPressed: onTap,
        icon: child ?? Container(),
      ),
    ),
  );
}

