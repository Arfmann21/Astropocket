class TemperatureParsing {
  final int temp;

  bool isCelsius = false;

  TemperatureParsing({this.temp});

  String getParsedTemp() {
    return isCelsius ? ((temp - 32) / 1.8).round().toString() + '°C' : temp.round().toString() + '°F';
  }
}
