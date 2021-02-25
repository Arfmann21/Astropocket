import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/screens/drawer/hidden_drawer.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatefulWidget {
  @override
  _HomeAppbarState createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    drawerState.addListener(() {
      setState(() {});
    });
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // I have no idea how this works anymore. All I know is that I should have used normal if-else instead of ternary
    drawerState.loadState()
        ? drawerState.loadPressed()
            ? null
            : _animationController.reverse()
        : _animationController.reverse();

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
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_arrow,
              size: 38.0,
              progress: _animationController,
              color: SpecificColors(context).primaryTextColor,
            ),
            onPressed: () {
              drawerState.setState();              
              setState(() {
                drawerState.loadState()
                    ? _animationController.forward()
                    : _animationController.reverse();
              });
              if (drawerState.loadState()) {
                SlidingDrawerMain.of(context).open();
              } else {
                SlidingDrawerMain.of(context).close();
              }

            
            },
          ),
        ),
        Container(
            margin: EdgeInsets.only(
                right: getWidth(context) / 18.0,
                top: getHeight(context) / 62.2),
            child: IconButton(
              splashColor: themeChanger.currentTheme() == ThemeMode.light
                  ? Colors.black38
                  : Colors.white70,
              icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
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
              },
            ))
      ],
    );
  }
}
