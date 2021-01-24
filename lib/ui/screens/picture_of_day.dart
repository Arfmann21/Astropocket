import 'dart:async';

import 'package:astropocket/backend/api/nasa_apod.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/ui/widgets/itself/apod/copyright_source.dart';
import 'package:astropocket/ui/widgets/itself/apod/picture_day_content_widget.dart';
import 'package:astropocket/ui/widgets/itself/apod/picture_day_itself_widget.dart';
import 'package:astropocket/ui/widgets/itself/apod/video_day_itself_widget.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

class PictureOfTheDay extends StatefulWidget {
  @override
  _PictureOfTheDayState createState() => _PictureOfTheDayState();
}

class _PictureOfTheDayState extends State<PictureOfTheDay> {
  Future<ApodApi> futureApod;

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    futureApod = fetchApod();
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
    var imageUrl = '';

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Hero(
            tag: 'apodTextHero',
            child: Material(
              color: Colors.transparent,
              child: Text(
                'Picture of the day',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, fontSize: 22.0),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Hero(tag: 'apodShareHero', child: Icon(Icons.share_outlined)),
              onPressed: () async {
                // create Object of the class Apod with fetched JSON
                var apodObject = await fetchApod();

                // assign url to the variable
                imageUrl = apodObject.hdurl;

                // Method to share something from the app (package Share)
                await Share.share(
                    '🔭 Look at the astronomy picture of the day!\n\n🌐 $imageUrl\n\n🔗 Shared by AstroPocket: [Link store]');
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: getHeight(context) / 37.3),
            child: Column(
              children: [
                apodObject.type == 'video'
                    ? VideoDayItselfWidget()
                    : PictureDayItselfWidget(),
                PictureDayContentWidget(),
                CopyrightSource()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
