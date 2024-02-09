import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/homescreen/model/forecast_model.dart';
import 'package:weather_app/features/homescreen/model/weather_model.dart';

import '../../model/search_model.dart';

class WeatherService {
  final dio = Dio();

  Future<DataState<WeatherModel>> getWeatherCurrent(
      double lat, double lon) async {
    String currWeatherUrl =
        "http://api.weatherapi.com/v1/current.json?key=4da0a9eafe47413289b103758240602&q=${lat},${lon}";
    String timeUrl =
        "http://api.weatherapi.com/v1/astronomy.json?key=4da0a9eafe47413289b103758240602&q=${lat},${lon}";
    try {
      final responseWeatherData = await dio.get(
        currWeatherUrl,
      );

      final responseTimeData = await dio.get(
        timeUrl,
      );

      if (responseTimeData.statusCode == HttpStatus.ok &&
          responseWeatherData.statusCode == HttpStatus.ok) {
        var data = WeatherModel.fromJson(
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

  Future<DataState<List<ForecastModel>>> getForecast(
      double lat, double lon) async {
    String forecastUrl =
        "http://api.weatherapi.com/v1/forecast.json?key=4da0a9eafe47413289b103758240602&q=${lat},${lon}&days=7";

    try {
      final response = await dio.get(
        forecastUrl,
      );

      if (response.statusCode == HttpStatus.ok) {
        var rawData = response.data["forecast"]["forecastday"] as List;
        var data = rawData.map((e) => ForecastModel.fromJson(e)).toList();
        return DataSuccess(data);
      } else {
        return DataFailed(DioException(
          error: response.statusMessage,
          response: response,
          type: DioExceptionType.badResponse,
          requestOptions: response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  Future<List<SearchModel>> searchCity(String query) async {
    String searchUrl =
        "http://api.weatherapi.com/v1/search.json?key=4da0a9eafe47413289b103758240602&q=${query}";

    try {
      final response = await dio.get(
        searchUrl,
      );

      if (response.statusCode == HttpStatus.ok) {
        var rawData = response.data as List;
        var data = rawData.map((e) => SearchModel.fromJson(e)).toList();
        return data;
      } else {
        log(response.statusMessage.toString());
        return [];
      }
    } on DioException catch (e) {
      log(e.toString());
      return [];
    }
  }
}
