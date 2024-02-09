import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/homescreen/data/remote/weather_service.dart';
import 'package:weather_app/features/homescreen/model/weather_model.dart';
import 'package:weather_app/features/homescreen/viewmodel/homescreen_event.dart';
import 'package:weather_app/features/homescreen/viewmodel/homescreen_state.dart';

import '../../../core/resources/data_state.dart';

class HomescreenBloc extends Bloc<HomescreenEvent, HomescreenState> {
  final WeatherService _weatherService = WeatherService();

  HomescreenBloc() : super(const HomescreenLoad()) {
    on<GetWeatherForecast>((event, emit) async {
      final weatherState =
          await _weatherService.getWeatherCurrent(event.lat, event.lon);
      final forecastState =
          await _weatherService.getForecast(event.lat, event.lon);

      if (weatherState is DataSuccess) {
        emit(HomescreenSuccess(
            weather: weatherState.data ?? const WeatherModel(),
            forecast: forecastState.data ?? []));
      }

      if (weatherState is DataFailed) {
        emit(HomescreenError(error: weatherState.error!));
      }
    });
    on<Dispose>((event, emit) {
      emit(const HomescreenLoad());
    });
  }
}
