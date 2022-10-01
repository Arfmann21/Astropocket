import 'dart:convert';
import 'package:http/http.dart' as http;

class LaunchesApi {
  final List<dynamic>? general;
  final int? count;

  final String? launchImageUrl;

  // For the 'State' screen
  final String? state;
  final String? launchDate;
  final String? liveUrl;
  final String? launchName;

// For the 'Mission' screen
  final String? missionName;
  final String? missionDescription;
  final String? launchServiceProvider;
  final String? launchServiceProviderLogo;

  //For the 'Rocket' screen
  final String? rocketName;
  final String? rocketDescription;
  final String? rocketProvider;
  final String? rocketProviderLogo;

  LaunchesApi(
      {this.count,
      this.general,
      this.launchImageUrl,
      this.state,
      this.launchDate,
      this.launchName,
      this.liveUrl,
      this.missionDescription,
      this.missionName,
      this.launchServiceProvider,
      this.launchServiceProviderLogo,
      this.rocketName,
      this.rocketDescription,
      this.rocketProvider,
      this.rocketProviderLogo});
  // 'json' is the map fetched from the response body (decoded in json)
  factory LaunchesApi.fromJson(Map<String, dynamic> json) {
    // return the object of LaunchesApi with attributes values taken from the map 'json'
    return LaunchesApi(general: json['results'], count: json['count']);
  }
}

Future<LaunchesApi?> fetchLaunches(type, isSearched, searchName) async {
  // try for network issues
  try {
    final response = isSearched == true ? await http.get("https://ll.thespacedevs.com/2.0.0/launch/?search=$searchName&mode=detailed") :  await http.get(
        "https://ll.thespacedevs.com/2.0.0/launch/$type/?mode=detailed&limit=100");

    // status code 200 means the get request is successful
    if (response.statusCode == 200) {
      return LaunchesApi.fromJson(json.decode(response.body));
    } else
      throw Exception('Failed to load JSON');
  } catch (_) {
    return null;
  }
}
