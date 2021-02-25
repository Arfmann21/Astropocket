import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class NewsItselfPictureContainer extends StatelessWidget {
  final newsThumbnail;

  NewsItselfPictureContainer({this.newsThumbnail});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Set default size for each news picture
      height: getHeight(context) / 4.5,
      width: getWidth(context),
      // Use ClipRRect to set picture borderRadius (doesn't works if put directly in Card without ClipRRect)
      child: ClipRRect(
        borderRadius: BorderRadius.circular(getWidth(context) / 36),
        // Use CachedNetworkImage so can show a loading animation (or screen) while the picture is loading from the internet
        child: CachedNetworkImage(
          // Zoom the picture to fit height and width of the container
          fit: BoxFit.cover,
          imageUrl: newsThumbnail,
          placeholder: (context, url) {
            // Loading animation for the picture
            return Skeleton(
              width: MediaQuery.of(context).size.width,
              baseColor: SpecificColors(context).pulseColorBase,
              // The Highlight color is the same for both white and dark theme
              hightlightColor: const Color(0xFF053361),
            );
          },
        ),
      ),
    );
  }
}
