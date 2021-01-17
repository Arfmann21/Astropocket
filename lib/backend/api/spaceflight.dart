import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApi {
  final String title;
  final String thumbnail;
  final String websiteName;
  final String url;
  final List general;

  NewsApi(
      {this.title, this.thumbnail, this.websiteName, this.url, this.general});
  // 'json' is the map fetched from the response body (decoded in json)
  factory NewsApi.fromJson(Map<String, dynamic> json) {
    // return the object of NewsApi with attributes values taken from the map 'json'
    return NewsApi(
        general: json['docs'],
        title: json['docs'][0]['title'],
        url: json['docs'][0]['url'],
        thumbnail: json['docs'][0]['featured_image'],
        websiteName: json['docs'][0]['news_site_long']);
  }
}

Future<NewsApi> fetchNews(bool home, String type) async {
  // try for network issues
  try {
    final response = home
        ? await http
            .get("https://spaceflightnewsapi.net/api/v1/articles?limit=1")
        : await http
            .get("https://spaceflightnewsapi.net/api/v1/$type?limit=1000");

    // status code 200 means the get request is successful
    if (response.statusCode == 200) {
      return NewsApi.fromJson(json.decode(response.body));
    } else
      throw Exception('Failed to load JSON');
  } catch (_) {
    return null;
  }
}
