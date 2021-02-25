import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/ui/widgets/itself/news/news_itself_picture_container.dart';
import 'package:astropocket/ui/widgets/itself/news/news_itself_website_share.dart';
import 'package:flutter/material.dart';

class NewsItself extends StatefulWidget {
  final data;
  final index;

  NewsItself({this.data, this.index});

  @override
  _NewsItselfState createState() => _NewsItselfState();
}

class _NewsItselfState extends State<NewsItself> {
  @override
  Widget build(BuildContext context) {
    // General padding for each news
    return Container(
      // Margin between each news container
      margin: EdgeInsets.only(bottom: getHeight(context) / 20.0),
      // Use Card for elevation
      child: Card(
        // Set rounded border
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(getWidth(context) / 36)),
        elevation: 5,
        // The news container is composed by 4 elements, one under the other
        child: Column(
          children: [
            // Picture container
            NewsItselfPictureContainer(
              newsThumbnail: widget.data[widget.index]['featured_image'],
            ),

            // News website name, share button and news date
            NewsItselfWebsiteShare(
              data: widget.data,
              index: widget.index,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: getWidth(context) / 30.0,
                  right: getWidth(context) / 30.0,
                  bottom: getHeight(context) / 30.0),
              child: Text(
                widget.data[widget.index]['title'],
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
