import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/screens/drawer/hidden_drawer.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatefulWidget {
  @override
  _HomeAppbarState createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    String image = currentTheme.brightness == Brightness.light
        ? 'sun_theme'
        : 'moon_theme';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(
              left: getWidth(context) / 18.0, top: getHeight(context) / 62.2),
          child: IconButton(
            icon: Icon(
              Icons.menu_rounded,
              size: 36.0,
            ),
            color: SpecificColors(context).blackWhiteTextColor,
            onPressed: () {
              if (isDrawerOpen) {
                SlidingDrawerMain.of(context).close();
                isDrawerOpen = false;
              } else {
                SlidingDrawerMain.of(context).open();
                isDrawerOpen = true;
              }
            },
          ),
        ),
        Container(
            margin: EdgeInsets.only(
                right: getWidth(context) / 18.0,
                top: getHeight(context) / 62.2),
            child: IconButton(
              splashColor: themeChanger.currentTheme() == ThemeMode.light ? Colors.black38 : Colors.white70,
              icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 270),
              
                  child: Image.asset(
                    'assets/images/$image.png',
                    key: ValueKey<String>('assets/images/$image.png'),
                  )),
              onPressed: () {
                setState(() {
                  themeChanger.switchTheme();
                  image = currentTheme.brightness == Brightness.light
                      ? 'sun_theme'
                      : 'moon_theme';
                });
                print(image);
              },
            ))
      ],
    );
  }
}
