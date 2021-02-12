import 'package:astropocket/backend/date_parse.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

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
                    DateParse(DateTime.parse(data[index]['published_date'])).getParse(),
                    style: GoogleFonts.poppins(
                        fontSize: 16.0, fontWeight: FontWeight.w500, color: SpecificColors(context).darkGreyLightGreyColor),
                  ),
                  IconButton(
                    icon: Icon(Icons.share_outlined),
                    onPressed: () async {
                      await Share.share(
                          '📄 ${data[index]['title'] ?? 'NASA Reports - TItle unavaible'}\n\n🌐  Link: ${data[index]['url']}\n\n🔗 Shared from Astropocket: [Link store]');
                    },
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: getHeight(context) / 60.0),
                child: Text(
                  data[index]['title'] ?? 'Title unavaible',
                  style: GoogleFonts.poppins(
                      fontSize: 19.0,
                      fontWeight: FontWeight.w600,
                      color: SpecificColors(context).primaryTextColor),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: getHeight(context) / 60.0),
                child: Text(
                  data[index]['summary'].toString().length > 1
                      ? data[index]['summary']
                      : 'Summary unavaible',
                  style: GoogleFonts.poppins(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: SpecificColors(context).secondaryTextColor),
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
