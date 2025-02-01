import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  Set<String> _favoriteDoctorIds = {}; // Stores favorite doctor IDs

  Set<String> get favoriteDoctorIds => _favoriteDoctorIds;

  HomeProvider() {
    _loadFavorites();
  }

  // Function to load favorite doctor IDs from SharedPreferences
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favoriteIds =
        prefs.getStringList('favoriteDoctors') ?? [];
    _favoriteDoctorIds = Set.from(favoriteIds);
    notifyListeners();
  }

  // Function to toggle the favorite status of a doctor
  Future<void> toggleFavorite(String doctorId) async {
    final prefs = await SharedPreferences.getInstance();

    if (_favoriteDoctorIds.contains(doctorId)) {
      // If the doctor is already a favorite, remove it
      _favoriteDoctorIds.remove(doctorId);
    } else {
      // Otherwise, add the doctor to favorites
      _favoriteDoctorIds.add(doctorId);
    }

    // Save updated favorites to SharedPreferences
    await prefs.setStringList('favoriteDoctors', _favoriteDoctorIds.toList());
    notifyListeners(); // Notify the UI to rebuild
  }
}
