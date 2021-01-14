import 'dart:async';

import 'package:astropocket/backend/api/spaceflight.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/url_launcher.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/widgets/home/news/itself/news_itself.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  Future<NewsApi> futureNews;

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    futureNews = fetchNews(false);
    super.initState();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        Navigator.pop(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'News',
            style:
                TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        body: FutureBuilder<NewsApi>(
            future: futureNews,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return ListView.builder(
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
              else
                return Padding(
                  padding: EdgeInsets.only(
                      left: getWidth(context) / 30.0,
                      right: getWidth(context) / 30.0,
                      top: getHeight(context) / 30.0),
                  child: ListView.builder(
                    itemCount: 1000,
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
            }),
      ),
    );
  }
}
