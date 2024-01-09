import 'package:flutter/material.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:sizer/sizer.dart';

class AppTextStyles {
  // Base text styles
  static TextStyle get textBase => const TextStyle(
    fontFamily: 'Poppins',
  );
  static TextStyle get textThin => textBase.copyWith(
    fontWeight: FontWeight.w100,
  );
  static TextStyle get textExtraLight => textBase.copyWith(
    fontWeight: FontWeight.w200,
  );
  static TextStyle get textLight => textBase.copyWith(
    fontWeight: FontWeight.w300,
  );
  static TextStyle get textRegular => textBase.copyWith(
    fontWeight: FontWeight.w400,
  );
  static TextStyle get textMedium => textBase.copyWith(
    fontWeight: FontWeight.w500,
  );
  static TextStyle get textSemiBold => textBase.copyWith(
    fontWeight: FontWeight.w600,
  );
  static TextStyle get textBold => textBase.copyWith(
    fontWeight: FontWeight.w700,
  );
  static TextStyle get textExtraBold => textBase.copyWith(
    fontWeight: FontWeight.w800,
  );
  static TextStyle get textBlack => textBase.copyWith(
    fontWeight: FontWeight.w900,
  );

  // Title text
  static TextStyle titleText(BuildContext context) {
    return textSemiBold.copyWith(
      fontSize: 18.sp,
      color: AppColors.textColor,
    );
  }

  static TextStyle subtitleText(BuildContext context) {
    return textMedium.copyWith(
      fontSize: 13.sp,
      color: AppColors.secondaryTextColor,
    );
  }

  static TextStyle labelText(BuildContext context) {
    return textSemiBold.copyWith(
      fontSize: 13.sp,
      color: AppColors.textColor,
    );
  }

  static TextStyle hintText(BuildContext context) {
    return textMedium.copyWith(
      fontSize: 12.sp,
      color: AppColors.hintTextColor,
    );
  }

  static TextStyle contentText(BuildContext context) {
    return textMedium.copyWith(
      fontSize: 12.sp,
      color: AppColors.textColor,
    );
  }

  static TextStyle errorText(BuildContext context) {
    return textMedium.copyWith(
      fontSize: 11.sp,
      color: AppColors.error,
    );
  }

  static TextStyle highlightedText(BuildContext context) {
    return textSemiBold.copyWith(
      fontSize: 12.sp,
      color: AppColors.highlightedTextColor,
    );
  }

  static TextStyle buttonText(BuildContext context) {
    return textSemiBold.copyWith(
      fontSize: 15.sp,
      color: AppColors.whiteTextColor,
    );
  }
}