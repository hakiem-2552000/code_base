import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyle {
  static TextStyle weekDayTextStyle() => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: defaultTextColor,
      );

  static TextStyle secondaryTextStyle() => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: secondaryTextColor,
      );

  static TextStyle overLineTextStyle() => const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w300, color: defaultTextColor);

  static TextStyle regularTextStyle(
          {double fontSize = 14, Color color = defaultTextColor}) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle errorTextStyle() => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: errorColor,
      );

  static TextStyle primaryTextStyle() => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: defaultTextColor,
      );

  static TextStyle calendarTextStyle() => const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      );

  static TextStyle mediumTextStyle({double fontSize = 16}) => TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: defaultTextColor,
      );

  static TextStyle inputTextStyle() => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: secondaryTextColor,
      );

  static TextStyle defaultTextStyle() => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: defaultTextColor,
      );

  static TextStyle disableTextStyle() => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: disableTextColor,
      );

  static TextStyle headline6TextStyle() => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: secondaryTextColor,
      );

  static TextStyle buttonTextStyle() => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  static TextStyle highLightTextStyle() => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: highlightColor,
      );

  static TextStyle hintTextStyle() => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: heatherColor,
      );

  static TextStyle labelTextStyle() => const TextStyle(
      color: defaultTextColor, fontSize: 20, fontWeight: FontWeight.w700);

  static TextStyle titleTextStyle() => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: defaultTextColor,
      );

  static TextStyle toolbarTextStyle() => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: highlightColor,
      );

  static TextStyle largeTitleTextStyle() => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: highlightColor,
      );

  static TextStyle regularSecondaryTextStyle({double fontSize = 16}) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: secondaryTextColor,
      );

  static TextStyle mediumSecondaryTextStyle({double fontSize = 16}) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: secondaryTextColor,
      );

  static TextStyle boldSecondaryTextStyle({double fontSize = 16}) => TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: secondaryTextColor,
      );

  static TextStyle thirdInputHintTextStyle() => const TextStyle(
        color: heatherColor,
        fontSize: 16,
        fontWeight: FontWeight.w300,
      );
}
