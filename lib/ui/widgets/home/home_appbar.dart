import 'package:astropocket/backend/global_variables.dart';
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
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));

    drawerState.addListener(() {
      if(this.mounted) {
        setState(() {
          _animationController.isCompleted ?
              _animationController.reverse() : _animationController.forward();
        });
      }
    });
    
  }

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
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_arrow,
              size: getWidth(context) / 10.0,
              progress: _animationController,
            ),
            onPressed: () {
              SlidingDrawerMain.of(context).toggleDrawer();              
            },
          ),
        ),
        Container(
            margin: EdgeInsets.only(
                right: getWidth(context) / 18.0,
                top: getHeight(context) / 62.2),
            child: IconButton(
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
