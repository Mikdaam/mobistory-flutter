// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wikipedia_api_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WikipediaResponse _$WikipediaResponseFromJson(Map<String, dynamic> json) =>
    WikipediaResponse(
      batchComplete: json['batchcomplete'] as bool,
      query: WikipediaQuery.fromJson(json['query'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WikipediaResponseToJson(WikipediaResponse instance) =>
    <String, dynamic>{
      'batchcomplete': instance.batchComplete,
      'query': instance.query,
    };

WikipediaQuery _$WikipediaQueryFromJson(Map<String, dynamic> json) =>
    WikipediaQuery(
      pages: (json['pages'] as List<dynamic>)
          .map((e) => WikipediaPage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WikipediaQueryToJson(WikipediaQuery instance) =>
    <String, dynamic>{
      'pages': instance.pages,
    };

WikipediaPage _$WikipediaPageFromJson(Map<String, dynamic> json) =>
    WikipediaPage(
      pageId: json['pageid'] as int,
      ns: json['ns'] as int,
      title: json['title'] as String,
      extract: json['extract'] as String,
    );

Map<String, dynamic> _$WikipediaPageToJson(WikipediaPage instance) =>
    <String, dynamic>{
      'pageid': instance.pageId,
      'ns': instance.ns,
      'title': instance.title,
      'extract': instance.extract,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _WikipediaApiService implements WikipediaApiService {
  _WikipediaApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://en.wikipedia.org';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<WikipediaResponse>> getEventWikipediaContent(
      titles) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'titles': titles};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<WikipediaResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/w/api.php?action=query&format=json&prop=extracts&redirects=1&formatversion=2&exlimit=20&explaintext=1',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WikipediaResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
