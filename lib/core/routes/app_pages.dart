import 'package:code_base/features/number_trivia/presentation/page/number_trivia_page.dart';
import 'package:flutter/material.dart';

part 'route_name.dart';

class AppPages {
  //TODO: replace numberTrivia with another route
  static final INITIAL = RouteName.numberTrivia.path;

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    RouteName? routeName = getRouteName(settings.name);
    if (routeName == null) {
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
    }
    switch (routeName) {
      case RouteName.root:
        return MaterialPageRoute(builder: (_) => Container());
      case RouteName.login:
        return MaterialPageRoute(builder: (_) => Container());
      case RouteName.numberTrivia:
        return MaterialPageRoute(builder: (_) => const NumberTriviaPage());
    }
  }
}
