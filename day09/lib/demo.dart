import 'dart:developer';

import 'package:flutter/material.dart';

class DemoOutlinedButton extends StatelessWidget {
  const DemoOutlinedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
        child: Text("Hello"),
        onPressed: () {
          log("click", name: "INFO");
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
      child: OutlinedButton(
        child: Text("Hello"),
        onPressed: () {
          log("click", name: "INFO");
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
        icon: Icon(Icons.ac_unit),
        onPressed: () {
          log("click", name: "INFO");
        },
      ),
    );
  }
}
