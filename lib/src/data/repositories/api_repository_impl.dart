import 'package:mobistory/src/data/datasource/remote/wikipedia_api_service.dart';
import 'package:mobistory/src/domain/repositories/api_repository.dart';

class ApiRepositoryImpl implements ApiRepository {
  final WikipediaApiService _wikipediaApiService;

  ApiRepositoryImpl(this._wikipediaApiService);

  @override
  Future<WikipediaResponse> getEventWikipediaContent(String title) async {
    return await _wikipediaApiService.getEventWikipediaContent(title);
  }
}