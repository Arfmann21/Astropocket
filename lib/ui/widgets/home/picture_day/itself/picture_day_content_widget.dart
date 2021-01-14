import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';

class PictureDayContentWidget extends StatefulWidget {
  @override
  _PictureDayContentWidgetState createState() =>
      _PictureDayContentWidgetState();
}

class _PictureDayContentWidgetState extends State<PictureDayContentWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // The title
            Center(
              child: Container(
                margin: EdgeInsets.only(top: getHeight(context) / 60),
                width: getWidth(context) / 1.2,
                child: Text(
                  apodObject.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
              ),
            ),

            // The Dropdown icon (as IconButton)
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: getHeight(context) / 60),

              // The dropdown icon must be rotated when the description is expanded (and viceversa)
              child: Transform.rotate(
                alignment: Alignment.center,
                angle: isExpanded ? 180 * 3.14 / 180 : 0,
                child: IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 32.0,
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                ),
              ),
            ),
          ],
        ),

        // The description
        Padding(
          padding: EdgeInsets.only(
              top: getHeight(context) / 93.3,
              left: getWidth(context) / 36.0,
              right: getWidth(context) / 36.0),
          child: Text(
            apodObject.explanation,

            // Max lines must be based on isExpanded
            maxLines: isExpanded ? 150 : 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 15.5,
                fontWeight: FontWeight.w500,
                color: SpecificColors(context).lightGreyDarkGreyColor),
          ),
        ),
      ],
    );
  }
}
