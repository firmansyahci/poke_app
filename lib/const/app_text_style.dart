import 'package:flutter/material.dart';

class AppTextStyles {
  static HeaderTextStyle headerTextStyle = const HeaderTextStyle();
  static BodyTextStyle bodyTextStyle = const BodyTextStyle();
}

class HeaderTextStyle {
  const HeaderTextStyle();

  TextStyle get headline =>
      const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, height: 1.3);

  TextStyle get subtitle1 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.14,
      );

  TextStyle get subtitle2 => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 1.3,
      );

  TextStyle get subtitle3 => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        height: 1.6,
      );
}

class BodyTextStyle {
  const BodyTextStyle();

  TextStyle get body1 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.14,
      );

  TextStyle get body2 => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.3,
      );

  TextStyle get body3 => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        height: 1.6,
      );

  TextStyle get caption => const TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );
}
