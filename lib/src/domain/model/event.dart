import 'package:floor/floor.dart';

@Entity(tableName: 'event')
class Event {
  @PrimaryKey()
  final int id;
  final String? labelEN;
  final String? labelFR;
  final String? aliasesEN;
  final String? aliasesFR;
  final String? descriptionEN;
  final String? descriptionFR;
  final String? wikipediaEN;
  final String? wikipediaFR;
  final int popularityEN;
  final int popularityFR;
  final int sourceId;
  final bool isFavorite;
  final DateTime startTime;
  final DateTime endTime;
  final DateTime pointInTime;
  final double? latitude;
  final double? longitude;
  final String? image;

  Event({
    required this.id,
    required this.labelEN,
    required this.labelFR,
    required this.aliasesEN,
    required this.aliasesFR,
    required this.descriptionEN,
    required this.descriptionFR,
    required this.wikipediaEN,
    required this.wikipediaFR,
    required this.popularityEN,
    required this.popularityFR,
    required this.sourceId,
    this.isFavorite = false,
    required this.startTime,
    required this.endTime,
    required this.pointInTime,
    required this.latitude,
    required this.longitude,
    required this.image,
  });

  copyWith({
    int? id,
    String? labelEN,
    String? labelFR,
    String? aliasesEN,
    String? aliasesFR,
    String? descriptionEN,
    String? descriptionFR,
    String? wikipediaEN,
    String? wikipediaFR,
    int? popularityEN,
    int? popularityFR,
    int? sourceId,
    bool? isFavorite,
    DateTime? startTime,
    DateTime? endTime,
    DateTime? pointInTime,
    double? latitude,
    double? longitude,
    String? image,
  }) {
    return Event(
      id: id ?? this.id,
      labelEN: labelEN ?? this.labelEN,
      labelFR: labelFR ?? this.labelFR,
      aliasesEN: aliasesEN ?? this.aliasesEN,
      aliasesFR: aliasesFR ?? this.aliasesFR,
      descriptionEN: descriptionEN ?? this.descriptionEN,
      descriptionFR: descriptionFR ?? this.descriptionFR,
      wikipediaEN: wikipediaEN ?? this.wikipediaEN,
      wikipediaFR: wikipediaFR ?? this.wikipediaFR,
      popularityEN: popularityEN ?? this.popularityEN,
      popularityFR: popularityFR ?? this.popularityFR,
      sourceId: sourceId ?? this.sourceId,
      isFavorite: isFavorite ?? this.isFavorite,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      pointInTime: pointInTime ?? this.pointInTime,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      image: image ?? this.image,
    );
  }

  static fromJson(jsonDecode) {
    final popularity = jsonDecode['popularity'] ?? {};
    final claims = jsonDecode['claims'] ?? [];
    String label = jsonDecode['label'] ?? "";
    String alias = jsonDecode['aliases'] ?? "";
    String description = jsonDecode['description'] ?? "";
    String wikipedia = jsonDecode['wikipedia'] ?? "";

    const imageId = 18;
    const coordinateId = 625;
    const startTimeId = 580;
    const endTimeId = 582;
    const pointInTimeId = 585;

    String? labelEN, labelFR;
    String? aliasesEN, aliasesFR;
    String? descriptionEN, descriptionFR;
    String? wikipediaEN, wikipediaFR;
    DateTime? startTime;
    DateTime? endTime;
    DateTime? pointInTime;
    double? latitude, longitude;
    String? image;

    if(label.isNotEmpty) {
      final labels = label.split("||");

      if(labels.length != 2) {
        return;
      }

      for (var it in labels) {
        switch (it.substring(0, 2)) {
          case "en":
            labelEN = it.substring(3);
            break;
          case "fr":
            labelFR = it.substring(3);
            break;
        }
      }
    }

    if(alias.isNotEmpty) {
      final aliases = alias.split("||");

      /*if(aliases.length != 2) {
        return;
      }*/

      for (var it in aliases) {
        switch (it.substring(0, 2)) {
          case "en":
            aliasesEN = it.substring(3);
            break;
          case "fr":
            aliasesFR = it.substring(3);
            break;
        }
      }
    }

    if(description.isNotEmpty) {
      final descriptions = description.split("||");

      /*if(descriptions.length != 2) {
        return;
      }*/

      for (var it in descriptions) {
        switch (it.substring(0, 2)) {
          case "en":
            descriptionEN = it.substring(3);
            break;
          case "fr":
            descriptionFR = it.substring(3);
            break;
        }
      }
    }

    if(wikipedia.isNotEmpty) {
      final wikipedias = wikipedia.split("||");

      if(wikipedias.length != 2) {
        return;
      }

      for (var it in wikipedias) {
        switch (it.substring(0, 2)) {
          case "en":
            wikipediaEN = it.substring(3);
            break;
          case "fr":
            wikipediaFR = it.substring(3);
            break;
        }
      }
    }


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
        case imageId:
          final imageName = claimValue.split(":")[1].replaceAll(' ', '%20');
          image = "https://commons.wikimedia.org/wiki/Special:FilePath/$imageName";
          break;
      }
    }

    return Event(
        id: jsonDecode['id'],
        labelEN: labelEN ?? "",
        labelFR: labelFR ?? "",
        aliasesEN: aliasesEN ?? "",
        aliasesFR: aliasesFR ?? "",
        descriptionEN: descriptionEN ?? "",
        descriptionFR: descriptionFR ?? "",
        wikipediaEN: wikipediaEN ?? "",
        wikipediaFR: wikipediaFR ?? "",
        popularityEN: popularity['en'] ?? 0,
        popularityFR: popularity['fr'] ?? 0,
        sourceId: jsonDecode['sourceId'],
        startTime: startTime ?? DateTime.parse("0001-01-01"), // because can't store null datetime in database
        endTime: endTime ?? DateTime.parse("0001-01-01"),
        pointInTime: pointInTime ?? DateTime.parse("0001-01-01"),
        latitude: latitude,
        longitude: longitude,
        image: image
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

  @override
  String toString() {
    return 'Event{id: $id, labelEN: $labelEN, labelFR: $labelFR, aliasesEN: $aliasesEN, aliasesFR: $aliasesFR, descriptionEN: $descriptionEN, descriptionFR: $descriptionFR, wikipediaEN: $wikipediaEN, wikipediaFR: $wikipediaFR, popularityEN: $popularityEN, popularityFR: $popularityFR, sourceId: $sourceId, isFavorite: $isFavorite, startTime: $startTime, endTime: $endTime, pointInTime: $pointInTime, latitude: $latitude, longitude: $longitude, image: $image}';
  }
}