import 'package:google_place/google_place.dart';
import 'dart:math';

class Places {
  GooglePlace googlePlace =
      GooglePlace("...");

  Future<NearBySearchResponse> getPlaces(Point location) async {
    NearBySearchResponse result = await googlePlace.search.getNearBySearch(
        Location(lat: location.x, lng: location.y), 200,
        type: "restaurant");
    return result;
  }
}
