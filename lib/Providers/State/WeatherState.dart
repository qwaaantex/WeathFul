import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/weather.dart';

class WeatherService {
  late WeatherFactory _weatherFactory;

  Future<void> initialize() async {
    await dotenv.load(fileName: "key.env");

    final apiKey = dotenv.env['api-key'];

    _weatherFactory = WeatherFactory(apiKey!, language: Language.ENGLISH);
  }

  Future<Weather> fetchWeatherByCityName(String cityName) {
    try {
      return _weatherFactory.currentWeatherByCityName(cityName);
    } catch (e) {
      throw Exception('Ошибка: $e');
    }
  }
}
