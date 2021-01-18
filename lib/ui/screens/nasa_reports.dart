import 'dart:async';

import 'package:astropocket/backend/api/nasa_reports_api.dart';
import 'package:astropocket/backend/date_parse.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/url_launcher.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/widgets/itself/reports/nasa_report_itself.dart';
import 'package:astropocket/ui/widgets/itself/reports/nasa_report_skeleton.dart';
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
                      child: NasaReportItselfWidget(
                        index: index,
                        data: snapshot.data.general,
                      )
                    ),
                  );
                });
          } else {
            return Padding(
              padding: EdgeInsets.only(
                  top: getHeight(context) / 30.0,
                  left: getWidth(context) / 30.0,
                  right: getWidth(context) / 30.0),
              child: NasaReportSkeleton()
            );
          }
        },
      ),
    );
  }
}
