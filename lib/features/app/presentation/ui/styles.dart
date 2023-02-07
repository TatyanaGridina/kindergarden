import 'package:flutter/material.dart';

const kAssetPath = 'lib/ui/assets';

class MyColors {
  static const Color backgroundPrimary = Color(0xFFFEFEFE);
  static const Color backgroundAppBarStartColor = Color(0xFF65FDF0);
  static const Color backgroundAppBarEndColor = Color(0xFF1D6FA3);
  static const Color accentColor = Color(0xFF10c3d3);
  //background-image: linear-gradient( 135deg, #65FDF0 10%, #1D6FA3 100%);
  static const Color backgroundButton = Color(0xFFfebd03);
  static const Color iconColor = Color(0xFFa2d87b);
  static const Color messageSnackBarColor = Color(0xff55a51b);
  static const Color errorSnackBarColor = Colors.redAccent;
  //background-image: linear-gradient( 135deg, #70F570 10%, #49C628 100%);
  static const Color textInactive = Color(0xFF5A5A5A);
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFFFEFEFE);


  static const Color textSelected = Color(0xFF05A6EE);
  static const Color divider = Color(0xFF313337);
}

class MyPaddings {
  static const double xsmall = 4;
  static const double small = 10;
  static const double medium = 16;
  static const double large = 24;
  static const double xlarge = 30;
  static const double xxlarge = 42;
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
      TextStyle(fontSize: 14, color: MyColors.textPrimary, fontWeight: FontWeight.w600);
  static const TextStyle mediumPrimaryBold =
      TextStyle(fontSize: 16, color: MyColors.textPrimary, fontWeight: FontWeight.w700);
  static const TextStyle largePrimaryBold =
      TextStyle(fontSize: 20, color: MyColors.textPrimary, fontWeight: FontWeight.w800);
  static const TextStyle xlargePrimaryBold =
      TextStyle(fontSize: 24, color: MyColors.textPrimary, fontWeight: FontWeight.w900);

  static const TextStyle xxsmallSecondary = TextStyle(fontSize: 10, color: MyColors.textSecondary);
  static const TextStyle xsmallSecondary = TextStyle(fontSize: 12, color: MyColors.textSecondary);
  static const TextStyle smallSecondary = TextStyle(fontSize: 14, color: MyColors.textSecondary);
  static const TextStyle mediumSecondary = TextStyle(fontSize: 16, color: MyColors.textSecondary);
  static const TextStyle largeSecondary = TextStyle(fontSize: 20, color: MyColors.textSecondary);
  static const TextStyle xlargeSecondary = TextStyle(fontSize: 24, color: MyColors.textSecondary);

  static const TextStyle xsmallSecondaryBold =
      TextStyle(fontSize: 12, color: MyColors.textSecondary, fontWeight: FontWeight.w500);
  static const TextStyle smallSecondaryBold =
      TextStyle(fontSize: 14, color: MyColors.textSecondary, fontWeight: FontWeight.w600);
  static const TextStyle mediumSecondaryBold =
      TextStyle(fontSize: 16, color: MyColors.textSecondary, fontWeight: FontWeight.w700);
  static const TextStyle largeSecondaryBold =
      TextStyle(fontSize: 20, color: MyColors.textSecondary, fontWeight: FontWeight.w800);
  static const TextStyle xlargeSecondaryBold =
      TextStyle(fontSize: 24, color: MyColors.textSecondary, fontWeight: FontWeight.w900);

  static const TextStyle xsmallInactive = TextStyle(fontSize: 12, color: MyColors.textInactive);
  static const TextStyle smallInactive = TextStyle(fontSize: 14, color: MyColors.textInactive);
  static const TextStyle mediumInactive = TextStyle(fontSize: 16, color: MyColors.textInactive);
  static const TextStyle largeInactive = TextStyle(fontSize: 20, color: MyColors.textInactive);
  static const TextStyle xlargeInactive = TextStyle(fontSize: 24, color: MyColors.textInactive);

  static const TextStyle xsmallInactiveBold =
      TextStyle(fontSize: 12, color: MyColors.textInactive, fontWeight: FontWeight.w500);
  static const TextStyle smallInactiveBold =
      TextStyle(fontSize: 14, color: MyColors.textInactive, fontWeight: FontWeight.w600);
  static const TextStyle mediumInactiveBold =
      TextStyle(fontSize: 16, color: MyColors.textInactive, fontWeight: FontWeight.w700);
  static const TextStyle largeInactiveBold =
      TextStyle(fontSize: 20, color: MyColors.textInactive, fontWeight: FontWeight.w800);
  static const TextStyle xlargeInactiveBold =
      TextStyle(fontSize: 24, color: MyColors.textInactive, fontWeight: FontWeight.w900);
}
