import 'global_variables.dart';

class TemperatureParsing {
  final int temp;

  TemperatureParsing({required this.temp});

  String getParsedTemp() {
    return isCelsius ? ((temp - 32) / 1.8).round().toString() + '°C' : temp.round().toString() + '°F';
  }
}
