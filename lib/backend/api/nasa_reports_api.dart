import 'dart:convert';
import 'package:http/http.dart' as http;

class NasaReportsApi {
  final String title;
  final String thumbnail;
  final String websiteName;
  final String url;
  final List general;
  final int itemNumber;

  NasaReportsApi(
      {this.title, this.thumbnail, this.websiteName, this.url, this.general, this.itemNumber});
  // 'json' is the map fetched from the response body (decoded in json)
  factory NasaReportsApi.fromJson(Map<String, dynamic> json) {
    // return the object of NewsApi with attributes values taken from the map 'json'
    return NasaReportsApi(
        general: json['docs'],
        itemNumber: json['totalDocs']
       );
  }
}

Future<NasaReportsApi> fetchReports() async {
  // try for network issues
  try {
    final response = await http
            .get("https://spaceflightnewsapi.net/api/v1/reports?limit=1000?news_site=nasa?");
        

    // status code 200 means the get request is successful
    if (response.statusCode == 200) {
      return NasaReportsApi.fromJson(json.decode(response.body));
    } else
      throw Exception('Failed to load JSON');
  } catch (_) {
    return null;
  }
}
