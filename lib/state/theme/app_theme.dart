import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = ChangeNotifierProvider.autoDispose((ref) {
  return ChangeThemeState();
});

class ChangeThemeState extends ChangeNotifier {
  bool darkMode = false;
  void toggleThemeMode() {
    darkMode = !darkMode;
    notifyListeners();
  }
}
