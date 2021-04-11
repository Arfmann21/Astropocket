import 'dart:async';
import 'dart:collection';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/custom_icons/expand_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class IssMapPreview extends StatelessWidget {
  final Completer<GoogleMapController> controller;
  Set<Marker> _markers = HashSet<Marker>();
  BitmapDescriptor markerImage;

  final AsyncSnapshot snapshot;
  final Set<Marker> markers ;

  IssMapPreview({this.snapshot, this.markers, this.controller});

  @override
  Widget build(BuildContext context) {

    _followIss(snapshot.data.lat, snapshot.data.long);

    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: Colors.transparent,
            child: Container(
              width: getWidth(context) / 1.5,
              child: Text(
                'Map',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 21.5,
                ),
              ),
            ),
          ),
         /* IconButton(
            icon: Icon(
              ExpandCustomIcon.arrow_expand,
            ),
            onPressed: () {},
          )*/
        ],
      ),
      SizedBox(
        height: 10.0,
      ),
      Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(getWidth(context) / 36)),

        // Use CachedNetworkImage so can show a loading animation (or screen) when loading the image from the internet
        child: SizedBox(
          height: getHeight(context) / 4.3,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(snapshot.data.lat, snapshot.data.long),
            ),
            onMapCreated: (GoogleMapController mController) {
              controller.complete(mController);
            },
            markers: markers,
          ),
        ),
      ),
    ]);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  Future<void> _followIss(
    double lat,
    double long,
  ) async {
    final GoogleMapController mController = await controller.future;
    final zoomLevel = await mController.getZoomLevel();
    print('sono qui');
    mController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, long), zoom: zoomLevel)));
  }

}
