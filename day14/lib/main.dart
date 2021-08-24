import 'package:day14/api_manager.dart';
import 'package:day14/api_model.dart';
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
              onPressed: () {
                userRepository.getUser(1);
              },
            ),
            TextButton(
              child: Text(
                "POST",
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {
                userRepository.createUser(
                  User(
                    username: "username",
                    password: "password",
                  ),
                );
              },
            ),
            TextButton(
              child: Text(
                "PULL",
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {
                userRepository.updateUser(
                  1,
                  User(
                    username: "username",
                    password: "xdrcftvgybhunijcftvgbh",
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
