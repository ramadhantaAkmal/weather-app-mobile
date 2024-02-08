class ForecastModel {
  final String? date;
  final String? condition;
  final String? iconUrl;
  final double? maxTempC;
  final double? minTempC;

  const ForecastModel({
    this.date,
    this.condition,
    this.iconUrl,
    this.maxTempC,
    this.minTempC,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
        date: json["date"],
        condition: json["day"]["condition"]["text"],
        maxTempC: json["day"]["maxtemp_c"],
        minTempC: json["day"]["mintemp_c"],
        iconUrl: json["day"]["condition"]["icon"],
      );
}
