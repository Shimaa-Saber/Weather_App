import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/App_serveses/servises.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/provider/weatherProvider.dart';
import 'package:weather_app/weatherCubit/weatherCubits.dart';

void main() {
  runApp(BlocProvider(
      create:(context){
        return weatherCubits(services());
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        theme: ThemeData(
          primarySwatch: BlocProvider.of<weatherCubits>(context).weathermodel == null ?  Colors.blue : BlocProvider.of<weatherCubits>(context).weathermodel!.getThemeColor()  ,
        ),
      debugShowCheckedModeBanner: false,
      home:home_page() ,
    );
  }
}