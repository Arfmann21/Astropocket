import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class MarsWeatherApi {
  final Map? general;

  final int? maxTemp;
  final int? minTemp;
  final int? pressure;

  final String? sunrise;
  final String? sunset;

  final String? terrestrialDate;

  final int? sol;


  MarsWeatherApi(
      {this.general, this.maxTemp, this.minTemp, this.pressure, this.sunrise, this.sunset, this.terrestrialDate, this.sol});

  // 'json' is the map fetched from the response body (decoded in json)
  factory MarsWeatherApi.fromJson(Map<String, dynamic> json) {
    // return the object of InSightWeather with attributes values taken from the map 'json'

    return MarsWeatherApi(
      general: json,
      maxTemp: json['max_temp'],
      minTemp: json['min_temp'],
      terrestrialDate: json['terrestrial_date'],
      sol: json['sol'],
    );
  }
}

Future<MarsWeatherApi?> fetchMarsWeatherApi() async {
  // try for network issues
  try {
    var response = await http.get(
        "https://api.maas2.apollorion.com/");

    // status code 200 means the get request is successful
    if (response.statusCode == 200)
      return MarsWeatherApi.fromJson(json.decode(response.body));
    else
      throw Exception('Failed to load JSON');
  } on SocketException catch (_) {
    return null;
  }
}
