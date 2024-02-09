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
      final dataState =
          await _weatherService.getWeatherCurrent(event.lat, event.lon);

      if (dataState is DataSuccess) {
        emit(
            HomescreenSuccess(weather: dataState.data ?? const WeatherModel()));
      }

      if (dataState is DataFailed) {
        emit(HomescreenError(error: dataState.error!));
      }
    });
    on<Dispose>((event, emit) {
      emit(const HomescreenLoad());
    });
  }
}
