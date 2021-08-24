import 'dart:developer';

import 'package:day15/api_manager.dart';
import 'package:day15/api_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final UserRepository userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: Text(
                "GET",
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () async {
                final getUser = await userRepository.getUser(1);
                getUser.fold(
                  (failure) => log("$failure"),
                  (get) => log("$get"),
                );
              },
            ),
            TextButton(
              child: Text(
                "POST",
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () async {
                final createUser = await userRepository.createUser(
                  User(
                    username: "username",
                    password: "password",
                  ),
                );
                createUser.fold(
                  (failure) => log("$failure"),
                  (get) => log("$get"),
                );
              },
            ),
            TextButton(
              child: Text(
                "PULL",
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () async {
                final updateUser = await userRepository.updateUser(
                  1,
                  User(
                    username: "username",
                    password: "xdrcftvgybhunijcftvgbh",
                  ),
                );

                updateUser.fold(
                  (failure) => log("$failure"),
                  (get) => log("$get"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
