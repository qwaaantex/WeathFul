import 'package:flutter/foundation.dart';

class NavigationProvider extends ChangeNotifier {
  int indexing = 0;

  void updatePage(int newIndex) {
    indexing = newIndex;
    notifyListeners();
  }
}
