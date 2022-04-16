import 'package:flutter/material.dart';

class PinchColors {
  static Color get primary => const Color(0xFF626BB7);
  static Color get lightPrimary => const Color(0xFFDDDFF2);
  static Color get secundary => const Color(0xFF37FE8E);

  static Color get white => const Color(0xFFFFFFFF);
  static Color get black => const Color(0xFF343434);

  static Color get darkGray => const Color(0xFF6F6F6F);
  static Color get gray => const Color(0xFF8D8D8D);
  static Color get lightGray => const Color(0xFFE0E0E0);
  static Color get extraGray => const Color(0xFFE8E8E8);

  static Color get background => const Color(0xFF141430);

  static Color get orange => const Color(0xffF5591F);
  static Color get orangeLight => const Color(0xffF2861E);
  static Color get night => const Color(0xff373B44);
  static Color get nightMedium => const Color(0xff3e6ab2);
  static Color get nightLight => const Color(0xff4286f4);

  static Color get red => const Color(0xFFC0392B);

  static Color get topProducts => const Color(0xff4286f4);

  static LinearGradient get backgroundPrimaryGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          orange,
          orangeLight,
        ],
      );

  static LinearGradient get gradientWhite => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          white,
          white,
          white,
        ],
      );
}
