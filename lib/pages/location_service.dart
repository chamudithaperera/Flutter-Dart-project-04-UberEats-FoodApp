import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';

class LocationService extends ChangeNotifier {
  String _currentAddress = 'Getting location...';
  Position? _currentPosition;

  String get currentAddress => _currentAddress;
  Position? get currentPosition => _currentPosition;

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _currentAddress = 'Location services are disabled';
      notifyListeners();
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _currentAddress = 'Location permissions are denied';
        notifyListeners();
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _currentAddress = 'Location permissions are permanently denied';
      notifyListeners();
      return false;
    }

    return true;
  }

  Future<void> getCurrentLocation() async {
    try {
      final hasPermission = await handleLocationPermission();
      if (!hasPermission) return;

      _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      await getAddressFromLatLng();
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      _currentAddress = 'Error getting location';
      notifyListeners();
    }
  }

  Future<void> getAddressFromLatLng() async {
    try {
      if (_currentPosition == null) return;

      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      );

      Placemark place = placemarks[0];
      _currentAddress = '${place.subAdministrativeArea}, ${place.locality}';
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      _currentAddress = 'Error getting address';
      notifyListeners();
    }
  }
}