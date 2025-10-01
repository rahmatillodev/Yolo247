import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark) {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isDarkMode = prefs.getBool('isDarkMode') ?? true;
      emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    } catch (e) {
      emit(ThemeMode.dark); // Default to dark mode
    }
  }

  Future<void> toggleTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final newMode = state == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
      await prefs.setBool('isDarkMode', newMode == ThemeMode.dark);
      emit(newMode);
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDarkMode', mode == ThemeMode.dark);
      emit(mode);
    } catch (e) {
      // Handle error silently
    }
  }
}
