class TripModel {
  final int id;
  final String date;
  final String pointFrom;
  final String pointTo;
  final String trackCode;
  final int summarySeats;
  final String ticketCode;
  final String location;
  final List<Point>? points;

  TripModel({
    required this.id,
    required this.date,
    required this.pointFrom,
    required this.pointTo,
    required this.trackCode,
    required this.summarySeats,
    required this.ticketCode,
    required this.location,
    this.points,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? pointsJson = json['points'];
    List<Point>? points;
    if (pointsJson != null) {
      points = pointsJson.map((pointJson) => Point.fromJson(pointJson)).toList();
    }
    return TripModel(
      id: json['id'] ?? 0,
      date: json['date'] ?? '',
      pointFrom: json['point_from'] ?? '',
      pointTo: json['point_to'] ?? '',
      trackCode: json['track_code'] ?? '',
      summarySeats: json['summary_seats'] ?? 0,
      ticketCode: json['ticket_code'] ?? '',
      location: json['location'] ?? '',
      points: points ?? [],
    );
  }
}

class Point {
  final String point;
  final int isCurrent;
  final String date;

  Point({
    required this.point,
    required this.isCurrent,
    required this.date,
  });

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      point: json['point'] ?? '',
      isCurrent: json['is_current'] ?? 0,
      date: json['date'] ?? '',
    );
  }
}
