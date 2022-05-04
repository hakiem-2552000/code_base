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
  return null;
}

extension RouteNameExtension on RouteName {
  String get path {
    if (this == RouteName.root) {
      return '/';
    }
    return '/${toString().split('.').last}';
  }
}
