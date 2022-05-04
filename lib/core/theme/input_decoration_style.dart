import 'package:code_base/core/theme/app_text_style.dart';
import 'package:code_base/core/utils/constants/value_constants.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

abstract class InputDecorationStyle {
  static const _borderSide = BorderSide(
    color: primaryColor,
    width: 0.5,
  );

  static final _border = OutlineInputBorder(
    borderSide: _borderSide,
    borderRadius: BorderRadius.circular(defaultBorderRadius),
  );

  static final _enabledBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: disableColor,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(defaultBorderRadius),
  );

  static get _focusBorder =>
      _border.copyWith(borderSide: _borderSide.copyWith(width: 1));

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
      border: _border,
      focusedBorder: _focusBorder,
      enabledBorder: _enabledBorder,
      disabledBorder: _enabledBorder,
      focusColor: primaryColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintStyle: AppTextStyle.hintTextStyle());

  static const _underLineBorder = UnderlineInputBorder(borderSide: _borderSide);
  static final _focusUnderLineBorder = _underLineBorder.copyWith(
    borderSide: _borderSide.copyWith(width: 2),
  );
  static InputDecoration secondInputDecoration = InputDecoration(
      border: _underLineBorder,
      enabledBorder: _underLineBorder,
      focusedBorder: _focusUnderLineBorder,
      focusColor: primaryColor,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintStyle: AppTextStyle.hintTextStyle().copyWith(fontSize: 20));
}
