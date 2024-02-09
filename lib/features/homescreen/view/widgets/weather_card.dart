import 'package:flutter/material.dart';
import 'package:weather_app/features/homescreen/model/weather_model.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          decoration: const BoxDecoration(
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
                      style: const TextStyle(fontSize: 32),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            weather.condition?.conditionName ?? "null",
                            style: const TextStyle(fontSize: 20),
                            maxLines: 2,
                          ),
                        ),
                        Flexible(
                          child: Image.network(
                              height: 47,
                              "https:${weather.condition?.iconUrl ?? "//cdn.weatherapi.com/weather/64x64/day/116.png"}"),
                        ),
                      ],
                    ),
                    Text(
                      "${weather.tempC}°C",
                      style:
                          const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Sunrise",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          weather.sunriseTime ?? "00.00",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Wind",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${weather.windKph} K/h",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Sunset",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          weather.sunsetTime ?? "00.00",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        )
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Flexible(
                        flex: 4,
                        child: Text(
                          "Humidity",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                    const Spacer(),
                    Flexible(
                        flex: 4,
                        child: Text(
                          "${weather.humidity}%",
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
