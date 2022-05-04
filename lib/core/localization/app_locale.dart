part of 'app_localization.dart';

enum AppLocale { en, vi }

extension AppLocaleExtension on AppLocale {
  Locale get locale {
    switch (this) {
      case AppLocale.en:
        return const Locale('en', 'US');
      case AppLocale.vi:
        return const Locale('vi', 'VN');
    }
  }
}
