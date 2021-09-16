import 'package:flutter/material.dart';

class SearchManager extends ChangeNotifier {
  void removeSearch(int index) {
    print('success');
    notifyListeners();
  }

  void addSearch() {
    notifyListeners();
  }
}
