import 'dart:convert';
import 'package:http/http.dart' as http;

import '../global_variables.dart';

class LaunchesApi {
  final List<dynamic> general;
  final int count;

  final String launchImageUrl;

  // For the 'State' screen
  final String state;
  final String launchDate;
  final String liveUrl;
  final String launchName;

// For the 'Mission' screen
  final String missionName;
  final String missionDescription;
  final String launchServiceProvider;
  final String launchServiceProviderLogo;

  //For the 'Rocket' screen
  final String rocketName;
  final String rocketDescription;
  final String rocketProvider;
  final String rocketProviderLogo;

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
    // return the object of NewsApi with attributes values taken from the map 'json'
    return LaunchesApi(general: json['results'], count: json['count']);
  }
}

 // Set a global object to use for specific launch infos. This method will be called when the user tap on a launch
  void setLaunchesObject(snapshot, index) {
    launchesObject = LaunchesApi(
      state: snapshot.data.general[index]['status']['name'],
      launchImageUrl: snapshot.data.general[index]['image'],
      launchDate: snapshot.data.general[index]['window_start'],
      launchName: snapshot.data.general[index]['name'],

      // Sometimes, the live is not avaible
      liveUrl:
          snapshot.data.general[index]['vidURLs'].toString().contains('url')
              ? snapshot.data.general[index]['vidURLs'][0]['url']
              : 'No video avaibles',

      // Sometimes, mission name and description is not avaible
      missionDescription: snapshot.data.general[index]['mission'] != null
          ? snapshot.data.general[index]['mission']['description']
          : snapshot.data.general[index]['launch_service_provider']['name'] +
              ' didn\'t provide mission details',
      missionName: snapshot.data.general[index]['mission'] != null
          ? snapshot.data.general[index]['mission']['name']
          : 'Mission details unavaibles',

      // Launch agency name and logo
      launchServiceProvider: snapshot.data.general[index]
          ['launch_service_provider']['name'],
      launchServiceProviderLogo: snapshot.data.general[index]
          ['launch_service_provider']['logo_url'],

      // Rocket name, description and provider name and logo
      rocketName: snapshot.data.general[index]['rocket']['configuration']
          ['full_name'],
      rocketDescription: snapshot.data.general[index]['rocket']['configuration']
          ['description'],
      rocketProvider: snapshot.data.general[index]['rocket']['configuration']
          ['manufacturer']['name'],
      rocketProviderLogo: snapshot.data.general[index]['rocket']
          ['configuration']['manufacturer']['logo_url'],
    );
  }

Future<LaunchesApi> fetchLaunches(type, isSearched, searchName) async {
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
