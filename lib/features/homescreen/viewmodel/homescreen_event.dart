abstract class HomescreenEvent {
  const HomescreenEvent();
}

class GetWeatherForecast implements HomescreenEvent {
  final double lat;
  final double lon;
  const GetWeatherForecast(this.lat, this.lon);
}

class Dispose implements HomescreenEvent {
  const Dispose();
}
