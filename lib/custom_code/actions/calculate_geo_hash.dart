// Automatic FlutterFlow imports
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dart_geohash/dart_geohash.dart';

Future<String> calculateGeoHash(
  double lat,
  double lng,
) async {
  // calculate geohash from latitude and longitude
  GeoHasher geoHasher = GeoHasher();
  return geoHasher.encode(lat, lng);
}
