import 'dart:convert';
import 'package:flutter/material.dart';

import 'item_list.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  final jsonString = '''
  [
    {
      "city": "New York",
      "temperature": 30,
      "condition": "clear",
      "humidity": 40,
      "windSpeed": 4
    },
    {
      "city": "Los Angeles",
      "temperature": 25,
      "condition": "Sunny",
      "humidity": 30,
      "windSpeed": 4
    },
    {
      "city": "London",
      "temperature": 15,
      "condition": "Partly Cloudy",
      "humidity": 50,
      "windSpeed": 5
    },
    {
      "city": "Tokyo",
      "temperature": 28,
      "condition": "Rainy",
      "humidity": 40,
      "windSpeed": 8
    },
    {
      "city": "Sydney",
      "temperature": 22,
      "condition": "Cloudy",
      "humidity": 55,
      "windSpeed": 7
    }
  ]
  ''';

  List<WeatherCard> weatherData = [];

  MyApp() {
    final data = jsonDecode(jsonString);
    for (var item in data) {
      final card = WeatherCard(
        item['city'],
        item['temperature'],
        item['condition'],
        item['humidity'],
        item['windSpeed'],
      );
      weatherData.add(card);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Info App'),
        ),
        body: ListView.builder(
          itemCount: weatherData.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text('City: ${weatherData[index].city}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Temperature: ${weatherData[index].temperature}°C'),
                    Text('Condition: ${weatherData[index].condition}'),
                    Text('Humidity: ${weatherData[index].humidity}%'),
                    Text('Wind Speed: ${weatherData[index].windSpeed} m/s'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
