import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/App_serveses/servises.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weatherProvider.dart';
import 'package:weather_app/weatherCubit/weatherCubits.dart';

var ScaffoldKey=GlobalKey<ScaffoldState>();
var formkey=GlobalKey<FormState>();
var dateControler=TextEditingController();

class search extends StatelessWidget {

String ?city_name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
    backgroundColor: Colors.orangeAccent,
    title: Text('Search a city ',style: TextStyle(fontWeight: FontWeight.bold),),
    ),
    body:


    SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Column(
          children: [
            Image(image: AssetImage('assets/images/R (1).jpeg',)),
            Center(


                child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 10),

              child: TextFormField(
                controller:dateControler,


                onFieldSubmitted: (data) async{
                  city_name=data;
                  BlocProvider.of<weatherCubits>(context).getWeather(CityName: city_name!);
                  BlocProvider.of<weatherCubits>(context).cityName=city_name;


                 Navigator.pop(context);
                },
                decoration:

                InputDecoration(


                  hintText: '   Enter City Name',
                  label: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text('Search',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  prefixIcon: Icon(Icons.search,),
                  contentPadding: EdgeInsets.symmetric(vertical: 25),

                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'you must enter a city name';
                  }
                },


              ),
            )),
          ],
        ),
      ),
    ),
    );
  }
}


