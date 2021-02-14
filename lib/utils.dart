import 'dart:math';

class Utils {
  static Point centroid(List<Point> locations) {
    double x = 0;
    double y = 0;
    double z = 0;

    for (int i = 0; i < locations.length; i++) {
      x = x + cos(locations[i].x) * cos(locations[i].y);
      y = y + cos(locations[i].x) * sin(locations[i].y);
      z = z + sin(locations[i].x);
    }

    x = x / locations.length;
    y = y / locations.length;
    z = z / locations.length;

    double lng = atan2(y, x);
    double hyp = sqrt(x * x + y * y);
    double lat = atan2(z, hyp);

    return Point(lat, lng);
  }
}
