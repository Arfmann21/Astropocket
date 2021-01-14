import 'package:astropocket/backend/date_parse.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class NewsItselfWebsiteShare extends StatelessWidget {
  final data;
  final index;

  NewsItselfWebsiteShare({this.data, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getWidth(context) / 30.0,
      ),
      child: Row(
        // put the first on left and the second one on right
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Website name and date
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              data[index]['news_site_long'] +
                  ' - ' +
                  DateParse(data[index]['published_date']).getParse(),
              style: TextStyle(
                  color: SpecificColors(context).darkGreyLightGreyColor,
                  fontSize: 14.0),
            ),
          ),
          Container(
            child: IconButton(
              icon: Icon(Icons.share),
              onPressed: () async {
                // Method to share something from the app (package Share)
                await Share.share(
                    '🔭 ${data[index]['title']} \n\n🌐 ${data[index]['url']}\n\n🔗 Shared by AstroPocket: [Link store]');
              },
            ),
          )
        ],
      ),
    );
  }
}
