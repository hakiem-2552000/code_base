import 'package:code_base/core/utils/constants/value_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

abstract class DateTimeUtils {
  static Color getWeekDayColor(DateTime date) {
    if (date.weekday == DateTime.saturday) {
      return bermudaGrey;
    }
    if (date.weekday == DateTime.sunday) {
      return redRibbonColor;
    }
    return secondaryTextColor;
  }

  static Duration getTimeDuration(String time) {
    final format = DateFormat(timeFormatPattern);
    final formattedTime = format.parse(time);
    return Duration(hours: formattedTime.hour, minutes: formattedTime.minute);
  }

  static String numberToText(int number) {
    return number.toString().length == 1 ? '0$number' : '$number';
  }

  static DateTime getDateTime(String value) {
    final format = DateFormat(dateFormatPattern);
    return format.parse(value);
  }
}
