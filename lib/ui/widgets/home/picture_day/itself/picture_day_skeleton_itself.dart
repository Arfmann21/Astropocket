import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class PictureDaySkeletonItself extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(getHeight(context));
    return Column(
      children: [
        Column(
          children: [
            // Picture skeleton animation
            ClipRRect(
              borderRadius: BorderRadius.circular(getWidth(context) / 36),
              child: Skeleton(
                height: getHeight(context) / 3,
                width: MediaQuery.of(context).size.width,
                style: SkeletonStyle.box,
                baseColor: SpecificColors(context).pulseColorBase,
                hightlightColor: Color(0xFF053361),
              ),
            ),

            // Title's row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Title skeleton animation
                Padding(
                  padding: EdgeInsets.only(
                      left: getWidth(context) / 11.25, top: getHeight(context) / 60),
                  child: Container(
                    width: getWidth(context) / 1.3,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(getWidth(context) / 36),
                      child: Skeleton(
                        baseColor: SpecificColors(context).pulseColorBase,
                        hightlightColor: Color(0xFF053361),
                        height: getHeight(context) / 20.0,
                        width: getWidth(context) / 1.2,
                      ),
                    ),
                  ),
                ),

                // Dropdown Icon Button
                Padding(
                  padding: EdgeInsets.only(top: getHeight(context) / 60),
                  child: IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 32.0,
                    onPressed: () {},
                  ),
                )
              ],
            ),

            // Description skeleton animation
            Container(
                margin: EdgeInsets.only(top: getHeight(context) / 38.0, left: getWidth(context) / 36.0, right: getWidth(context) / 36.0,),
                child: Container(
                    height: 92.0,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(getWidth(context) / 36),
                      child: Skeleton(
                        baseColor: SpecificColors(context).pulseColorBase,
                        hightlightColor: Color(0xFF053361),
                        height: getHeight(context) / 10.0,
                        width: getWidth(context) / 1.2,
                      ),
                    ))),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              margin: EdgeInsets.only(
                  left: getWidth(context) / 18,
                  right: getWidth(context) / 18,
                  top: MediaQuery.of(context).size.width / 6.5),
              color: SpecificColors(context).darkGreyLightGreyColor,
            )
          ],
        ),
      ],
    );
  }
}
