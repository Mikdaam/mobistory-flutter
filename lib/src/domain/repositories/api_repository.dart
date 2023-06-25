import 'package:mobistory/src/data/datasource/remote/wikipedia_api_service.dart';
import 'package:mobistory/src/utils/resources/resource.dart';

abstract class ApiRepository {
  Future<Resource<WikipediaResponse>> getEventPageFromWikipedia(String title);
}