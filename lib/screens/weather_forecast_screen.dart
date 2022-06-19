import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:razdel10_practica/api/weather_api.dart';
import 'package:razdel10_practica/models/weather_forecast_daily.dart';
import 'package:razdel10_practica/screens/city_screen.dart';
import 'package:razdel10_practica/widgets/bottom_list_view.dart';
import 'package:razdel10_practica/widgets/city_view.dart';
import 'package:razdel10_practica/widgets/detail_view.dart';
import 'package:razdel10_practica/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;

  WeatherForecastScreen({this.locationWeather});

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast> forecastObject;
  String _cityName;

  //String _cityName;

  @override
  void initState() {
    super.initState();

    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }

    forecastObject.then((weather) {
      print(weather.list[0].weather[0].main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("openweathermap.org"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () async {
              var tappedName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return CityScreen();
              }));
              if (tappedName != null) {
                setState(() {
                  _cityName = tappedName;
                  forecastObject = WeatherApi()
                      .fetchWeatherForecast(cityName: _cityName, isCity: true);
                });
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 50.0,
                      ),
                      CityView(
                        snapshot: snapshot,
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      TempView(
                        snapshot: snapshot,
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      DetailView(
                        snapshot: snapshot,
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      BottomListView(
                        snapshot: snapshot,
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: Text(
                      "City not found\nPlease, enter correct city",
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
