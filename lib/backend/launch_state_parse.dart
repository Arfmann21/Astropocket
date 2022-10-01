import 'package:astropocket/backend/global_variables.dart';

class LaunchDataParse {
  final String? state;
  final String? date;

  LaunchDataParse({this.state, this.date});

  String stateParse() {
    switch (state) {
      case 'Success':
        return 'Success';

      case 'Failure':
        return 'Failure';

      case 'Go':
        return 'Ready to launch';

      case 'TBD':
        return 'To be defined';

      case 'In Flight':
        return 'In flight';

      case 'Partial Failure':
        return 'Partial failure';

      default:
        return 'Error';
    }
  }

  bool isUpcomingLaunched() {
    return stateParse() == 'Success' || stateParse() == 'Failure' || stateParse() == 'Partial failure'
        ? true
        : false;
  }

  String dateParse() {
    var year = date!.substring(0, 4);
    var month = date!.substring(5, 7);
    var day = date!.substring(8, 10);
    var hour = date!.substring(11, 13);
    var minutes = date!.substring(14, 16);

    return dateFormat == "mdy" ? "$month / $day / $year, $hour:$minutes CET" : "$day / $month / $year, $hour:$minutes CET";
  }
}
