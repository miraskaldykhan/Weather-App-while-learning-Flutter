import 'package:flutter/material.dart';
import 'package:razdel10_practica/models/weather_forecast_daily.dart';
import 'package:razdel10_practica/widgets/Forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  BottomListView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "7-DAY Weather Forecast".toUpperCase(),
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
              width: 8,
            ),
            itemCount: snapshot.data.list.length,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(12)
              ),
              width: MediaQuery.of(context).size.width / 2.0,
              height: 160,
              child: forecastCard(snapshot, index),
            ),
          ),
        ),
      ],
    );
  }
}
