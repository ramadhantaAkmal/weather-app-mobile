import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/homescreen/model/weather_model.dart';

class WeatherService {
  final dio = Dio();

  Future<DataState<WeatherModel>> getWeatherCurrent(
      double lat, double lon) async {
    String currWeatherUrl =
        "http://api.weatherapi.com/v1/current.json?key=4da0a9eafe47413289b103758240602&q=${lat},${lon}";
    String timeUrl =
        "http://api.weatherapi.com/v1/astronomy.json?key=4da0a9eafe47413289b103758240602&q=${lat},${lon}";
    var data;
    try {
      final responseWeatherData = await dio.get(
        currWeatherUrl,
      );

      final responseTimeData = await dio.get(
        timeUrl,
      );

      if (responseTimeData.statusCode == HttpStatus.ok &&
          responseWeatherData.statusCode == HttpStatus.ok) {
        data = WeatherModel.fromJson(
            responseWeatherData.data, responseTimeData.data);

        return DataSuccess(data);
      } else {
        return DataFailed(DioException(
          error:
              "${responseTimeData.statusMessage} and ${responseWeatherData.statusMessage}",
          response: responseTimeData,
          type: DioExceptionType.badResponse,
          requestOptions: responseTimeData.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
