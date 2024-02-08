class WeatherModel {
  final Location? location;
  final double? tempC;
  final Condition? condition;
  final double? windKph;
  final String? windDir;
  final double? humidity;
  final String? sunriseTime;
  final String? sunsetTime;

  const WeatherModel({
    this.location,
    this.tempC,
    this.condition,
    this.windKph,
    this.windDir,
    this.humidity,
    this.sunriseTime,
    this.sunsetTime,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> weatherJson,
          Map<String, dynamic> astronomyJson) =>
      WeatherModel(
        location: Location(
          cityName: weatherJson["location"]["city_name"],
          region: weatherJson["location"]["region"],
          country: weatherJson["location"]["country"],
          lat: weatherJson["location"]["lat"],
          lon: weatherJson["location"]["lon"],
          localtime: weatherJson["location"]["localtime"],
        ),
        tempC: weatherJson["current"]["temp_c"],
        condition: Condition(
          conditionName: weatherJson["current"]["condition"]["text"],
          iconUrl: weatherJson["current"]["condition"]["icon"],
          code: weatherJson["current"]["condition"]["code"],
        ),
        windKph: weatherJson["current"]["wind_kph"],
        windDir: weatherJson["current"]["wind_dir"],
        humidity: weatherJson["current"]["humidity"],
        sunriseTime: astronomyJson["astronomy"]["astro"]["sunrise"],
        sunsetTime: astronomyJson["astronomy"]["astro"]["sunset"],
      );
}

class Condition {
  final String? conditionName;
  final String? iconUrl;
  final int? code;

  const Condition({
    this.conditionName,
    this.iconUrl,
    this.code,
  });
}

class Location {
  final String? cityName;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? localtime;

  const Location({
    this.cityName,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.localtime,
  });
}
