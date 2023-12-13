class WeatherRequest {
  WeatherRequest({
    required this.area,
    required this.date,
  });

  final String area;
  final DateTime date;

  Map<String, dynamic> toJson() {
    final weatherMap = <String, dynamic>{
      'area': area,
      'date': date.toIso8601String(),
    };
    return weatherMap;
  }
}
