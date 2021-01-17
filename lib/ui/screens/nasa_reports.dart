import 'dart:async';

import 'package:astropocket/backend/api/nasa_reports_api.dart';
import 'package:astropocket/backend/date_parse.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/url_launcher.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class NasaReports extends StatefulWidget {
  @override
  _NasaReportsState createState() => _NasaReportsState();
}

class _NasaReportsState extends State<NasaReports> {
  Future<NasaReportsApi> futureReports;

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    futureReports = fetchReports();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NASA Reports',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder<NasaReportsApi>(
        future: futureReports,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: 1000,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: getHeight(context) / 30.0,
                        left: getWidth(context) / 30.0,
                        right: getWidth(context) / 30.0,
                        bottom: getWidth(context) / 20.0),
                    child: GestureDetector(
                      onTap: () {
                        launchURL(snapshot.data.general[index]['url']);
                      },
                      child: Container(
                        height: getHeight(context) / 2.7,
                        width: getWidth(context),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  getWidth(context) / 36.0)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: getWidth(context) / 20.0,
                                right: getWidth(context) / 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateParse(snapshot.data.general[index]
                                              ['published_date'])
                                          .getParse(),
                                      style: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.share_outlined),
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: getHeight(context) / 60.0),
                                  child: Text(
                                    snapshot.data.general[index]['title'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: getHeight(context) / 60.0),
                                  child: Text(
                                    snapshot.data.general[index]['summary'],
                                    style: GoogleFonts.poppins(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Padding(
              padding: EdgeInsets.only(
                  top: getHeight(context) / 30.0,
                  left: getWidth(context) / 30.0,
                  right: getWidth(context) / 30.0),
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: getWidth(context) / 20.0),
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                    height: getHeight(context) / 2.7,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(getWidth(context) / 36),
                      child: Skeleton(
                        width: MediaQuery.of(context).size.width,
                        baseColor: SpecificColors(context).pulseColorBase,
                        // The Highlight color is the same for both white and dark theme
                        hightlightColor: const Color(0xFF053361),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
