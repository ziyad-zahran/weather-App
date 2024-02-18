import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
class WeatherService
{
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'bda894799f324dbcbb904229220812';
  Future<WeatherModel> getCity({required String cityName}) async
  {
    Uri url = Uri.parse(
      '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=5&aqi=no&alerts=no',
    );
    http.Response response = await http.get(url);
    Map< String,dynamic> data =jsonDecode(response.body);
    WeatherModel weather = WeatherModel.json(data);
    return weather;

  }
}