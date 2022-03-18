import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class PictureContainerHome extends StatelessWidget {
  // Attributes to avoiding another FutureBuilder
  /*final pictureURL;
  final title;
  final description;

  PictureContainerHome({this.pictureURL, this.title, this.description});*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Picture container
        Container(
            height: getHeight(context) / 4,
            width: MediaQuery.of(context).size.width,

            //Use Card for the elevation
            child: Hero(
              tag: 'apodHero',
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(getWidth(context) / 36)),

                // Use CachedNetworkImage so can show a loading animation (or screen) when loading the image from the internet
                child: CachedNetworkImage(
                  imageUrl: apodObject.hdurl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return Skeleton(
                        width: MediaQuery.of(context).size.width,
                        height: getHeight(context) / 4,
                        baseColor: SpecificColors(context).pulseColorBase,
                        hightlightColor: Color(0xFF053361));
                  },
                ),
              ),
            )),
      ],
    );
  }
}
