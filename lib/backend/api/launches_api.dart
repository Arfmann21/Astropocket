import 'dart:convert';
import 'package:http/http.dart' as http;

class LaunchesApi {
  final List<dynamic> general;
  final int count;

  LaunchesApi(
      {this.count, this.general});
  // 'json' is the map fetched from the response body (decoded in json)
  factory LaunchesApi.fromJson(Map<String, dynamic> json) {
    // return the object of NewsApi with attributes values taken from the map 'json'
    return LaunchesApi(
        general: json['results'],
        count: json['count']
       );
  }
}

Future<LaunchesApi> fetchLaunches() async {
  // try for network issues
  try {
    final response = await http
            .get("https://ll.thespacedevs.com/2.0.0/launch/upcoming/");
        

    // status code 200 means the get request is successful
    if (response.statusCode == 200) {
      return LaunchesApi.fromJson(json.decode(response.body));
    } else
      throw Exception('Failed to load JSON');
  } catch (_) {
    return null;
  }
}
