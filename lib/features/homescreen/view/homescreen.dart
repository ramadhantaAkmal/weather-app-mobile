import 'package:flutter/material.dart';
import 'package:weather_app/features/homescreen/data/remote/weather_service.dart';
import 'package:weather_app/features/homescreen/model/forecast_model.dart';
import 'package:weather_app/features/homescreen/model/weather_model.dart';
import 'package:weather_app/features/homescreen/view/widgets/forecast.dart';
import 'package:weather_app/features/homescreen/view/widgets/search_text_field.dart';
import 'package:weather_app/features/homescreen/view/widgets/weather_card.dart';
import 'package:geolocator/geolocator.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  WeatherService weatherService = WeatherService();
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
    windKph: 20.2,
  );

  static const List<ForecastModel> dummyForecast = [
    ForecastModel(
      condition: "Sunny",
      date: "2024-02-08",
      maxTempC: 33.6,
      minTempC: 25.7,
      iconUrl: "https://cdn.weatherapi.com/weather/64x64/day/116.png",
    ),
    ForecastModel(
      condition: "Sunny",
      date: "2024-02-08",
      maxTempC: 33.6,
      minTempC: 25.7,
      iconUrl: "https://cdn.weatherapi.com/weather/64x64/day/116.png",
    ),
    ForecastModel(
      condition: "Sunny",
      date: "2024-02-08",
      maxTempC: 33.6,
      minTempC: 25.7,
      iconUrl: "https://cdn.weatherapi.com/weather/64x64/day/116.png",
    ),
    ForecastModel(
      condition: "Sunny",
      date: "2024-02-08",
      maxTempC: 33.6,
      minTempC: 25.7,
      iconUrl: "https://cdn.weatherapi.com/weather/64x64/day/116.png",
    ),
    ForecastModel(
      condition: "Sunny",
      date: "2024-02-08",
      maxTempC: 33.6,
      minTempC: 25.7,
      iconUrl: "https://cdn.weatherapi.com/weather/64x64/day/116.png",
    ),
    ForecastModel(
      condition: "Sunny",
      date: "2024-02-08",
      maxTempC: 33.6,
      minTempC: 25.7,
      iconUrl: "https://cdn.weatherapi.com/weather/64x64/day/116.png",
    ),
    ForecastModel(
      condition: "Sunny",
      date: "2024-02-08",
      maxTempC: 33.6,
      minTempC: 25.7,
      iconUrl: "https://cdn.weatherapi.com/weather/64x64/day/116.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(context),
      floatingActionButton: _buildFAB(),
    );
  }

  FloatingActionButton _buildFAB() {
    return FloatingActionButton(
      onPressed: () async {
        Position pos = await _determinePosition();
        var res =
            await weatherService.getWeatherCurrent(pos.latitude, pos.longitude);
        print(res.data!.location!.cityName);
      },
      mini: true,
      child: Icon(Icons.gps_fixed_rounded),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: RefreshIndicator(
        onRefresh: () async {},
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
                    ForecastWidget(forecast: dummyForecast),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
