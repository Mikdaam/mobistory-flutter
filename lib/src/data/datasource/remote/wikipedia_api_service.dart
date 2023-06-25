import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'wikipedia_api_service.g.dart';

@JsonSerializable()
class WikipediaResponse {
  @JsonKey(name: 'batchcomplete')
  bool batchComplete;

  @JsonKey(name: 'query')
  WikipediaQuery query;

  WikipediaResponse({required this.batchComplete, required this.query});

  factory WikipediaResponse.fromJson(Map<String, dynamic> json) =>
      _$WikipediaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WikipediaResponseToJson(this);
}

@JsonSerializable()
class WikipediaQuery {
  @JsonKey(name: 'pages')
  List<WikipediaPage> pages;

  WikipediaQuery({required this.pages});

  factory WikipediaQuery.fromJson(Map<String, dynamic> json) =>
      _$WikipediaQueryFromJson(json);

  Map<String, dynamic> toJson() => _$WikipediaQueryToJson(this);
}

@JsonSerializable()
class WikipediaPage {
  @JsonKey(name: 'pageid')
  int pageId;
  @JsonKey(name: 'ns')
  int ns;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'extract')
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

  @GET('/w/api.php?action=query&format=json&prop=extracts&redirects=1&formatversion=2&exlimit=20&explaintext=1')
  Future<HttpResponse<WikipediaResponse>> getEventWikipediaContent(@Query('titles') String titles);
}