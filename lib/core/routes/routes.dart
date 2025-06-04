import 'package:flutter/material.dart';
import 'package:gen_cert/core/logger/logger.dart';
import 'package:gen_cert/core/routes/app_routes.dart';
import 'package:gen_cert/core/routes/arguments/detailed_argument.dart';
import 'package:gen_cert/core/routes/routing_transitions.dart';
import 'package:gen_cert/features/auth/presentation/login/page/login_page.dart';
import 'package:gen_cert/features/auth/presentation/welcome/welcome_page.dart';
import 'package:gen_cert/features/main/presentation/pages/main_page.dart';

class Routes {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? arguments = settings.arguments;
    final appRoute = AppRoutes.fromPath(
      settings.name ?? '',
      id: arguments is DetailedArgument ? arguments.pathId : null,
    );
    try {
      switch (appRoute) {
        case AppRoutes.main:
          return RoutingTransitions.animRoute(
            const MainPage(),
            settings: settings,
          );
        case AppRoutes.login:
          return RoutingTransitions.animRoute(
            const LoginPage(),
            settings: settings,
          );
        case AppRoutes.welcome:
          return RoutingTransitions.animRoute(
            const WelcomePage(),
            settings: settings,
          );
        default:
          logger.w('Tried to navigate to a Page not mapped in our Routers ${settings.name}');
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Text('Page Not Found'),
            ),
          );
      }
    } catch (e, s) {
      logger.e('[Routes] - Cannot generate route', error: e, stackTrace: s);
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Text(
            'Page Not Found, make sure you pass the correct arguments',
          ),
        ),
      );
    }
  }
}
