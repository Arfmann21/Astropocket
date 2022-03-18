import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/url_launcher.dart';
import 'package:astropocket/style/custom_icons/youtube_icons.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PictureDayVideoWidget extends StatefulWidget {
  @override
  _PictureDayVideoWidgetState createState() => _PictureDayVideoWidgetState();
}

class _PictureDayVideoWidgetState extends State<PictureDayVideoWidget> {
  @override
  Widget build(BuildContext context) {
    youtubeThumbnail = "https://img.youtube.com/vi/" +
        apodObject.hdurl
            .replaceAll("https://www.youtube.com/embed/", "")
            .replaceAll("?rel=0", "") +
        "/0.jpg";

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            launchURL(apodObject.hdurl);
          },
          child: Hero(
            tag: 'apodHero',
            child: Container(
              //Use Card for the elevation
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(getWidth(context) / 36)),
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    CachedNetworkImage(
                      imageUrl: (youtubeThumbnail),
                      placeholder: (context, url) {
                        return Container();
                      },
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                        child: Center(
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Container(
                              margin: EdgeInsets.only(
                                  bottom: getWidth(context) / 36.0,
                                  right: getWidth(context) / 36.0),
                              height: getWidth(context) / 7.0,
                              width: getWidth(context) / 7.0,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(33, 33, 33, 80),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Youtube.youtube,
                                size: 46,
                                color: SpecificColors(context).shimmerColor,
                              )),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
