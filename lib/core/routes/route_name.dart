part of 'app_pages.dart';

enum RouteName {
  root,
  login,
  numberTrivia,
}

RouteName? getRouteName(String? name) {
  for (var routeName in RouteName.values) {
    if (routeName.path == name) {
      return routeName;
    }
  }
}

extension RouteNameExtension on RouteName {
  String get path {
    switch (this) {
      case RouteName.root:
        return '/';
      case RouteName.login:
        return '/login';
      case RouteName.numberTrivia:
        return '/number_trivia';
    }
  }
}
