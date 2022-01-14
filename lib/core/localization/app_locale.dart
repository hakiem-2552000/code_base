part of 'app_localization.dart';

enum AppLocale { en, vi }

extension AppLocaleExtension on AppLocale {
  Locale get locale {
    switch (this) {
      case AppLocale.en:
        return Locale('en', 'US');
      case AppLocale.vi:
        return Locale('vi', 'VN');
    }
  }
}
