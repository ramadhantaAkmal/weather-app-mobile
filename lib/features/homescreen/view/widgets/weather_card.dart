import 'package:flutter/material.dart';
import 'package:weather_app/features/homescreen/model/weather_model.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.sizeOf(context).width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        margin: EdgeInsets.zero,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/weather-card.jpg"),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weather.location?.cityName ?? "null",
                      style: TextStyle(fontSize: 32),
                    ),
                    Row(
                      children: [
                        Text(
                          weather.condition?.conditionName ?? "null",
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Image.network(
                              height: 47,
                              weather.condition?.iconUrl ??
                                  "https://cdn.weatherapi.com/weather/64x64/day/116.png"),
                        ),
                      ],
                    ),
                    Text(
                      "${weather.tempC}°C",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Sunrise",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          weather.sunriseTime ?? "00.00",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Wind",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${weather.windKph} K/h",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Sunset",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          weather.sunsetTime ?? "00.00",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        )
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        flex: 4,
                        child: Text(
                          "Humidity",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                    Spacer(),
                    Flexible(
                        flex: 4,
                        child: Text(
                          "${weather.humidity}%",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
