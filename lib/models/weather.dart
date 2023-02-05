class Weather {
  late String cityName;
  late int temperature;
  late int conditionCode;

  setWeatherValues(String cityName, int temperature, int conditionCode) {
    this.cityName = cityName;
    this.temperature = temperature;
    this.conditionCode = conditionCode;
  }
}
