import 'package:astropocket/backend/api/launches_api.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/custom_icons/previous_icon_icons.dart';
import 'package:astropocket/style/custom_icons/upcoming_icon_icons.dart';
import 'package:astropocket/ui/screens/search_launches.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Launches extends StatefulWidget {
  @override
  _LaunchesState createState() => _LaunchesState();
}

class _LaunchesState extends State<Launches> {
  Future<LaunchesApi> futureLaunches;
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            label: 'Upcoming',
            icon: Icon(UpcomingIcon.page_next_outline),
          ),
          BottomNavigationBarItem(
            label: 'Previous',
            icon: Icon(PreviousIcon.backburger),
          )
        ],
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
      ),
      appBar: AppBar(
        title: Text(
          'Launches',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search_outlined,
            ),
            onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>SearchLaunches()));
            },
          )
        ],
      ),
      body: launchesPages[index]
    );
  }
}
