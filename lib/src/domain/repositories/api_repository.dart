import 'package:mobistory/src/data/datasource/remote/wikipedia_api_service.dart';

abstract class ApiRepository {
  Future<WikipediaResponse> getEventWikipediaContent(String title);
}