import 'package:flutter/material.dart';

const kAssetPath = 'lib/ui/assets';

class MyColors {
  static const Color primary = Color(0xFF1CE8B7);
  static const Color secondary = Color(0xFF627F7B);
  static const Color inactive = Color(0xFF3C5453);
  static const Color textPrimary = Color(0xFFFEFEFE);
  static const Color textSecondary = Color(0xFFB9BAB9);
  static const Color textInactive = Color(0xFF5A5A5A);
  static const Color textSelected = Color(0xFF05A6EE);
  static const Color backgroundPrimary = Color(0xFF1C1D21);
  static const Color backgroundSecondary = Color(0xFF242529);
  static const Color divider = Color(0xFF313337);
}

class MyPaddings {
  static const double xsmall = 4;
  static const double small = 8;
  static const double medium = 16;
  static const double large = 24;
  static const double xlarge = 32;
}

class MyTextStyles {
  static const TextStyle xsmallPrimary = TextStyle(fontSize: 12, color: MyColors.textPrimary);
  static const TextStyle smallPrimary = TextStyle(fontSize: 14, color: MyColors.textPrimary);
  static const TextStyle mediumPrimary = TextStyle(fontSize: 16, color: MyColors.textPrimary);
  static const TextStyle largePrimary = TextStyle(fontSize: 20, color: MyColors.textPrimary);
  static const TextStyle xlargePrimary = TextStyle(fontSize: 24, color: MyColors.textPrimary);

  static const TextStyle xsmallPrimaryBold =
      TextStyle(fontSize: 10, color: MyColors.textPrimary, fontWeight: FontWeight.w500);
  static const TextStyle smallPrimaryBold =
      TextStyle(fontSize: 14, color: MyColors.textPrimary, fontWeight: FontWeight.w500);
  static const TextStyle mediumPrimaryBold =
      TextStyle(fontSize: 16, color: MyColors.textPrimary, fontWeight: FontWeight.w500);
  static const TextStyle largePrimaryBold =
      TextStyle(fontSize: 20, color: MyColors.textPrimary, fontWeight: FontWeight.w500);
  static const TextStyle xlargePrimaryBold =
      TextStyle(fontSize: 24, color: MyColors.textPrimary, fontWeight: FontWeight.w500);

  static const TextStyle xxsmallSecondary = TextStyle(fontSize: 10, color: MyColors.textSecondary);
  static const TextStyle xsmallSecondary = TextStyle(fontSize: 12, color: MyColors.textSecondary);
  static const TextStyle smallSecondary = TextStyle(fontSize: 14, color: MyColors.textSecondary);
  static const TextStyle mediumSecondary = TextStyle(fontSize: 16, color: MyColors.textSecondary);
  static const TextStyle largeSecondary = TextStyle(fontSize: 20, color: MyColors.textSecondary);
  static const TextStyle xlargeSecondary = TextStyle(fontSize: 24, color: MyColors.textSecondary);

  static const TextStyle xsmallSecondaryBold =
      TextStyle(fontSize: 12, color: MyColors.textSecondary, fontWeight: FontWeight.w500);
  static const TextStyle smallSecondaryBold =
      TextStyle(fontSize: 14, color: MyColors.textSecondary, fontWeight: FontWeight.w500);
  static const TextStyle mediumSecondaryBold =
      TextStyle(fontSize: 16, color: MyColors.textSecondary, fontWeight: FontWeight.w500);
  static const TextStyle largeSecondaryBold =
      TextStyle(fontSize: 20, color: MyColors.textSecondary, fontWeight: FontWeight.w500);
  static const TextStyle xlargeSecondaryBold =
      TextStyle(fontSize: 24, color: MyColors.textSecondary, fontWeight: FontWeight.w500);

  static const TextStyle xsmallInactive = TextStyle(fontSize: 12, color: MyColors.textInactive);
  static const TextStyle smallInactive = TextStyle(fontSize: 14, color: MyColors.textInactive);
  static const TextStyle mediumInactive = TextStyle(fontSize: 16, color: MyColors.textInactive);
  static const TextStyle largeInactive = TextStyle(fontSize: 20, color: MyColors.textInactive);
  static const TextStyle xlargeInactive = TextStyle(fontSize: 24, color: MyColors.textInactive);

  static const TextStyle xsmallInactiveBold =
      TextStyle(fontSize: 12, color: MyColors.textInactive, fontWeight: FontWeight.w500);
  static const TextStyle smallInactiveBold =
      TextStyle(fontSize: 14, color: MyColors.textInactive, fontWeight: FontWeight.w500);
  static const TextStyle mediumInactiveBold =
      TextStyle(fontSize: 16, color: MyColors.textInactive, fontWeight: FontWeight.w500);
  static const TextStyle largeInactiveBold =
      TextStyle(fontSize: 20, color: MyColors.textInactive, fontWeight: FontWeight.w500);
  static const TextStyle xlargeInactiveBold =
      TextStyle(fontSize: 24, color: MyColors.textInactive, fontWeight: FontWeight.w500);
}
