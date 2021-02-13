import 'package:astropocket/social_icons.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoSection extends StatefulWidget {
  const InfoSection({Key key}) : super(key: key);

  @override
  _InfoSectionState createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  bool isExpanded = false;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 3.5,
                  height: MediaQuery.of(context).size.height / 7.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.red,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Astropocket v$savedVersion',
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Made by Grapheion',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 10),
            InkWell(
              child: Icon(SocialIcons.instagram),
            ),
            InkWell(
              child: Icon(SocialIcons.github),
              onTap: () {
                launch('https://github.com/Grapheion');
              },
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Open source',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            InkWell(
              child: Icon(SocialIcons.github),
              onTap: () {
                launch('https://github.com/Grapheion/Astropocket');
              },
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Support the project',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            InkWell(
              child: Icon(isExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down),
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                  isVisible = !isVisible;
                  print(isExpanded);
                });
              },
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
        Visibility(
          visible: isVisible,
          child: RichText(
            text: TextSpan(
                style: GoogleFonts.poppins(
                    color: SpecificColors(context).secondaryTextColor,
                    fontSize: 15),
                children: [
                  TextSpan(
                      text:
                          'Astropocket is totally free, without In-App purchases and ad, reason why there are some limits, like the amount of requests to services in a certain amount of time. '),
                  TextSpan(
                      text:
                          'With your support, we can remove those limits: if you want, you can make a free donation to our PayPal Moneybox '),
                  TextSpan(
                      text: 'here',
                      style: GoogleFonts.poppins(
                          color: SpecificColors(context).secondaryTextColor,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch('https://www.google.com');
                        })
                ]),
          ),
        ),
      ],
    );
  }
}
