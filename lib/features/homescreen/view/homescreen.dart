import 'package:flutter/material.dart';
import 'package:weather_app/features/homescreen/model/weather_model.dart';
import 'package:weather_app/features/homescreen/view/widgets/forecast.dart';
import 'package:weather_app/features/homescreen/view/widgets/search_text_field.dart';
import 'package:weather_app/features/homescreen/view/widgets/weather_card.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  static const WeatherModel dummyWeather = WeatherModel(
      location: Location(cityName: "Jakarta", localtime: "2024-02-08 15:11"),
      condition: Condition(
          conditionName: "Partly cloudy",
          iconUrl: "https://cdn.weatherapi.com/weather/64x64/day/116.png"),
      humidity: 71,
      sunriseTime: "05:57 AM",
      sunsetTime: "06:17 PM",
      tempC: 31.0,
      windDir: "NW",
      windKph: 20.2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(context),
      backgroundColor: Color(0xFFF1F1F1),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //search text field
          const SearchTextField(),

          //body
          Expanded(
            flex: 8,
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: const Column(
                children: [
                  //weather card
                  WeatherCard(weather: dummyWeather),

                  //weather forecast
                  ForecastWidget(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
