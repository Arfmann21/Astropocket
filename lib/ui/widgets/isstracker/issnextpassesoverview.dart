import 'package:astropocket/backend/api/iss_nextpasses_api.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/widgets/isstracker/isspassesoverviewlist.dart';
import 'package:astropocket/ui/widgets/isstracker/isspassesskeleton.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:astropocket/backend/global_variables.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class IssNextPassesOverview extends StatefulWidget {
  bool isLocationPermissionGranted;

  IssNextPassesOverview({this.isLocationPermissionGranted});
  @override
  _IssNextPassesOverviewState createState() => _IssNextPassesOverviewState();
}

class _IssNextPassesOverviewState extends State<IssNextPassesOverview> {
  Future<IssNextPassesApi> futurePasses;

  bool isLocationPermissionGranted;
  Position userPosition;

  @override
  void initState() {
    super.initState();
    if (issVisualPassesSnapshot == null)
      futurePasses = fetchIssPasses();
    else
      futurePasses = issVisualPassesSnapshot;

    isLocationPermissionGranted = widget.isLocationPermissionGranted;
    //getLocationPermission();
    //getUserPosition();
  }

  Future<Permission> getLocationPermission() async {
    var permission = await Permission.locationWhenInUse.request().isGranted;

    if (permission) {
      setState(() {
        isLocationPermissionGranted = true;
      });
    }
  }

  Future<Position> getUserPosition() async {
    try {
      var futureUserPosition = await Geolocator.getCurrentPosition();
      setState(() {
        userPosition = futureUserPosition;
      });
      return userPosition;
    } catch (e) {
      if (mounted)
        setState(() {
          userPosition = null;
        });

      return userPosition;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: getWidth(context) / 15.0,
          ),
          child: Text(
            'Next passes',
            style: GoogleFonts.poppins(
                fontSize: 21.5, fontWeight: FontWeight.w700),
          ),
        ),
        Text(
          'Click for details',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color: SpecificColors(context).secondaryTextColor),
        ),
        isLocationPermissionGranted
            ? FutureBuilder(
                future: futurePasses,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      if (issVisualPassesSnapshot == null)
                        issVisualPassesSnapshot = futurePasses;

                      return IssPassesOverviewList(snapshot: snapshot);
                    } else
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              height: getWidth(context) / 4.5,
                              margin: EdgeInsets.only(
                                  top: getWidth(context) / 11.0,
                                  bottom: getWidth(context) / 10.0),
                              child: Image.asset(
                                  'assets/images/nolocationservices.png')),
                          Text(
                            'In order to get the next passes, turn on location services.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(fontSize: 15.0),
                          ),
                          Container(
                            width: getWidth(context),
                            height: getWidth(context) / 6.0,
                            margin:
                                EdgeInsets.only(top: getWidth(context) / 15.0),
                            child: ElevatedButton(
                              onPressed: () {
                                futurePasses = fetchIssPasses();
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        getWidth(context) / 50.0)),
                                primary: SpecificColors(context)
                                    .grantPermissionBackgroundColor,
                              ),
                              child: Text(
                                'TURN ON LOCATION SERIVCES',
                                style: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      );
                  } else {
                    return IssPassesSkeleton();
                  }
                })
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: getWidth(context) / 4.2,
                      margin: EdgeInsets.only(
                          top: getWidth(context) / 11.0,
                          bottom: getWidth(context) / 10.0),
                      child: Image.asset('assets/images/nolocationperm.png')),
                  Text(
                    'In order to get the next passes, grant permission to location service.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 15.0),
                  ),
                  Container(
                    width: getWidth(context),
                    height: getWidth(context) / 6.0,
                    margin: EdgeInsets.only(top: getWidth(context) / 15.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        await Permission.locationWhenInUse.request();
                        if (await Permission.locationWhenInUse.isGranted) {
                          setState(() {
                            isLocationPermissionGranted = true;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                getWidth(context) / 50.0)),
                        primary: SpecificColors(context)
                            .grantPermissionBackgroundColor,
                      ),
                      child: Text(
                        'GRANT PERMISSION',
                        style: GoogleFonts.poppins(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              )
      ],
    );
  }

  Future<bool> checkPositionPermission() {
    var _isGranted = Permission.location.isGranted;

    return _isGranted;
  }
}
