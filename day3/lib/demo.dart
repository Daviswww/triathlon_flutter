import 'package:flutter/material.dart';

class DemoDecorationContainer extends StatelessWidget {
  const DemoDecorationContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            blurRadius: 4,
            offset: Offset(4, 8),
          ),
        ],
        color: Colors.amber,
        border: Border.all(
          color: Colors.black,
          width: 8,
        ),
        borderRadius: BorderRadius.circular(12),
        // shape: BoxShape.circle,
      ),
    );
  }
}

class DemoMarginContainer extends StatelessWidget {
  const DemoMarginContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.amber,
      child: Container(
        margin: EdgeInsets.all(30),
        color: Colors.black,
      ),
    );
  }
}

class DemoPaddingContainer extends StatelessWidget {
  const DemoPaddingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.amber,
      padding: EdgeInsets.all(30),
      child: Container(
        color: Colors.black,
      ),
    );
  }
}

class DemoBaseContainer extends StatelessWidget {
  const DemoBaseContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 100,
        maxHeight: 100,
        minWidth: 50,
        minHeight: 50,
      ),
      alignment: Alignment.center,
      color: Colors.amber,
      child: Text("Hello"),
    );
  }
}

class DemoConstraintsContainer extends StatelessWidget {
  const DemoConstraintsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 100,
        maxHeight: 100,
        minWidth: 50,
        minHeight: 50,
      ),
      alignment: Alignment.center,
      color: Colors.amber,
      child: Text("Hello"),
    );
  }
}
