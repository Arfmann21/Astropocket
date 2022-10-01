import 'dart:convert';
import 'dart:io';
import 'package:astropocket/backend/api/nasa_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

var futureUserPosition;

class IssNextPassesApi {
  final Map general;
  final int passesCount;
  final double userLatitude;
  final Position userPosition;

  IssNextPassesApi(
      {required this.general, required this.passesCount, required this.userLatitude, required this.userPosition});

  // 'json' is the map fetched from the response body (decoded in json)
  factory IssNextPassesApi.fromJson(Map<String, dynamic> json) {
    // return the object of InSightWeather with attributes values taken from the map 'json'

    return IssNextPassesApi(
        general: json,
        passesCount: json['info']['passescount'],
        userLatitude: futureUserPosition.altitude,
        userPosition: futureUserPosition);
  }
}

Future<IssNextPassesApi?> fetchIssPasses() async {
  // try for network issues
  try {
    futureUserPosition = await Geolocator.getCurrentPosition();

    var response;

    if (futureUserPosition != null)
      response = await http.get(
          "https://api.n2yo.com/rest/v1/satellite/visualpasses/25544/${futureUserPosition.latitude}/${futureUserPosition.longitude}/${futureUserPosition.altitude}/14/300/&apiKey=$issapi");
    else
      response = null;
    // status code 200 means the get request is successful
    if (response.statusCode == 200)
      return IssNextPassesApi.fromJson(json.decode(response.body));
    else
      throw Exception('Failed to load JSON');
  } on SocketException catch (_) {
    return null;
  }
}
