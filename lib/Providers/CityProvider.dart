import 'package:flutter/foundation.dart';

class CityProvider extends ChangeNotifier {
  String _cityName = "Москва";
  String get cityName => _cityName;

  void updateTown(String newCityName) {
    _cityName = newCityName;
    notifyListeners();
  }
}
