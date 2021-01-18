import 'package:astropocket/backend/date_parse.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NasaReportItselfWidget extends StatelessWidget {
  final int index;
  final List<dynamic> data;

  NasaReportItselfWidget({this.index, this.data});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context) / 2.7,
      width: getWidth(context),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(getWidth(context) / 36.0)),
        child: Padding(
          padding: EdgeInsets.only(
              left: getWidth(context) / 20.0, right: getWidth(context) / 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateParse(data[index]['published_date'])
                        .getParse(),
                    style: GoogleFonts.poppins(
                        fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    icon: Icon(Icons.share_outlined),
                    onPressed: () {},
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: getHeight(context) / 60.0),
                child: Text(
                  data[index]['title'],
                  style: GoogleFonts.poppins(
                      fontSize: 19.0, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: getHeight(context) / 60.0),
                child: Text(
                  data[index]['summary'],
                  style: GoogleFonts.poppins(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
