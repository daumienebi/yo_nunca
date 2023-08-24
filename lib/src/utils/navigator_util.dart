import 'package:flutter/material.dart';

/// Util page to navigate through out the app with different types of
/// animations
class NavigatorUtil{

  /// Simple PageRouteBuilder to navigate to another page with a FadeTransition
  ///
  /// [arguments] : The arguments to be passed to the new page
  ///
  /// [routeName] : The name of the new page in "String" format, for example
  /// [AppRoutes.routeStrings.helpPage] i.e 'helpPage' or any other way
  /// the route String is implemented. The newPage and arguments values are
  /// enough to navigate to the new page.
  ///
  ///  [newPage] : The new page to be passed,a Widget.For example [HelpPage]
  static Route createRouteWithSlideAnimation({Object? arguments,String? routeName,
    required Widget newPage}) {
    return PageRouteBuilder(
      settings: RouteSettings(
          name: routeName,
          arguments: arguments
      ),
      pageBuilder: (context, animation, secondaryAnimation) => newPage,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
          reverseCurve: Curves.easeOut.flipped,
        );
        return SlideTransition(
          position: tween.animate(curvedAnimation),
          //opacity: animation,
          child: child,
        );
      },
    );
  }

  /// Simple PageRouteBuilder to navigate to another page with a FadeTransition
  ///
  /// [arguments] : The arguments to be passed to the new page
  ///
  /// [routeName] : The name of the new page in "String" format, for example
  /// [AppRoutes.routeStrings.helpPage] i.e 'wishListPage' or any other way
  /// the route String is implemented. The newPage and arguments values are
  /// enough to navigate to the new page.
  ///
  ///  [newPage] : The new page to be passed,a Widget.For example [WishListPage]
  static Route createRouteWithFadeAnimation({Object? arguments,String? routeName,
    required Widget newPage}) {
    return PageRouteBuilder(
      settings: RouteSettings(
          name: routeName,
          arguments: arguments
      ),
      pageBuilder: (context, animation, secondaryAnimation) => newPage,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}