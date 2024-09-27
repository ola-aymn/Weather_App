import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherResultPage extends StatelessWidget {
  final String weatherInfo;
  final String countryName;
  final IconData weatherIcon; // New parameter for the weather icon

  WeatherResultPage({
    required this.weatherInfo,
    required this.countryName,
    required this.weatherIcon, // Update constructor
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/desktop-wallpaper-purple-sky-sunset-horizon.jpg'), // Add your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView( // Make the content scrollable
                child: Card(
                  elevation: 16, // Increased elevation for a pronounced shadow effect
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  color: Colors.white.withOpacity(0.02), // Make the card more transparent
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.5), // Light color for top
                          Colors.white.withOpacity(0.3), // More transparent for bottom
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
                          // Title for the country name
                          Text(
                            countryName, // Display the country name
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
                            weatherIcon, // Use the passed weather icon
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
                              Navigator.pop(context); // Go back to the home page
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
