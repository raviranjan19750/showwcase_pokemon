class ApiResponseModel {
  final bool success;
  final String message;
  final dynamic data;

  ApiResponseModel({this.success = true, this.message = '', this.data});
}
