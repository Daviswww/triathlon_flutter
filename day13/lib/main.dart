import 'dart:developer';

import 'package:day13/bloc/mybloc_bloc.dart';
import 'package:day13/count_repository.dart';
import 'package:day13/demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final countRepository = CountRepository();
  runApp(
    BlocProvider<MyblocBloc>(
      create: (context) => MyblocBloc(countRepository: countRepository),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<MyblocBloc, MyblocState>(
        builder: (context, state) {
          log("$state");
          if (state is Success) {
            return MyHomePage(count: state.count);
          } else {
            // state is Failure
            return MyHomePage(count: 0);
          }
        },
      ),
    );
  }
}
