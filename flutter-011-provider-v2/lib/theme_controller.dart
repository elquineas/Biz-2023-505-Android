
import 'package:flutter/material.dart';

class ThemeController with ChangeNotifier{
  late ThemeMode = _themeMode;
  ThemeMode get themeMode => _themeMode;

  Future<void> updateThemeMode(ThemeMode? newThemeMode){
    if(newThemeMode != null && _themeMode != newThemeMode){
      _themeMode = newThemeMode;
    }else{
      return;
    }
  }

  initSystemTheme();

}
