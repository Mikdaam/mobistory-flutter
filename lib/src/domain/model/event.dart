import 'package:floor/floor.dart';
import 'package:logger/logger.dart';

@Entity(tableName: 'event')
class Event {
  @PrimaryKey()
  final int id;
  final String? label;
  final String? aliases;
  final String? description;
  final String? wikipedia;
  final int popularityEN;
  final int popularityFR;
  final int sourceId;
  final bool isFavorite;
  final DateTime startTime;
  final DateTime endTime;
  final DateTime pointInTime;
  final double? latitude;
  final double? longitude;
  /*final String? image;*/

  Event({
    required this.id,
    required this.label,
    required this.aliases,
    required this.description,
    required this.wikipedia,
    required this.popularityEN,
    required this.popularityFR,
    required this.sourceId,
    this.isFavorite = false,
    required this.startTime,
    required this.endTime,
    required this.pointInTime,
    required this.latitude,
    required this.longitude,
    /*required this.image,*/
  });

  copyWith({
    int? id,
    String? label,
    String? aliases,
    String? description,
    String? wikipedia,
    int? popularityEN,
    int? popularityFR,
    int? sourceId,
    bool? isFavorite,
    DateTime? startTime,
    DateTime? endTime,
    DateTime? pointInTime,
    double? latitude,
    double? longitude,
  }) {
    return Event(
      id: id ?? this.id,
      label: label ?? this.label,
      aliases: aliases ?? this.aliases,
      description: description ?? this.description,
      wikipedia: wikipedia ?? this.wikipedia,
      popularityEN: popularityEN ?? this.popularityEN,
      popularityFR: popularityFR ?? this.popularityFR,
      sourceId: sourceId ?? this.sourceId,
      isFavorite: isFavorite ?? this.isFavorite,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      pointInTime: pointInTime ?? this.pointInTime,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  static fromJson(jsonDecode) {
    final popularity = jsonDecode['popularity'] ?? {};
    final claims = jsonDecode['claims'] ?? [];

    // const IMAGE_ID = 18;
    const coordinateId = 625;
    const startTimeId = 580;
    const endTimeId = 582;
    const pointInTimeId = 585;

    DateTime? startTime;
    DateTime? endTime;
    DateTime? pointInTime;
    double? latitude, longitude;

    for (final claim in claims) {
      final claimId = claim['id'] as int;
      final claimValue = claim['value'] as String;

      switch (claimId) {
        case startTimeId:
          final startTimeString = claimValue.split(":")[1];
          startTime = parseDateTime(startTimeString);
          break;
        case endTimeId:
          final endTimeString = claimValue.split(":")[1];
          endTime = parseDateTime(endTimeString);
          break;
        case pointInTimeId:
          final pointInTimeString = claimValue.split(":")[1];
          pointInTime = parseDateTime(pointInTimeString);
          break;
        case coordinateId:
          final coordinatesStrings = claimValue.split(":")[1].split(",");
          latitude = double.parse(coordinatesStrings[0]);
          longitude = double.parse(coordinatesStrings[1]);
          break;
      /*case IMAGE_ID:
                final formatterUrl = claim['formatterUrl'] as String;
                final imageName = claimValue.substring(8);
                image = formatterUrl.substring(0, formatterUrl.length - 2) + imageName;
                Log.i("claims", "Image : $image");
                break;*/
      }
    }

    return Event(
        id: jsonDecode['id'],
        label: jsonDecode['label'],
        aliases: jsonDecode['aliases'],
        description: jsonDecode['description'],
        wikipedia: jsonDecode['wikipedia'],
        popularityEN: popularity['en'] ?? 0,
        popularityFR: popularity['fr'] ?? 0,
        sourceId: jsonDecode['sourceId'],
        startTime: startTime ?? DateTime.parse("0001-01-01"), // because can't store null datetime in database
        endTime: endTime ?? DateTime.parse("0001-01-01"),
        pointInTime: pointInTime ?? DateTime.parse("0001-01-01"),
        latitude: latitude,
        longitude: longitude
    );
  }

  static DateTime parseDateTime(String dateTimeString) {
    final parts = dateTimeString.split('-');
    int shift = 0;
    int sign = 1;

    if(dateTimeString.startsWith('-')) {
      shift = 1;
      sign = -1;
    }

    final year = int.parse(parts[0 + shift]);
    final month = int.parse(parts[1 + shift]);
    final day = int.parse(parts[2 + shift]);

    /*if(dateTimeString.startsWith('-')) {
      var logger = Logger();
      logger.i("year: $year, month: $month, day: $day");
      logger.i("dateTime UTC: ${DateTime.utc(year * sign, month, day)}");
    }*/

    return DateTime.utc(year * sign, month, day);
  }
}