import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
class services{
  Future<weatherModel> getWeather( {required String city_name})async
  {
    String baseUrl='http://api.weatherapi.com/v1';
    String apiKey='552135087ff841d2997203559232007';
    Uri url= Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$city_name&days=7');

    http.Response response =await http.get(url);
    Map<String,dynamic> data= jsonDecode(response.body);
    print(data);
    var jasonData=data['forecast']['forecastday'][0];

   weatherModel weather= weatherModel.fromJson(data);

return weather;
  }

}