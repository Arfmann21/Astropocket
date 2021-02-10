import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class InsightWeatherApi {
  final Map general;
   final List solKeys;
   var weatherData;
  /*final String explanation;
  final String hdurl;
  final String type;
  final String copyright;*/

  InsightWeatherApi(
      {this.general, this.solKeys, this.weatherData});

  // 'json' is the map fetched from the response body (decoded in json)
  factory InsightWeatherApi.fromJson(Map<String, dynamic> json) {
    // return the object of ApodApi with attributes values taken from the map 'json'

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
        "https://api.nasa.gov/insight_weather/?api_key=EIfDjB0WSAscEbwAkQhUsxbYndr1fOrbmF8wqigw&feedtype=json&ver=1.0");

    // status code 200 means the get request is successful
    if (response.statusCode == 200)
      return InsightWeatherApi.fromJson(json.decode(response.body));
    else
      throw Exception('Failed to load JSON');
  } on SocketException catch (_) {
    return null;
  }
}
