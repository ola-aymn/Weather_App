import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '36fb09ea1da80f32c92b3174586c9b74'; 

  Future<String> getWeather(String country) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$country&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return 'Temperature in ${data['name']}: ${data['main']['temp']}°C';
      } else {
        return 'Country not found';
      }
    } catch (e) {
      return 'Error fetching weather data';
    }
  }
}
