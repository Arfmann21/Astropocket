import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/custom_icons/expand_icon_icons.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class IssMapSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getHeight(context) / 45,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: Colors.transparent,
            child: Container(
              width: getWidth(context) / 1.5,
              child: Text(
                'Map',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 21.5,
                ),
              ),
            ),
          ),
          SizedBox(
            height: getWidth(context) / 30.0,
          ),
          Container(
            height: getHeight(context) / 4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getWidth(context) / 36.0),
            ),
            margin: EdgeInsets.only(
                left: getWidth(context) / 36.0,
                right: getWidth(context) / 36.0,
                top: getWidth(context) / 20.0),
            child: Skeleton(
              baseColor: SpecificColors(context).pulseColorBase,
              // The Highlight color is the same for both white and dark theme
              hightlightColor: const Color(0xFF053361),
            ),
          )
        ],
      ),
    );
  }
}
