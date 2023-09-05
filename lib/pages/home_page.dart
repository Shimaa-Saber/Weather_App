import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search.dart';
import 'package:weather_app/provider/weatherProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weatherCubit/weatherCubits.dart';
import 'package:weather_app/weatherCubit/weather_states.dart';
class home_page extends StatelessWidget {
   home_page({Key? key}) : super(key: key);





  weatherModel? weatherData;
  @override
  Widget build(BuildContext context) {



    return Scaffold(

      appBar: AppBar(

        title: Text('Weather',style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return search();
          },));
        }, icon: Icon(Icons.search))
        ],
      ),




      body:BlocBuilder<weatherCubits,weatherStates>(
        builder: (context,state){
          if(state is isLoading){
            return Center(child: CircularProgressIndicator());
          }
          else if(state is weatherSuccess){
           weatherData= BlocProvider.of<weatherCubits>(context).weathermodel;
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    weatherData!.getThemeColor(),
                    weatherData!.getThemeColor()[300]!,
                    weatherData!.getThemeColor()[100]!,

                  ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                  )
              ),

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 3,),

                  Text('updated at: ${weatherData!.date.hour.toString()}: ${weatherData!.date.minute.toString()}',style: TextStyle(fontSize: 25,),),
                  Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text('${weatherData!.Temp.toInt()}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      Column(children: [
                        Text('maxTemp: ${weatherData!.maxtemp.toInt()}',style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('minTemp: ${weatherData!.mintemp.toInt()}',style: TextStyle(fontWeight: FontWeight.bold)),

                      ],)
                    ],
                  ),
                  Spacer(),
                  Text(weatherData!.weatherState,style: TextStyle(fontSize: 27,fontWeight:FontWeight.bold),),


                  Spacer(flex: 5,)
                ],

              ),

            );
          }
          else if(state is weatherFailur){
            return Center(child: Text('something went wrong please try again'),);
          }
          else{
            return  Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('assets/images/n2.jpg')),
                  Center(



                    child: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Text('there is no weather 😞 start searching now 🔍',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),

                    ),
                  ),
                ],
              ),
            );
          }

      }

      )








    );
  }
}
