import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class NewsSkeletonHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(getWidth(context) / 36.0),
      child: Skeleton(
        height: getHeight(context) / 5,
        width: MediaQuery.of(context).size.width,
        baseColor: SpecificColors(context).pulseColorBase,

        // Highlight color is the same for both white and dark theme
        hightlightColor: Color(0xFF053361),
      ),
    );
  }
}
