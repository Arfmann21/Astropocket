import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/custom_icons/expand_icon_icons.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';

class ExploreOverview extends StatelessWidget {

  final String title;
  final String overviewDescription;

  ExploreOverview({this.title, this.overviewDescription});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getWidth(context) / 20,
          right: getWidth(context) / 20,
          top: getHeight(context) / 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Overview',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
              ),
              IconButton(
                icon: Icon(ExpandCustomIcon.arrow_expand),
                color: SpecificColors(context).blackWhiteTextColor,
                onPressed: () {},
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: getHeight(context) / 80.0),
            width: getWidth(context),
            height: getHeight(context) / 4,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(getWidth(context) / 36)),
              child: Image.asset(
                'assets/images/planets/${title.toLowerCase()}_overview.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getHeight(context) / 60,
                bottom: getHeight(context) / 50,
                left: getWidth(context) / 36.0,
                right: getWidth(context) / 36.0),
            child: Text(
              overviewDescription,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
