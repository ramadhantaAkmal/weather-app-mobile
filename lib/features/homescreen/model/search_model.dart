class SearchModel {
  final int? id;
  final String? cityName;
  final String? country;
  final double? lat;
  final double? lon;

  const SearchModel({this.id, this.cityName, this.country, this.lat, this.lon});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        id: json["id"],
        cityName: json["cityName"],
        country: json["country"],
        lat: json["lat"],
        lon: json["lon"],
      );
}
