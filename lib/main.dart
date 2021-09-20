import 'package:bloc_test/pages/bloc/home_bloc.dart';
import 'package:bloc_test/pages/bloc/home_event.dart';
import 'package:bloc_test/pages/bloc/home_state.dart';
import 'package:bloc_test/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc(HomeLoadingState())..add(HomeFetchListWithEmptyList()),
        child: HomePage(),
        ),
    );
  }
}