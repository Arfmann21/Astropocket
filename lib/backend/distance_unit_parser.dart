import 'global_variables.dart';

class DistanceUnitParsing {
  final double distance;

  DistanceUnitParsing({required this.distance});

  String getParsedDistance() {
    return isKilometers ? (distance * 1.609344).toInt().toString() + "km" : distance.toInt().toString() + "mi";
  }
}