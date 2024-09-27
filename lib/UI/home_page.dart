import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_icons/weather_icons.dart';
import 'weather_result_page.dart';

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController countryNameController = TextEditingController();
  bool _isLoading = false;

  IconData _getWeatherIcon(String weatherDescription) {
    switch (weatherDescription.toLowerCase()) {
      case 'clear sky':
        return WeatherIcons.day_sunny;
      case 'few clouds':
        return WeatherIcons.day_cloudy;
      case 'scattered clouds':
        return WeatherIcons.cloud;
      case 'broken clouds':
        return WeatherIcons.cloud;
      case 'shower rain':
        return WeatherIcons.rain;
      case 'rain':
        return WeatherIcons.rain;
      case 'thunderstorm':
        return WeatherIcons.thunderstorm;
      case 'snow':
        return WeatherIcons.snow;
      case 'mist':
        return WeatherIcons.fog;
      default:
        return WeatherIcons.thermometer; 
    }
  }

  Future<void> _fetchWeather(String country) async {
    setState(() {
      _isLoading = true;
    });

    final apiKey = '36fb09ea1da80f32c92b3174586c9b74'; 
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$country&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        String weatherDescription = data['weather'][0]['description'];
        double temperature = data['main']['temp'];
        String weatherInfo = '$weatherDescription, ${temperature.toStringAsFixed(1)}°C'; 
        IconData weatherIcon = _getWeatherIcon(weatherDescription); 

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WeatherResultPage(
              weatherInfo: weatherInfo,
              countryName: country,
              weatherIcon: weatherIcon, 
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('City not found!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching weather data!')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bali-landscape-with-temple-and-sunset-free-vector.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoxedIcon(
                    WeatherIcons.cloud,
                    size: 100,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10), 
                  Text(
                    'Get The Weather',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: countryNameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Enter country name',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (countryNameController.text.isNotEmpty) {
                        _fetchWeather(countryNameController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: _isLoading
                        ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                        : Text('Go'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
