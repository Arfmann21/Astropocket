import 'dart:convert';
import 'package:http/http.dart' as http;

class IssLocationApi {
  final double long;
  final double lat;
  final double altitude;
  final double velocity;

  IssLocationApi({this.long, this.lat, this.altitude, this.velocity});

  factory IssLocationApi.fromJson(Map<String, dynamic> json) {
    return IssLocationApi(
        long: json['longitude'],
        lat: json['latitude'],
        altitude: json['altitude'],
        velocity: json['velocity']
        );
  }
}

Future<IssLocationApi> fetchLocation() async {
  try {
    final response = await http.get("https://api.wheretheiss.at/v1/satellites/25544");

    if (response.statusCode == 200)
      return IssLocationApi.fromJson(json.decode(response.body));
    else
      throw Exception('Failed to load JSON');
  } catch (_) {
    return null;
  }
}

Stream<IssLocationApi> streamLocation() async* {
  while (true) {
        await Future.delayed(Duration(seconds: 1));
    yield await fetchLocation();
  }
}
