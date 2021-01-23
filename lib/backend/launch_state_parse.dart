class LaunchDataParse {
  final String state;
  final String date;

  LaunchDataParse({this.state, this.date});

  String stateParse() {
    switch (state) {
      case 'Success':
        return 'Success';

      case 'Go':
        return 'Ready to launch';

      case 'TBD':
        return 'To be defined';

      case 'In Flight':
        return 'In flight';

      default:
        return 'Error';
    }
  }

  String dateParse() {
    var year = date.substring(0, 4);
    var month = date.substring(5, 7);
    var day = date.substring(8, 10);
    var hour = date.substring(11, 13);
    var minutes = date.substring(14, 16);

    return "$month / $day / $year, $hour:$minutes CET";
  }
}
