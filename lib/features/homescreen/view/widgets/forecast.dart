import 'package:flutter/material.dart';
import 'package:weather_app/features/homescreen/model/forecast_model.dart';
import 'package:intl/intl.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({super.key, required this.forecast});

  final List<ForecastModel> forecast;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "7-Day Forecast",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: forecast.length,
                  itemBuilder: (context, i) {
                    DateTime parsedDate =
                        DateTime.parse(forecast[i].date ?? "01-01-2000");

                    String formattedDate =
                        DateFormat("dd MMMM yyyy").format(parsedDate);
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: SizedBox(
                              child: Image.network(
                                  "https:${forecast[i].iconUrl ?? "//cdn.weatherapi.com/weather/64x64/day/116.png"}"),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  forecast[i].condition ?? "null",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  formattedDate,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Text(
                                "${forecast[i].minTempC?.toInt()}°/${forecast[i].maxTempC?.toInt()}°"),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
