import 'dart:convert';
import 'dart:io';
import 'package:astropocket/backend/api/nasa_api.dart';
import 'package:http/http.dart' as http;

class ApodApi {
  final String? title;
  final String? explanation;
  final String? hdurl;
  final String? type;
  final String? copyright;

  ApodApi({this.title, this.explanation, this.hdurl, this.type, this.copyright});

  // 'json' is the map fetched from the response body (decoded in json)
  factory ApodApi.fromJson(Map<String, dynamic> json) {
      // return the object of ApodApi with attributes values taken from the map 'json'
    return ApodApi(
        title: json['title'],
        explanation: json['explanation'],
        hdurl: json['url'],
        copyright: json['copyright'],
        type: json['media_type']);
  }
}

Future<ApodApi?> fetchApod() async {

  // try for network issues
  try {
    var response = await http.get(
        "https://api.nasa.gov/planetary/apod?api_key=$nasa_api");

    // status code 200 means the get request is successful
    if (response.statusCode == 200)
      return ApodApi.fromJson(json.decode(response.body));
    else
      throw Exception('Failed to load JSON');

  } on SocketException catch (_) {
    return null;
  }
}
