import 'package:flutter/material.dart';
import 'app_theme.dart';

enum AppFontWeight { extraBold, bold, semiBold, medium, regular, light }

extension AppFontWeightMapping on AppFontWeight {
  FontWeight get weight {
    switch (this) {
      case AppFontWeight.extraBold:
        return FontWeight.w800;
      case AppFontWeight.bold:
        return FontWeight.w700;
      case AppFontWeight.semiBold:
        return FontWeight.w600;
      case AppFontWeight.medium:
        return FontWeight.w500;
      case AppFontWeight.regular:
        return FontWeight.w400;
      case AppFontWeight.light:
        return FontWeight.w300;
    }
  }
}

TextStyle? get heading1ExtraBold => textTheme.displayLarge
    ?.copyWith(fontWeight: AppFontWeight.extraBold.weight);
TextStyle? get heading1Bold =>
    textTheme.displayLarge?.copyWith(fontWeight: AppFontWeight.bold.weight);
TextStyle? get heading1SemiBold =>
    textTheme.displayLarge?.copyWith(fontWeight: AppFontWeight.semiBold.weight);
TextStyle? get heading1Medium =>
    textTheme.displayLarge?.copyWith(fontWeight: AppFontWeight.medium.weight);
TextStyle? get heading1Regular =>
    textTheme.displayLarge?.copyWith(fontWeight: AppFontWeight.regular.weight);
TextStyle? get heading1Light =>
    textTheme.displayLarge?.copyWith(fontWeight: AppFontWeight.light.weight);
// Heading 2 (Size - 64)
TextStyle? get heading2ExtraBold => textTheme.displayMedium
    ?.copyWith(fontWeight: AppFontWeight.extraBold.weight);
TextStyle? get heading2Bold =>
    textTheme.displayMedium?.copyWith(fontWeight: AppFontWeight.bold.weight);
TextStyle? get heading2SemiBold => textTheme.displayMedium
    ?.copyWith(fontWeight: AppFontWeight.semiBold.weight);
TextStyle? get heading2Medium =>
    textTheme.displayMedium?.copyWith(fontWeight: AppFontWeight.medium.weight);
TextStyle? get heading2Regular =>
    textTheme.displayMedium?.copyWith(fontWeight: AppFontWeight.regular.weight);
TextStyle? get heading2Light =>
    textTheme.displayMedium?.copyWith(fontWeight: AppFontWeight.light.weight);
// Heading 3 (Size - 48)
TextStyle? get heading3ExtraBold => textTheme.displaySmall
    ?.copyWith(fontWeight: AppFontWeight.extraBold.weight);
TextStyle? get heading3Bold =>
    textTheme.displaySmall?.copyWith(fontWeight: AppFontWeight.bold.weight);
TextStyle? get heading3SemiBold =>
    textTheme.displaySmall?.copyWith(fontWeight: AppFontWeight.semiBold.weight);
TextStyle? get heading3Medium =>
    textTheme.displaySmall?.copyWith(fontWeight: AppFontWeight.medium.weight);
TextStyle? get heading3Regular =>
    textTheme.displaySmall?.copyWith(fontWeight: AppFontWeight.regular.weight);
TextStyle? get heading3Light =>
    textTheme.displaySmall?.copyWith(fontWeight: AppFontWeight.light.weight);
// Heading 4 (Size - 40)
TextStyle? get heading4ExtraBold => textTheme.headlineLarge
    ?.copyWith(fontWeight: AppFontWeight.extraBold.weight);
TextStyle? get heading4Bold =>
    textTheme.headlineLarge?.copyWith(fontWeight: AppFontWeight.bold.weight);
TextStyle? get heading4SemiBold => textTheme.headlineLarge
    ?.copyWith(fontWeight: AppFontWeight.semiBold.weight);
TextStyle? get heading4Medium =>
    textTheme.headlineLarge?.copyWith(fontWeight: AppFontWeight.medium.weight);
TextStyle? get heading4Regular =>
    textTheme.headlineLarge?.copyWith(fontWeight: AppFontWeight.regular.weight);
TextStyle? get heading4Light =>
    textTheme.headlineLarge?.copyWith(fontWeight: AppFontWeight.light.weight);
// Heading 5 (Size - 36)
TextStyle? get heading5ExtraBold => textTheme.headlineMedium
    ?.copyWith(fontWeight: AppFontWeight.extraBold.weight);
TextStyle? get heading5Bold =>
    textTheme.headlineMedium?.copyWith(fontWeight: AppFontWeight.bold.weight);
TextStyle? get heading5SemiBold => textTheme.headlineMedium
    ?.copyWith(fontWeight: AppFontWeight.semiBold.weight);
TextStyle? get heading5Medium =>
    textTheme.headlineMedium?.copyWith(fontWeight: AppFontWeight.medium.weight);
TextStyle? get heading5Regular => textTheme.headlineMedium
    ?.copyWith(fontWeight: AppFontWeight.regular.weight);
TextStyle? get heading5Light =>
    textTheme.headlineMedium?.copyWith(fontWeight: AppFontWeight.light.weight);
// Heading 6 (Size - 32)
TextStyle? get heading6ExtraBold => textTheme.headlineSmall
    ?.copyWith(fontWeight: AppFontWeight.extraBold.weight);
TextStyle? get heading6Bold =>
    textTheme.headlineSmall?.copyWith(fontWeight: AppFontWeight.bold.weight);
TextStyle? get heading6SemiBold => textTheme.headlineSmall
    ?.copyWith(fontWeight: AppFontWeight.semiBold.weight);
TextStyle? get heading6Medium =>
    textTheme.headlineSmall?.copyWith(fontWeight: AppFontWeight.medium.weight);
TextStyle? get heading6Regular =>
    textTheme.headlineSmall?.copyWith(fontWeight: AppFontWeight.regular.weight);
TextStyle? get heading6Light =>
    textTheme.headlineSmall?.copyWith(fontWeight: AppFontWeight.light.weight);
// Title 3 (Size - 24)
TextStyle? get title3ExtraBold =>
    textTheme.titleLarge?.copyWith(fontWeight: AppFontWeight.extraBold.weight);
TextStyle? get title3Bold =>
    textTheme.titleLarge?.copyWith(fontWeight: AppFontWeight.bold.weight);
TextStyle? get title3SemiBold =>
    textTheme.titleLarge?.copyWith(fontWeight: AppFontWeight.semiBold.weight);
TextStyle? get title3Medium =>
    textTheme.titleLarge?.copyWith(fontWeight: AppFontWeight.medium.weight);
TextStyle? get title3Regular =>
    textTheme.titleLarge?.copyWith(fontWeight: AppFontWeight.regular.weight);
TextStyle? get title3Light =>
    textTheme.titleLarge?.copyWith(fontWeight: AppFontWeight.light.weight);
// Title 2 (Size - 20)
TextStyle? get title2ExtraBold =>
    textTheme.titleMedium?.copyWith(fontWeight: AppFontWeight.extraBold.weight);
TextStyle? get title2Bold =>
    textTheme.titleMedium?.copyWith(fontWeight: AppFontWeight.bold.weight);
TextStyle? get title2SemiBold =>
    textTheme.titleMedium?.copyWith(fontWeight: AppFontWeight.semiBold.weight);
TextStyle? get title2Medium =>
    textTheme.titleMedium?.copyWith(fontWeight: AppFontWeight.medium.weight);
TextStyle? get title2Regular =>
    textTheme.titleMedium?.copyWith(fontWeight: AppFontWeight.regular.weight);
TextStyle? get title2Light =>
    textTheme.titleMedium?.copyWith(fontWeight: AppFontWeight.light.weight);
// Title 1 (Size - 18)
TextStyle? get title1ExtraBold =>
    textTheme.titleSmall?.copyWith(fontWeight: AppFontWeight.extraBold.weight);
TextStyle? get title1Bold =>
    textTheme.titleSmall?.copyWith(fontWeight: AppFontWeight.bold.weight);
TextStyle? get title1SemiBold =>
    textTheme.titleSmall?.copyWith(fontWeight: AppFontWeight.semiBold.weight);
TextStyle? get title1Medium =>
    textTheme.titleSmall?.copyWith(fontWeight: AppFontWeight.medium.weight);
TextStyle? get title1Regular =>
    textTheme.titleSmall?.copyWith(fontWeight: AppFontWeight.regular.weight);
TextStyle? get title1Light =>
    textTheme.titleSmall?.copyWith(fontWeight: AppFontWeight.light.weight);
// Button (Size - 16)
TextStyle? get buttonExtraBold => textTheme.titleSmall
    ?.copyWith(fontWeight: AppFontWeight.extraBold.weight, fontSize: 16);
TextStyle? get buttonBold => textTheme.titleSmall
    ?.copyWith(fontWeight: AppFontWeight.bold.weight, fontSize: 16);
TextStyle? get buttonSemiBold => textTheme.titleSmall
    ?.copyWith(fontWeight: AppFontWeight.semiBold.weight, fontSize: 16);
TextStyle? get buttonMedium => textTheme.titleSmall
    ?.copyWith(fontWeight: AppFontWeight.medium.weight, fontSize: 16);
TextStyle? get buttonRegular => textTheme.titleSmall
    ?.copyWith(fontWeight: AppFontWeight.regular.weight, fontSize: 16);
TextStyle? get buttonLight => textTheme.titleSmall
    ?.copyWith(fontWeight: AppFontWeight.light.weight, fontSize: 16);
// Body (Size - 14)
TextStyle? get bodyExtraBold =>
    textTheme.bodyLarge?.copyWith(fontWeight: AppFontWeight.extraBold.weight);
TextStyle? get bodyBold =>
    textTheme.bodyLarge?.copyWith(fontWeight: AppFontWeight.bold.weight);
TextStyle? get bodySemiBold =>
    textTheme.bodyLarge?.copyWith(fontWeight: AppFontWeight.semiBold.weight);
TextStyle? get bodyMedium =>
    textTheme.bodyLarge?.copyWith(fontWeight: AppFontWeight.medium.weight);
TextStyle? get bodyRegular =>
    textTheme.bodyLarge?.copyWith(fontWeight: AppFontWeight.regular.weight);
TextStyle? get bodyLight =>
    textTheme.bodyLarge?.copyWith(fontWeight: AppFontWeight.light.weight);
// Caption (Size - 12)
TextStyle? get captionExtraBold =>
    textTheme.labelLarge?.copyWith(fontWeight: AppFontWeight.extraBold.weight);
TextStyle? get captionBold =>
    textTheme.labelLarge?.copyWith(fontWeight: AppFontWeight.bold.weight);
TextStyle? get captionSemiBold =>
    textTheme.labelLarge?.copyWith(fontWeight: AppFontWeight.semiBold.weight);
TextStyle? get captionMedium =>
    textTheme.labelLarge?.copyWith(fontWeight: AppFontWeight.medium.weight);
TextStyle? get captionRegular =>
    textTheme.labelLarge?.copyWith(fontWeight: AppFontWeight.regular.weight);
TextStyle? get captionLight =>
    textTheme.labelLarge?.copyWith(fontWeight: AppFontWeight.light.weight);
// OverLine (Size - 10)
TextStyle? get overlineExtraBold => textTheme.labelLarge
    ?.copyWith(fontWeight: AppFontWeight.extraBold.weight, fontSize: 10);
TextStyle? get overlineBold => textTheme.labelLarge
    ?.copyWith(fontWeight: AppFontWeight.bold.weight, fontSize: 10);
TextStyle? get overlineSemiBold => textTheme.labelLarge
    ?.copyWith(fontWeight: AppFontWeight.semiBold.weight, fontSize: 10);
TextStyle? get overlineMedium => textTheme.labelLarge
    ?.copyWith(fontWeight: AppFontWeight.medium.weight, fontSize: 10);
TextStyle? get overlineRegular => textTheme.labelLarge
    ?.copyWith(fontWeight: AppFontWeight.regular.weight, fontSize: 10);
TextStyle? get overlineLight => textTheme.labelLarge
    ?.copyWith(fontWeight: AppFontWeight.light.weight, fontSize: 10);
