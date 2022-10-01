import 'dart:async';
import 'dart:collection';

import 'package:astropocket/backend/api/iss_tracker_api.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/custom_icons/telescope_icon_icons.dart';
import 'package:astropocket/ui/widgets/isstracker/issmappreview.dart';
import 'package:astropocket/ui/widgets/isstracker/issnextpassesoverview.dart';
import 'package:astropocket/ui/widgets/isstracker/isstrackingdetails.dart';
import 'package:astropocket/ui/widgets/isstracker/mapskeleton.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class IssMain extends StatefulWidget {
  @override
  _IssMainState createState() => _IssMainState();
}

class _IssMainState extends State<IssMain> {
  int _index = 0;
  bool isLocationPermissionGranted = false;
  late Position userPosition;

  // For the GoogleMaps()
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = HashSet<Marker>();
  late BitmapDescriptor markerImage;

  @override
  Widget build(BuildContext context) {
    // Configure everything for the GoogleMaps marker
    ImageConfiguration configuration =
        createLocalImageConfiguration(context, size: Size(34, 34));
    BitmapDescriptor.fromAssetImage(
            configuration, 'assets/images/issmarker.png')
        .then((value) {
      markerImage = value;
    });

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (index) async {
            if (index == 1) {
              await Permission.locationWhenInUse.request();
              if (await Permission.locationWhenInUse.isGranted){
                setState(() {
                  isLocationPermissionGranted = true;
                });
              }
            }
            setState(() {
              _index = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.gps_fixed_outlined), label: 'Live tracker'),
            BottomNavigationBarItem(
                icon: Icon(TelescopeIcon.telescope), label: 'Next passes')
          ],
        ),
        appBar: AppBar(
          title: Material(
            color: Colors.transparent,
            child: Text(
              'ISS Tracker',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 21.5),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: getHeight(context) / 50,
                  left: getWidth(context) / 18.0,
                  right: getWidth(context) / 18.0),

              // The data for the current ISS position is updated once a second, so a Stream is required
              child: StreamBuilder<IssLocationApi?>(
                  stream: streamLocation(),
                  builder: (context, snapshot) {
                    // Don't use a ConnectionStatus because it would be kinda useless: one update per second, one loading per second
                    if (snapshot.hasData) {
                      // The marker for GoogleMaps is like a List. Adding each time new Markers means that there will be multiple Markers
                      // at the same time, so it must be cleaned
                      _markers.clear();

                      _markers.add(Marker(
                          markerId: MarkerId("marker_id"),
                          position:
                              LatLng(snapshot.data!.lat, snapshot.data!.long),
                          icon: markerImage));

                      // ISS must be followed for each snapshot, since there are new coordinates each second
                      _followIss(snapshot.data!.lat, snapshot.data!.long);

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // In UI the preview map is alwasy visible for esthetic and never re-loaded
                          IssMapPreview(
                              snapshot: snapshot,
                              markers: _markers,
                              controller: _controller),

                          //  Can't use a global List like the news because there is the need to pass the snapshot
                          _index == 0
                              ? IssTrackingDetails(
                                  snapshot: snapshot,
                                )
                              : IssNextPassesOverview(
                                  isLocationPermissionGranted:
                                      isLocationPermissionGranted),
                        ],
                      );
                    } else {
                      return IssMapSkeleton();
                    }
                  }),
            ),
          ],
        )));
  }

  // In map preview, the ISS is always followed by the map camera. This feature can be disabled in the full map section
  Future<void> _followIss(
    double lat,
    double long,
  ) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, long))));
  }
}
