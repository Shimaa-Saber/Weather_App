import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/App_serveses/servises.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/weatherCubit/weather_states.dart';




class weatherCubits extends Cubit<weatherStates> {
  services s1;
  weatherModel? weathermodel;
  String ?cityName;
  weatherCubits(this.s1) : super(weatherinitial());


  void getWeather({required String CityName})async {
    emit(isLoading());
   try {
  weathermodel=  await s1.getWeather(city_name: CityName);
     emit(weatherSuccess());
   }on Exception catch(e){
     emit(weatherFailur());
   }

  }

}
