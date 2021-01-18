import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class NasaReportSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: getWidth(context) / 20.0),
        );
      },
      itemBuilder: (context, index) {
        return Container(
          height: getHeight(context) / 2.7,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(getWidth(context) / 36),
            child: Skeleton(
              width: MediaQuery.of(context).size.width,
              baseColor: SpecificColors(context).pulseColorBase,
              // The Highlight color is the same for both white and dark theme
              hightlightColor: const Color(0xFF053361),
            ),
          ),
        );
      },
    );
  }
}
