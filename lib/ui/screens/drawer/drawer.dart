import 'package:astropocket/backend/global_variables.dart';
import 'package:flutter/material.dart';

class DrawerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: getHeight(context) / 9.5, bottom:  getHeight(context) / 9.5, left: getWidth(context) / 20.0),
          child: Column(
            children: [
             Text('Qui ci va il logo'),
             Padding(
               padding: EdgeInsets.only(top: getHeight(context) / 50.0),
               child: IconButton(
                 onPressed: () {},
                 icon: Icon(Icons.home),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}