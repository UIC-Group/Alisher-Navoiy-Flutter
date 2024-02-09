import 'package:flutter/material.dart';
import 'package:alisher_navoi/constants/routes.dart';
import 'package:alisher_navoi/screens/common/splash.dart';
// import 'package:alisher_navoi/screens/profile/balance_refill.dart';


Route createRoute(Widget screen, {int value}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionDuration: Duration(milliseconds: value ?? 200),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = 0.0;
      var end = 1.0;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return FadeTransition(
        opacity: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route<dynamic> generateRoute(RouteSettings settings) {

  switch (settings.name) {
    case splashRoute:
      return MaterialPageRoute(
        builder: (context) => SplashScreen(),
      );
      break;

    default:
      return MaterialPageRoute(
        builder: (context) => SplashScreen(),
      );
  }
}
