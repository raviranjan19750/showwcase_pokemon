import 'package:dio/dio.dart';
import 'package:pokemon/api/api_enum.dart';


/// interceptors to intercept any error and handle it at once during api call/response.
///

class ApiInterceptors extends Interceptor {
  final Api api;

  ApiInterceptors({required this.api});

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    int code = err.response?.statusCode ?? 600;
    String message = err.response?.data?['message'] ??
        err.response?.statusMessage ??
        err.message;

    Response response = Response(requestOptions: err.requestOptions, data: {
      'status': code,
      'message': message,
    });

    if (err.type == DioErrorType.other) {
      response.data['message'] = 'No Internet Connection';
      handler.resolve(response);
    } else {
      handler.resolve(response);
    }
  }
}
