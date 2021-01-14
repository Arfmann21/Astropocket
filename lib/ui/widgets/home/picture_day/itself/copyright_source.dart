import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/url_launcher.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';

class CopyrightSource extends StatelessWidget {
  final copyright;

  CopyrightSource({this.copyright});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: getWidth(context) / 180,
          margin: EdgeInsets.only(
              left: getWidth(context) / 20,
              right: getWidth(context) / 20,
              top: MediaQuery.of(context).size.height / 20),
          color: SpecificColors(context).darkGreyLightGreyColor,
        ),
        Padding(
          padding: EdgeInsets.only(
              top: getHeight(context) / 20,
              left: getWidth(context) / 36.0,
              right: getWidth(context) / 36.0),
          child: Column(
            children: [
              copyright != null ? Row(
                children: [
                  Icon(Icons.copyright),
                  Padding(
                    padding: EdgeInsets.only(left: getWidth(context) / 25.0),
                    child: Text(
                      'Copyright: ' + copyright,
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ) : Container(),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            launchURL('https://apod.nasa.gov/apod/astropix.html');
          },
          child: Container(
            width: getWidth(context),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: getHeight(context) / 90,
                  left: getWidth(context) / 36.0,
                  right: getWidth(context) / 36.0),
              child: Row(
                children: [
                  Icon(Icons.api_rounded),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: getWidth(context) / 25.0),
                      child: Text(
                        'Source: ',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    width: getWidth(context) / 1.6,
                    margin: EdgeInsets.only(
                      top: getHeight(context) / 31,
                    ),
                    child: Text(
                      'https://apod.nasa.gov/apod/astropix.html',
                      style: TextStyle(
                          color: Colors.blue[700],
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
