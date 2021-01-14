import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/url_launcher.dart';
import 'package:astropocket/style/custom_icons/youtube_icons.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/widgets/home/picture_day/itself/picture_day_content_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VideoDayItselfWidget extends StatefulWidget {
  @override
  _VideoDayItselfWidgetState createState() => _VideoDayItselfWidgetState();
}

class _VideoDayItselfWidgetState extends State<VideoDayItselfWidget> {
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
            child: Stack(
              children: [
                Container(
                  //Use Card for the elevation
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(getWidth(context) / 36)),
                    child: CachedNetworkImage(
                      imageUrl: (youtubeThumbnail),
                      placeholder: (context, url) {
                        print('sto caricando');
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  child: Center(
                      child: Icon(
                    Youtube.youtube,
                    size: 46,
                    color: SpecificColors(context).shimmerColor,
                  )),
                ),
              ],
            ),
          ),
        ),
        PictureDayContentWidget()
      ],
    );
  }
}
