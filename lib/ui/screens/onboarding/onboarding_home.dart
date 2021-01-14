import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/ui/screens/home.dart';
import 'package:flutter/material.dart';

class OnBoardingHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF04294F),
        body: Column(
          children: [
            Container(
              color: Colors.transparent,
              child: Image.asset(
                'assets/images/onboarding_image.png',
                height: getHeight(context) / 1.9,
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: getHeight(context) / 30),
              child: Text(
                'Expl🪐re',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFE6E6E6),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: getHeight(context) / 30,
                  left: getWidth(context) / 18.0,
                  right: getWidth(context) / 18.0),
              child: Text(
                'Start your jorney across the universe: visit planets, black holes, galaxies and much more',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFD9D9D9),
                ),
              ),
            ),
            Container(
              width: getWidth(context),
              height: getHeight(context) / 12,
              margin: EdgeInsets.only(
                  top: getHeight(context) / 15, left: getWidth(context) / 14.4, right: getWidth(context) / 14.4),
              child: RaisedButton(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(getWidth(context) / 9)),
                color: Color(0xFF28527E),
                child: Text(
                  'Start now',
                  style: TextStyle(fontSize: 20.0, color: Color(0xFFE6E6E6)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeDrawerBuilder()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
