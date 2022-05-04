import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

part 'app_locale.dart';

const path = 'assets/translations';

class AppLocalization extends StatelessWidget {
  const AppLocalization({Key? key, required this.child}) : super(key: key);

  final Widget child;

  static final supportedLocales =
      AppLocale.values.map((e) => e.locale).toList();
  static final fallbackLocale = AppLocale.en.locale;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
        supportedLocales: supportedLocales,
        path: path,
        fallbackLocale: fallbackLocale,
        child: child);
  }
}
