// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import 'demo.dart' as _i3;
import 'transitions.dart' as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoginScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.LoginScreen();
        }),
    HomeScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.HomeScreen();
        }),
    MenuScreen.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.MenuScreen();
        },
        transitionsBuilder: _i4.MyTransitions.slideBottomToTop,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false)
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LoginScreen.name, path: '/'),
        _i1.RouteConfig(HomeScreen.name, path: '/home-screen'),
        _i1.RouteConfig(MenuScreen.name, path: '/menu-screen')
      ];
}

class LoginScreen extends _i1.PageRouteInfo {
  const LoginScreen() : super(name, path: '/');

  static const String name = 'LoginScreen';
}

class HomeScreen extends _i1.PageRouteInfo {
  const HomeScreen() : super(name, path: '/home-screen');

  static const String name = 'HomeScreen';
}

class MenuScreen extends _i1.PageRouteInfo {
  const MenuScreen() : super(name, path: '/menu-screen');

  static const String name = 'MenuScreen';
}
