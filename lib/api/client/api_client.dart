import 'package:dio/dio.dart';
import 'package:pokemon/api/model/api_response_model.dart';
import '../api_enum.dart';

class DioClient {
  late Dio _client;
  final Api api;
  DioClient({required this.api}) {
    _client = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 120).inMilliseconds,
      contentType: Headers.jsonContentType,
    ));
    _client.options.headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };
  }

  Future<ApiResponseModel> makePostRequest(
      {required Uri uri, required Map<String, dynamic> body}) async {
    try {
      final response = await _client.postUri(
        uri,
        data: body,
      );

      ApiResponseModel model = ApiResponseModel(data: response.data);

      return model;
    } on Exception catch (e) {
      return ApiResponseModel(success: false, message: e.toString());
    }
  }

  Future<ApiResponseModel> makeDeleteRequest({required Uri uri}) async {
    try {
      final response = await _client.deleteUri(
        uri,
      );

      ApiResponseModel model = ApiResponseModel(data: response.data);

      return model;
    } on Exception catch (e) {
      return ApiResponseModel(success: false, message: e.toString());
    }
  }

  Future<ApiResponseModel> makePutRequest(
      {required Uri uri, required Map<String, dynamic> body}) async {
    try {
      final response = await _client.putUri(uri, data: body);

      ApiResponseModel model = ApiResponseModel(data: response.data);

      return model;
    } on Exception catch (e) {
      return ApiResponseModel(success: false, message: e.toString());
    }
  }

  Future<ApiResponseModel> makeGetRequest({required Uri uri}) async {
    try {
      final response = await _client.getUri(
        uri,
      );

      ApiResponseModel model = ApiResponseModel(data: response.data);

      return model;
    } on Exception catch (e) {
      return ApiResponseModel(success: false, message: e.toString());
    }
  }
}
