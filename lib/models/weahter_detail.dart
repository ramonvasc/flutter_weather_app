class WeatherDetail {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherDetail(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  factory WeatherDetail.fromJson(Map<String, dynamic> json) {
    return WeatherDetail(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}
