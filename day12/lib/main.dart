import 'package:day12/demo.dart';
import 'package:day12/router.gr.dart';
import 'package:flutter/material.dart';

void main() {
  final AppRouter appRouter = AppRouter();
  runApp(
    MyApp(
      appRouter: appRouter,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter;

  MyApp({
    Key? key,
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: (context, router) => router!,
    );
  }
}
