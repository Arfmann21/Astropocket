import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class IssPassesSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: getWidth(context) / 36.0,
          right: getWidth(context) / 36.0,
          top: getWidth(context) / 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(getWidth(context) / 36.0),
        child: Container(
          width: getWidth(context),
          height: getWidth(context) / 3.1,
          child: Skeleton(
            baseColor: SpecificColors(context).pulseColorBase,
            // The Highlight color is the same for both white and dark theme
            hightlightColor: const Color(0xFF053361),
          ),
        ),
      ),
    );
  }
}
