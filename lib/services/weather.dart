class WeatherModel {
  final int condition;
  final int temp;
  final String city;

  WeatherModel({
    required this.condition,
    required this.temp,
    required this.city,
  });

  factory WeatherModel.fromJSON(Map<String, dynamic> json) {
    return WeatherModel(
        condition: json['weather'][0]['id'],
        temp: (json['main']['temp'] as num).toInt(),
        city: json['name']);
  }

  String getWeatherIcon() {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage() {
    if (temp > 25) {
      return 'It\'s 🍦 time in $city';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 in $city';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤in $city';
    } else {
      return 'Bring a 🧥 just in case in $city';
    }
  }
}
