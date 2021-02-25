import 'package:astropocket/backend/api/spaceflight.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/url_launcher.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

import 'news_itself.dart';

class BlogsNews extends StatefulWidget {
  final String type;

  BlogsNews({this.type});

  @override
  _BlogsNewsState createState() => _BlogsNewsState();
}

class _BlogsNewsState extends State<BlogsNews> {
  Future<NewsApi> futureNews;

  @override
  void initState() {
    futureNews = fetchNews(false, 'blogs');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsApi>(
        future: futureNews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: getHeight(context) / 30.0,
                        left: getWidth(context) / 30.0,
                        right: getWidth(context) / 30.0),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(getWidth(context) / 36),
                      child: Skeleton(
                        baseColor: SpecificColors(context).pulseColorBase,
                        hightlightColor: Color(0xFF053361),
                        height: getHeight(context) / 3,
                        width: getHeight(context),
                      ),
                    ),
                  );
                });
          else {
            var limit = snapshot.data.totalDocs;

            return Padding(
              padding: EdgeInsets.only(
                  left: getWidth(context) / 30.0,
                  right: getWidth(context) / 30.0,
                  top: getHeight(context) / 30.0),
              child: ListView.builder(
                itemCount: limit <= 1000 ? limit :  1000,
                itemBuilder: (context, index) {
                  // Gesture detector on top of Listview tree so the 'onTap' is referred to the entire news container
                  return GestureDetector(
                    onTap: () {
                      launchURL(snapshot.data.general[index]['url']);
                    },
                    // News container
                    child: NewsItself(
                      data: snapshot.data.general,
                      index: index,
                    ),
                  );
                },
              ),
            );
          }
        });
  }
}
