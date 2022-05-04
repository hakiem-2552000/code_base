import 'package:code_base/core/theme/app_text_style.dart';
import 'package:code_base/core/theme/colors.dart';
import 'package:code_base/core/theme/input_decoration_style.dart';
import 'package:code_base/core/utils/constants/value_constants.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  disabledColor: disableColor,
  focusColor: primaryColor,
  scaffoldBackgroundColor: backgroundColor,
  fontFamily: 'NotoSansJP',
  textTheme: _textTheme,
  appBarTheme: _appBarTheme,
  iconTheme: _iconTheme,
  elevatedButtonTheme: _elevatedButtonTheme,
  outlinedButtonTheme: _outlinedButtonTheme,
  buttonTheme: _buttonTheme,
  textButtonTheme: _textButtonTheme,
  inputDecorationTheme: InputDecorationStyle.inputDecorationTheme,
  colorScheme: _colorScheme,
  textSelectionTheme: _textSelectionTheme,
  highlightColor: highlightColor,
);

const _iconTheme = IconThemeData(color: primaryColor);

const _textSelectionTheme = TextSelectionThemeData(
  cursorColor: primaryColor,
);

final _colorScheme = ColorScheme.fromSwatch().copyWith(
  primary: primaryColor,
);

final _textTheme = TextTheme(
  button: AppTextStyle.buttonTextStyle(),
  headline6: AppTextStyle.headline6TextStyle(),
  headline5: AppTextStyle.toolbarTextStyle(),
  headline4: AppTextStyle.titleTextStyle(),
  subtitle1: AppTextStyle.inputTextStyle(),
  bodyText2: AppTextStyle.defaultTextStyle(),
  overline: AppTextStyle.overLineTextStyle(),
);

final _appBarTheme = AppBarTheme(
  centerTitle: true,
  backgroundColor: Colors.white,
  shadowColor: Colors.grey.shade100,
  toolbarTextStyle: AppTextStyle.toolbarTextStyle(),
  titleTextStyle: AppTextStyle.titleTextStyle(),
);

final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
  primary: primaryColor,
  onSurface: disableColor,
  shadowColor: disableColor,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(defaultBorderRadius)),
));

final _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
  shadowColor: primaryColor.withOpacity(0.5),
));

final _outlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    side: const BorderSide(color: primaryColor, width: 0.5),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius)),
  ),
);

final _buttonTheme = ButtonThemeData(
    buttonColor: primaryColor,
    disabledColor: disableColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius)),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap);
