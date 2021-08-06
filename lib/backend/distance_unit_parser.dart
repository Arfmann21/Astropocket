import 'global_variables.dart';

class DistanceUnitParsing {
  final double distance;

  DistanceUnitParsing({this.distance});

  String getParsedDistance() {
    return isKilometers ? (distance * 1.609344).toString() + "km" : distance.toString() + "mi";
  }
}
