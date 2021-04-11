import 'package:intl/intl.dart';

class IssDateParse {
  String parse(dateParse) {
    String month = dateParse.toString().substring(5, 7);
    String day = dateParse.toString().substring(8, 11);

    String parsedDate =  DateFormat('EEEE').format(dateParse).toString();

    switch(month){
      case '01':
          parsedDate = parsedDate + ' $day, January';
          break;
       case '02':
          parsedDate = parsedDate + ' $day, February';
          break;
       case '03':
          parsedDate = parsedDate + ' $day, March';
          break;
       case '04':
          parsedDate = parsedDate + ' $day, April';
          break;
       case '05':
          parsedDate = parsedDate + ' $day, May';
          break;
       case '06':
          parsedDate = parsedDate + ' $day, June';
          break;
       case '07':
          parsedDate = parsedDate + ' $day, July';
          break;
       case '08':
          parsedDate = parsedDate + ' $day,August';
          break;
       case '09':
          parsedDate = parsedDate + ' $day, September';
          break;
       case '10':
          parsedDate = parsedDate + ' $day, October';
          break;
       case '11':
          parsedDate = parsedDate + ' $day, November';
          break;
       case '12':
          parsedDate = parsedDate + ' $day, December';
          break;
    }
    return parsedDate;
  }
}