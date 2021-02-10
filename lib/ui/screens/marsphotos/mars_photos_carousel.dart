import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MarsPhotosCarousel extends StatefulWidget {
  final initialIndex;

  MarsPhotosCarousel({this.initialIndex});

  @override
  _MarsPhotosCarouselState createState() => _MarsPhotosCarouselState();
}

class _MarsPhotosCarouselState extends State<MarsPhotosCarousel> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mars Rover Photos',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(icon: Icon(Icons.share_outlined), onPressed: () {})
        ],
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider.builder(
                itemCount: 1000,
                options: CarouselOptions(
                    initialPage: widget.initialIndex,
                    enableInfiniteScroll: false,
                    height: getHeight(context) / 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        pageIndex = index;
                      });
                    },
                    enlargeCenterPage: true),
                itemBuilder: (context, index, anotherIndex) {
                  return CachedNetworkImage(
                    imageUrl: globalSnapshot.data.general[index]['img_src']
                        .toString()
                        .replaceAll('http', 'https'),
                  );
                }),
                Text(
                  globalSnapshot.data.general[pageIndex]['camera']['full_name'],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: SpecificColors(context).primaryTextColor
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getWidth(context) / 30.0),
                  child: Text(
                    globalSnapshot.data.general[pageIndex]['rover']['name'] + ', ' +globalSnapshot.data.general[pageIndex]['earth_date'],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 19.0,
                      color: SpecificColors(context).secondaryTextColor
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
