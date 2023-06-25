import 'package:mobistory/src/data/datasource/remote/wikipedia_api_service.dart';
import 'package:mobistory/src/data/repositories/base_api_repository.dart';
import 'package:mobistory/src/domain/repositories/api_repository.dart';
import 'package:mobistory/src/utils/resources/resource.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final WikipediaApiService _wikipediaApiService;

  ApiRepositoryImpl(this._wikipediaApiService);

  @override
  Future<Resource<WikipediaResponse>> getEventPageFromWikipedia(String title) {
    return getStateOf<WikipediaResponse>(
        request: () => _wikipediaApiService.getEventWikipediaContent(title),
    );
  }
}