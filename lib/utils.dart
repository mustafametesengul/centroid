import 'dart:math';

Point centroid(List<Point> locations) {
  double x = 0;
  double y = 0;
  double z = 0;
  double lat, lng, hyp;

  for (int i = 0; i < locations.length; i++) {
    lat = locations[i].x * pi / 180;
    lng = locations[i].y * pi / 180;
    x = x + cos(lat) * cos(lng);
    y = y + cos(lat) * sin(lng);
    z = z + sin(lat);
  }

  x = x / locations.length;
  y = y / locations.length;
  z = z / locations.length;

  lng = atan2(y, x);
  hyp = sqrt(x * x + y * y);
  lat = atan2(z, hyp);

  lat = lat * 180 / pi;
  lng = lng * 180 / pi;

  return Point(lat, lng);
}
