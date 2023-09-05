import 'package:flutter/material.dart';

class weatherModel{
  DateTime date;
   double maxtemp;
   double mintemp;
   String weatherState;
   double Temp;
  weatherModel({required this.date,required this.maxtemp,required this.mintemp,required this.weatherState,required this.Temp});

   factory weatherModel.fromJson(data){
    var jasonData=data['forecast']['forecastday'][0]['day'];

    return weatherModel(
        date: DateTime.parse( data['current']['last_updated']),
    maxtemp: jasonData['maxtemp_c'],
    mintemp: jasonData['mintemp_c'],
    weatherState: jasonData['condition']['text'],
    Temp: jasonData['avgtemp_c']);
  }

   @override
   String toString(){
     return 'temp = $Temp ,maxtemp = $maxtemp , mintemp=$mintemp';
   }

   String getImage() {
     if (weatherState == 'Sunny' || weatherState == 'Clear' ||  weatherState == 'partly cloudy') {
       return 'assets/images/clear.png';
     } else if (

     weatherState == 'Blizzard' ||  weatherState == 'Patchy snow possible'  ||  weatherState == 'Patchy sleet possible' || weatherState == 'Patchy freezing drizzle possible' || weatherState == 'Blowing snow') {
       return 'assets/images/snow.png';
     } else if (weatherState == 'Freezing fog' || weatherState == 'Fog' ||  weatherState == 'Heavy Cloud' || weatherState == 'Mist' || weatherState == 'Fog') {
       return 'assets/images/cloudy.png';
     } else if (weatherState == 'Patchy rain possible' ||
         weatherState == 'Heavy Rain' ||
         weatherState == 'Showers	'||weatherState == 'Moderate rain	') {
       return 'assets/images/rainy.png';

     } else if (weatherState == 'Thundery outbreaks possible' || weatherState == 'Moderate or heavy snow with thunder' || weatherState == 'Patchy light snow with thunder'|| weatherState == 'Moderate or heavy rain with thunder' || weatherState == 'Patchy light rain with thunder' ) {
       return 'assets/images/thunderstorm.png';
     } else {
       return 'assets/images/clear.png';
     }
   }


   MaterialColor getThemeColor() {
     if (weatherState == 'Sunny' || weatherState == 'Clear' ||  weatherState == 'partly cloudy') {
       return Colors.orange;
     } else if (

     weatherState == 'Blizzard' ||  weatherState == 'Patchy snow possible'  ||  weatherState == 'Patchy sleet possible' || weatherState == 'Patchy freezing drizzle possible' || weatherState== 'Blowing snow') {
       return Colors.blue;
     } else if (weatherState == 'Freezing fog' || weatherState == 'Fog' ||  weatherState == 'Heavy Cloud' || weatherState == 'Mist' || weatherState == 'Fog') {
       return Colors.blueGrey;
     } else if (weatherState == 'Patchy rain possible' ||
         weatherState == 'Heavy Rain' ||
         weatherState == 'Showers	') {
       return Colors.blue;
     } else if (weatherState == 'Thundery outbreaks possible' || weatherState== 'Moderate or heavy snow with thunder' || weatherState == 'Patchy light snow with thunder'|| weatherState== 'Moderate or heavy rain with thunder' || weatherState == 'Patchy light rain with thunder' ) {
       return Colors.deepPurple;
     } else {
       return Colors.orange;
     }
   }

}