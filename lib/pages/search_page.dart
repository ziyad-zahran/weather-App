import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';
class SearchPage extends StatelessWidget {
  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            onSubmitted:  (data) async
            {
              cityName=data;
              WeatherService service = WeatherService();
              WeatherModel weather = await service.getCity(cityName: cityName!);
              Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
              Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 24,horizontal: 16),
              label: Text('Search'),
              border: OutlineInputBorder(),
              hintText: 'Enter City',
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
