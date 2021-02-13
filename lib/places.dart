import 'package:google_place/google_place.dart';

class Places {
  var googlePlace = GooglePlace("AIzaSyBT-cjrMLyKc-MYeLz1qNnb4KjQTIxj74s");

  Future<void> getLocations() async {
    var result = await googlePlace.search.getNearBySearch(
        Location(lat: 40.994910, lng: 28.872920), 200,
        type: "restaurant");

    print(result.results[1].name);
  }
}
