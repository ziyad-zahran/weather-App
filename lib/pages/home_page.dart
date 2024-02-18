import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';

import '../providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi()
  {
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {

    WeatherModel? weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
            onPressed: ()
            {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)
                  {
                    return SearchPage(updateUi: updateUi,);
                  }),
              );
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: weatherData  == null
          ?Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ) :Container(
        decoration: BoxDecoration(
          gradient:LinearGradient(
            colors: [
              weatherData.getThemeColor(),
              weatherData.getThemeColor()[300]!,
              weatherData.getThemeColor()[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ) ,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 3,),
            Text(
                '${Provider.of<WeatherProvider>(context,listen: false).cityName!}',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold
              ),
            ),
            Text('${weatherData.date}',
              style: TextStyle(
                  fontSize: 20,
              ),),
            Spacer(flex: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('${weatherData.getImage()}'),
                Text(
                    '${weatherData.temp.toInt()}',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500
                  ),

                ),
                Column(
                  children: [
                    Text(
                        'max: ${weatherData.maxTemp.toInt()}',
                        style: TextStyle(
                          fontSize: 18
                        ),
                    ),
                    Text('min: ${weatherData.minTemp.toInt()}',
                      style: TextStyle(
                          fontSize: 18
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(flex: 1,),
            Text(
              '${weatherData.condition}',
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold
              ),
            ),
            Spacer(flex: 6,),
          ],
        ),
      ),
    );
  }
}
