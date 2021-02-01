import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class MarsPhotosApi {
  final List general;
  final String explanation;
  final String hdurl;
  final String type;
  final String copyright;

  MarsPhotosApi(
      {this.general, this.explanation, this.hdurl, this.type, this.copyright});

  // 'json' is the map fetched from the response body (decoded in json)
  factory MarsPhotosApi.fromJson(Map<String, dynamic> json) {
    // return the object of ApodApi with attributes values taken from the map 'json'
    return MarsPhotosApi(
      general: json['photos'],
    );
  }
}

Future<MarsPhotosApi> fetchMarsPhotosApi() async {
  // try for network issues
  try {
    var response = await http.get(
        "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=EIfDjB0WSAscEbwAkQhUsxbYndr1fOrbmF8wqigw");

    // status code 200 means the get request is successful
    if (response.statusCode == 200)
      return MarsPhotosApi.fromJson(json.decode(response.body));
    else
      throw Exception('Failed to load JSON');
  } on SocketException catch (_) {
    return null;
  }
}
