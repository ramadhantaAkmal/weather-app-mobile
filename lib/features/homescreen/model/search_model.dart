class SearchModel {
  final int? id;
  final String? label;
  final double? lat;
  final double? lon;

  const SearchModel({this.id, this.label, this.lat, this.lon});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        id: json["id"],
        label: "${json["name"]},${json["region"]},${json["country"]}",
        lat: json["lat"],
        lon: json["lon"],
      );
}
