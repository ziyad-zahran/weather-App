import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String condition;
  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.condition});
  factory WeatherModel.json(dynamic data) {
    var jsondata = data["forecast"]["forecastday"][0]["day"];
    return WeatherModel(
        date: (data["location"]["localtime"]),
        temp: jsondata["avgtemp_c"],
        maxTemp: jsondata["maxtemp_c"],
        minTemp: jsondata["mintemp_c"],
        condition: jsondata["condition"]["text"]);
  }
  String getImage() {
    if(condition == 'Sunny' || condition == 'Clear' || condition == 'partly cloudy'){
        return 'assets/images/clear.png';
    }
    else if(condition == 'Freezing fog' || condition == 'Fog' || condition == 'Heavy Cloud' || condition == 'Mist'){
      return 'assets/images/cloudy.png';
    }
    else if (condition == 'Patchy rain possible' ||
        condition == 'Heavy rain' ||
        condition == 'Showers	') {
      return 'assets/images/rainy.png';
    }
    else if (condition == 'Thundery outbreaks possible' || condition == 'Moderate or heavy snow with thunder' || condition == 'Patchy light snow with thunder'|| condition == 'Moderate or heavy rain with thunder' || condition == 'Patchy light rain with thunder' ) {
      return 'assets/images/thunderstorm.png';
    }
    else
      {
        return 'assets/images/clear.png';
      }
  }
  MaterialColor getThemeColor() {
    if (condition == 'Sunny' || condition == 'Clear' ||  condition == 'partly cloudy') {
      return Colors.orange;
    } else if (

    condition == 'Blizzard' ||  condition == 'Patchy snow possible'  ||  condition == 'Patchy sleet possible' || condition == 'Patchy freezing drizzle possible' || condition == 'Blowing snow') {
      return Colors.blue;
    } else if (condition == 'Freezing fog' || condition == 'Fog' ||  condition == 'Heavy cloud' || condition == 'Mist' || condition == 'Fog') {
      return Colors.blueGrey;
    } else if (condition == 'Patchy rain possible' ||
        condition == 'Heavy rain' ||
        condition == 'Showers	') {
      return Colors.blue;
    } else if (condition == 'Thundery outbreaks possible' || condition == 'Moderate or heavy snow with thunder' || condition == 'Patchy light snow with thunder'|| condition == 'Moderate or heavy rain with thunder' || condition == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }

}

