import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MyTransitions extends TransitionsBuilders {
  static const RouteTransitionsBuilder slideBottomToTop = _slideBottomToTop;

  static Widget _slideBottomToTop(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
