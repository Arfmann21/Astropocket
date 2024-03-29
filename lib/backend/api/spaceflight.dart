import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApi {
  final String title;
  final String thumbnail;
  final String websiteName;
  final String url;
  final List general;
  final int totalDocs;

  NewsApi(
      {this.title,
      this.thumbnail,
      this.websiteName,
      this.url,
      this.general,
      this.totalDocs});
  // 'json' is the map fetched from the response body (decoded in json)
  factory NewsApi.fromJson(List json) {
    // return the object of Spaceflight with attributes values taken from the map 'json'
    return NewsApi(
      general: json,
      title: json[0]['title'],
      url: json[0]['url'],
      thumbnail: json[0]['imageUrl'],
      websiteName: json[0]['newsSite'],
    );
  }
}

Future<NewsApi> fetchNews(bool home, String type) async {
  // try for network issues
  try {
    final response = home
        ? await http
            .get("https://api.spaceflightnewsapi.net/v3/articles?_limit=1")
        : await http
            .get("https://api.spaceflightnewsapi.net/v3/$type?_limit=100");

    // status code 200 means the get request is successful
    if (response.statusCode == 200) {
      return NewsApi.fromJson(json.decode(response.body));
    } else
      throw Exception('Failed to load JSON');
  } catch (_) {
    return null;
  }
}
