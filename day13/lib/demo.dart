import 'package:day13/bloc/mybloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  final int _count;
  const MyHomePage({
    Key? key,
    required int count,
  })  : _count = count,
        super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ("${widget._count}"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  BlocProvider.of<MyblocBloc>(context)
                      .add(IncrementEvent(widget._count));
                },
                child: Text("Add"),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<MyblocBloc>(context)
                      .add(DecrementEvent(widget._count));
                },
                child: Text("Dec"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
