
import 'package:geocoding/geocoding.dart';

Future<String> getCityName({required double latitude, required double longitude}) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    if (placemarks != null && placemarks.isNotEmpty) {
      Placemark placemark = placemarks[0];
      return placemark.locality??'ajkkckadnckjdnckjdnc';
    }
  } catch (e) {
    print('Error: $e');
  }

  return 'ajkkckadnckjdnckjdnc';
}