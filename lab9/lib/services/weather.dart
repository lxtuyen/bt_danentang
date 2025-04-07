import 'package:lab9/services/location.dart';
import 'package:lab9/services/networking.dart';


const apiKey = 'dbea4ea971dae66957a42a2a445760be';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper connection = NetworkHelper(
      url: 'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric'  );

    var weatherData = await connection.getData();
    return weatherData;
  }

  Future<dynamic> getSearchWeather(String city) async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper searchLocation = NetworkHelper(
      url: 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');

    var weatherData = await searchLocation.getData();
    return weatherData;
  }

  String getWeatherBackground(int condition) {
    return 'images/blue_background.jpg'; //blue background
    // }
  }

  String getWeatherIcon(int condition) {
    if (condition <= 1087 || condition >= 1072) {
      return '🌩';
    } else if (condition <= 1183 || condition >= 1180) {
      return '🌧';
    } else if (condition <= 1195 || condition >= 1192) {
      return '☔️';
    } else if (condition <= 1225 || condition >= 1222) {
      return '☃️';
    } else if (condition < 1003) {
      return '☀️';
    } else if (condition <= 1006 || condition >= 1003) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

   String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
