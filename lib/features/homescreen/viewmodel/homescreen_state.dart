import 'package:dio/dio.dart';
import 'package:weather_app/features/homescreen/model/forecast_model.dart';
import 'package:weather_app/features/homescreen/model/weather_model.dart';

class HomescreenState {
  final WeatherModel? weather;
  final List<ForecastModel>? forecast;
  final DioException? error;

  const HomescreenState({this.weather, this.forecast, this.error});
}

class HomescreenLoad extends HomescreenState {
  const HomescreenLoad();
}

class HomescreenSuccess extends HomescreenState {
  const HomescreenSuccess({
    WeatherModel? weather,
    List<ForecastModel>? forecast,
  }) : super(weather: weather, forecast: forecast);
}

class HomescreenError extends HomescreenState {
  const HomescreenError({DioException? error}) : super(error: error);
}
