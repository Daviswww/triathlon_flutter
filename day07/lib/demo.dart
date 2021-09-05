import 'package:flutter/material.dart';

class DemoStack extends StatelessWidget {
  const DemoStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.amber,
        ),
        Container(
          width: 75,
          height: 75,
          color: Colors.redAccent,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.blueAccent,
        ),
      ],
    );
  }
}

class DemoPositionedStack extends StatelessWidget {
  const DemoPositionedStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.amber,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
