import 'dart:developer';

import 'package:flutter/material.dart';

class DemoTextField extends StatefulWidget {
  const DemoTextField({Key? key}) : super(key: key);

  @override
  _DemoTextFieldState createState() => _DemoTextFieldState();
}

class _DemoTextFieldState extends State<DemoTextField> {
  final TextEditingController myController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          child: TextField(
            controller: myController,
            keyboardType: TextInputType.text,
            decoration: fieldDecoration(
              context,
              "hintText",
              "helperText",
            ),
          ),
        ),
        ElevatedButton(
          child: Text('送出'),
          onPressed: () {
            log("${myController.text}");
          },
        ),
      ],
    );
  }

  static InputDecoration fieldDecoration(
    BuildContext context,
    String hintText,
    String helperText,
  ) {
    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.only(left: 15, top: 12, bottom: 12),
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.redAccent,
      ),
      filled: true,
      fillColor: Colors.tealAccent,
      helperText: helperText,
      prefixIcon: Icon(Icons.ac_unit),
      suffixIcon: Icon(Icons.cabin_rounded),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.amber,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blueAccent,
          width: 1,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.limeAccent,
          width: 1,
        ),
      ),
    );
  }
}

class DeomBaseTextField extends StatelessWidget {
  const DeomBaseTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController myController = new TextEditingController();
    return Column(
      children: [
        TextField(
          controller: myController,
          keyboardType: TextInputType.text,
          maxLines: 4,
          onChanged: (String value) {
            log("${value}");
          },
        ),
        ElevatedButton(
          child: Text('送出'),
          onPressed: () {
            log("${myController.text}");
          },
        ),
      ],
    );
  }
}
