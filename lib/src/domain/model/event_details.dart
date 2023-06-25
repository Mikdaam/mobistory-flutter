import 'package:mobistory/src/domain/model/event.dart';

class EventDetails {
  final Event event;
  final String wikipediaContent;
  final List<String> images;

  EventDetails({
    required this.event,
    required this.wikipediaContent,
    required this.images,
  });
}
