// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wikipedia_api_service.dart';

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
  Future<WikipediaResponse> getEventWikipediaContent(titles) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'titles': titles};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<WikipediaResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/w/api.php?action=query&prop=extracts&format=json&exintro=1&explaintext=1&redirects=1',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WikipediaResponse.fromJson(_result.data!);
    return value;
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
