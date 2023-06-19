import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'wikipedia_api_service.g.dart';

@JsonSerializable()
class WikipediaResponse {
  bool batchComplete;
  WikipediaQuery query;

  WikipediaResponse({required this.batchComplete, required this.query});

  factory WikipediaResponse.fromJson(Map<String, dynamic> json) =>
      _$WikipediaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WikipediaResponseToJson(this);
}

@JsonSerializable()
class WikipediaQuery {
  List<WikipediaPage> pages;

  WikipediaQuery({required this.pages});

  factory WikipediaQuery.fromJson(Map<String, dynamic> json) =>
      _$WikipediaQueryFromJson(json);

  Map<String, dynamic> toJson() => _$WikipediaQueryToJson(this);
}

@JsonSerializable()
class WikipediaPage {
  int pageId;
  int ns;
  String title;
  String extract;

  WikipediaPage(
      {required this.pageId,
        required this.ns,
        required this.title,
        required this.extract});

  factory WikipediaPage.fromJson(Map<String, dynamic> json) =>
      _$WikipediaPageFromJson(json);

  Map<String, dynamic> toJson() => _$WikipediaPageToJson(this);
}

@RestApi(baseUrl: 'https://en.wikipedia.org')
abstract class WikipediaApiService {
  factory WikipediaApiService(Dio dio, {String baseUrl}) = _WikipediaApiService;

  @GET('/w/api.php?action=query&prop=extracts&format=json&exintro=1&explaintext=1&redirects=1')
  Future<WikipediaResponse> getEventWikipediaContent(@Query('titles') String titles);
}