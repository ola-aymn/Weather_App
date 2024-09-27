import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherResultPage extends StatelessWidget {
  final String weatherInfo;
  final String countryName;
  final IconData weatherIcon; 

  WeatherResultPage({
    required this.weatherInfo,
    required this.countryName,
    required this.weatherIcon, 
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/desktop-wallpaper-purple-sky-sunset-horizon.jpg'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
             Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView( 
                child: Card(
                  elevation: 16, 
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  color: Colors.white.withOpacity(0.02), 
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.5), 
                          Colors.white.withOpacity(0.3), 
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            countryName, 
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              letterSpacing: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          BoxedIcon(
                            weatherIcon, 
                            size: 120,
                            color: Colors.orangeAccent,
                          ),
                          SizedBox(height: 20),
                          Text(
                            weatherInfo,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); 
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Go Back',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
