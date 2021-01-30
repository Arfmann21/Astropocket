class DateParse {
  final date;

  DateParse(this.date);

  String getParse() {
    if (date.toString().length > 5) {
      var month = date.toString().substring(5, 7);
      var day = date.toString().substring(8, 10);

      switch (month) {
        case '01':
          return 'Jan, $day';
        case '02':
          return 'Feb, $day';
        case '03':
          return 'Mar, $day';
        case '04':
          return 'Apr, $day';
        case '05':
          return 'May, $day';
        case '06':
          return 'June, $day';
        case '07':
          return 'July, $day';
        case '08':
          return 'Aug, $day';
        case '09':
          return 'Sept, $day';
        case '10':
          return 'Oct, $day';
        case '11':
          return 'Nov, $day';
        case '12':
          return 'Dec, $day';
        default:
          return 'Null';
      }
    }
    else return 'Date unavaible';
  }
}
