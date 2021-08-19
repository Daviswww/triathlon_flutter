import 'package:flutter/material.dart';

class DemoTextFamily extends StatelessWidget {
  const DemoTextFamily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Hello World",
        style: TextStyle(fontFamily: 'asd'),
      ),
    );
  }
}

class DemoRichText extends StatelessWidget {
  const DemoRichText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Hi, ',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Hello',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            TextSpan(
              text: ' World',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DemoTextStyle extends StatelessWidget {
  const DemoTextStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hello World",
          style: myStyle(),
        ),
        Text(
          "Hello World",
          style: myStyle(),
        ),
        Text(
          "Hello World",
          style: myStyle(),
        ),
      ],
    );
  }

  TextStyle myStyle() {
    return TextStyle(
      color: Colors.red,
      fontSize: 50,
    );
  }
}

class DemoText extends StatelessWidget {
  const DemoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello World"),
    );
  }
}

class DemoTextValue extends StatelessWidget {
  const DemoTextValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String str = "world";
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Hello ${str}"),
      ],
    );
  }
}

class DemoTextClassValue extends StatelessWidget {
  const DemoTextClassValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final word = Word();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Hello ${word.str}"),
      ],
    );
  }
}

class Word {
  final String str = "World";
}
