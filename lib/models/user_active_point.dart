import 'package:collection/collection.dart';

class UserActivePoint {
  final double x;
  final double y;

  UserActivePoint({
    required this.x,
    required this.y,
  });
}

List<UserActivePoint> get userActivePoints {
  final data = <double>[2, 5, 4, 8, 4, 14, 7];
  return data.mapIndexed(
      ((index, element) => UserActivePoint(x: index.toDouble(), y: element))
  ).toList();
}

List<UserActivePoint> data = [
  UserActivePoint(x: 0, y: 21),
  UserActivePoint(x: 1, y: 145),
  UserActivePoint(x: 2, y: 204),
  UserActivePoint(x: 3, y: 308),
  UserActivePoint(x: 4, y: 400),
  UserActivePoint(x: 5, y: 578),
  UserActivePoint(x: 6, y: 590),
  UserActivePoint(x: 7, y: 752),
];