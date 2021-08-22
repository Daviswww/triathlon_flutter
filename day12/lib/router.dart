import 'package:auto_route/auto_route.dart';
import 'package:day12/demo.dart';
import 'package:day12/transitions.dart';

// flutter pub run build_runner watch --delete-conflicting-outputs

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: LoginScreen, initial: true),
    AutoRoute(path: '/home-screen', page: HomeScreen),
    CustomRoute(
      path: '/menu-screen',
      page: MenuScreen,
      // transitionsBuilder: TransitionsBuilders.fadeIn,
      transitionsBuilder: MyTransitions.slideBottomToTop,
      durationInMilliseconds: 1000,
    ),
  ],
)
class $AppRouter {}
