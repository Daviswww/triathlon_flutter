import 'dart:developer';

import 'package:flutter/material.dart';

class DemoOutlinedButton extends StatelessWidget {
  const DemoOutlinedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
        child: Text("Hello"),
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.blueGrey,
        ),
        onPressed: () {
          log("click", name: "INFO");
        },
        onLongPress: () {
          log("long click", name: "INFO");
        },
      ),
    );
  }
}

class DemoTextButton extends StatelessWidget {
  const DemoTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(
          "Hello",
          style: TextStyle(color: Colors.white),
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.amber,
        ),
        onPressed: () {
          log("click", name: "INFO");
        },
        onLongPress: () {
          log("long click", name: "INFO");
        },
      ),
    );
  }
}

class DemoIconButton extends StatelessWidget {
  const DemoIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        iconSize: 50,
        color: Colors.amber,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        icon: Icon(Icons.ac_unit),
        onPressed: () {
          log("click", name: "INFO");
        },
      ),
    );
  }
}

class DemoElevatedButton extends StatelessWidget {
  const DemoElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text("Hello"),
        style: ElevatedButton.styleFrom(
          elevation: 20,
        ),
        onPressed: () {
          log("click", name: "INFO");
        },
      ),
    );
  }
}

class DemoNullButton extends StatelessWidget {
  const DemoNullButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
        child: Text("Hello"),
        onPressed: null,
      ),
    );
  }
}
