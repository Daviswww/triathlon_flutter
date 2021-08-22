import 'package:flutter/material.dart';
import 'package:day12/router.gr.dart';
import 'package:auto_route/auto_route.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text("Sign out"),
              onPressed: () {
                AutoRouter.of(context).replaceNamed("/");
              },
            ),
            TextButton(
              child: Text("Menu"),
              onPressed: () {
                AutoRouter.of(context).navigateNamed("/menu-screen");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginScreen"),
      ),
      backgroundColor: Colors.indigo[50],
      body: Center(
        child: TextButton(
          child: Text("Sign in"),
          onPressed: () {
            AutoRouter.of(context).replaceNamed("/home-screen");
          },
        ),
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MenuScreen"),
      ),
      backgroundColor: Colors.indigoAccent,
      body: Center(
        child: TextButton(
          child: Text("MenuScreen"),
          onPressed: () {
            AutoRouter.of(context).pop();
          },
        ),
      ),
    );
  }
}
