import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherCard extends StatelessWidget {
  final String weatherInfo;

  WeatherCard({required this.weatherInfo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BoxedIcon(WeatherIcons.day_sunny, size: 50, color: Colors.orange),
            SizedBox(height: 10),
            Text(
              weatherInfo,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
