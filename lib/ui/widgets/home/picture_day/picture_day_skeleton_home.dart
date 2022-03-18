import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class PictureDaySkeletonHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Picture skeleton
        // Use ClipRRect to set borderRadius to Skeleton
        ClipRRect(
          borderRadius: BorderRadius.circular(getWidth(context) / 36),
          child: Skeleton(
            height: getHeight(context) / 4,
            width: getWidth(context),
            baseColor: SpecificColors(context).pulseColorBase,
            // The Highlight color is the same for both white and dark theme
            hightlightColor: const Color(0xFF053361),
          ),
        ),

        // Text skeleton
        // Use padding to set a top margin
        Padding(
          padding: EdgeInsets.only(top: getHeight(context) / 62),

          // Use ClipRRect to set borderRadius to Skeleton
          child: ClipRRect(
            borderRadius: BorderRadius.circular(getWidth(context) / 36),
            child: Skeleton(
              width: MediaQuery.of(context).size.width,
              height: getHeight(context) / 10.8,
              baseColor: SpecificColors(context).pulseColorBase,

              // The Highlight color is the same for both white and dark theme
              hightlightColor: const Color(0xFF053361),
            ),
          ),
        )
      ],
    );
  }
}
