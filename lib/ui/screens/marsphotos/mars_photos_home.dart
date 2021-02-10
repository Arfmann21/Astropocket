import 'package:astropocket/backend/api/mars_photos_api.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/screens/marsphotos/mars_photos_carousel.dart';
import 'package:astropocket/ui/widgets/launches/too_many_requests.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class MarsPhotosHome extends StatefulWidget {
  @override
  _MarsPhotosHomeState createState() => _MarsPhotosHomeState();
}

class _MarsPhotosHomeState extends State<MarsPhotosHome> {
  @override
  void initState() {
    if (fetchMarsPhotos == null) fetchMarsPhotos = fetchMarsPhotosApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mars Rover Photos',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: SpecificColors(context).primaryTextColor),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: FutureBuilder(
          future: fetchMarsPhotos,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Padding(
                  padding: EdgeInsets.only(top: getWidth(context) / 20.0),
                  child: GridView.builder(
                      addAutomaticKeepAlives: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Container(
                          height: getHeight(context) / 10.0,
                          padding:
                              EdgeInsets.only(top: getWidth(context) / 70.0),
                          child: GestureDetector(
                            onTap: () {
                              globalSnapshot = snapshot;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MarsPhotosCarousel(initialIndex: index,)));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      getWidth(context) / 36.0)),
                              child: CachedNetworkImage(
                                imageUrl: snapshot
                                    .data.general[index]['img_src']
                                    .toString()
                                    .replaceAll("http", "https"),
                                placeholder: (context, url) {
                                  return Skeleton(
                                      width: MediaQuery.of(context).size.width,
                                      baseColor: SpecificColors(context)
                                          .pulseColorBase,
                                      hightlightColor: Color(0xFF053361));
                                },
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }),
                );
              } else {
                return TooManyRequests();
              }
            } else
              return Padding(
                padding: EdgeInsets.only(top: getWidth(context) / 20.0),
                child: GridView.builder(
                  addAutomaticKeepAlives: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      height: getHeight(context) / 10.0,
                      padding: EdgeInsets.only(top: getWidth(context) / 70.0),
                      child: Card(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(getWidth(context) / 36.0)
                       ),
                        child: Skeleton(
                            width: MediaQuery.of(context).size.width,
                            baseColor: SpecificColors(context).pulseColorBase,
                            hightlightColor: Color(0xFF053361)),
                      ),
                    );
                  },
                ),
              );
          }),
    );
  }
}
