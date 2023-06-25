import 'package:dio/dio.dart';

abstract class Resource<T> {
  final T? data;
  final DioException? error;

  const Resource({this.data, this.error});
}

class Success<T> extends Resource<T> {
  const Success(T data) : super(data: data);
}

class Failed<T> extends Resource<T> {
  const Failed(DioException error) : super(error: error);
}

class Loading<T> extends Resource<T> {
  const Loading();
}