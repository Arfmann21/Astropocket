import 'dart:convert';
import 'dart:io';
import 'package:astropocket/backend/api/nasa_api.dart';
import 'package:http/http.dart' as http;

class InsightWeatherApi {
  final Map general;
   final List solKeys;
   var weatherData;

  InsightWeatherApi(
      {this.general, this.solKeys, this.weatherData});

  // 'json' is the map fetched from the response body (decoded in json)
  factory InsightWeatherApi.fromJson(Map<String, dynamic> json) {
    // return the object of InSightWeather with attributes values taken from the map 'json'

    return InsightWeatherApi(
      general: json,
      solKeys: json['sol_keys'],
    );
  }
}

Future<InsightWeatherApi> fetchInsightWeatherApi() async {
  // try for network issues
  try {
    var response = await http.get(
        "https://api.nasa.gov/insight_weather/?api_key=$nasa_api&feedtype=json&ver=1.0");

    // status code 200 means the get request is successful
    if (response.statusCode == 200)
      return InsightWeatherApi.fromJson(json.decode(response.body));
    else
      throw Exception('Failed to load JSON');
  } on SocketException catch (_) {
    return null;
  }
}
