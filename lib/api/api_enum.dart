import 'package:pokemon/api/enpoints.dart';
import 'package:pokemon/api/model/query_model.dart';
import 'package:pokemon/utils/environment.dart';

import 'client/api_client.dart';
import 'model/api_request_model.dart';
import 'model/api_response_model.dart';

/// making api call on the basis of request type of api.

enum RequestType { post, get, put, delete }

enum Api { getPokemon, getPokemonById, addPokemon }

extension MakeCall on RequestType {
  Future<ApiResponseModel> call(
      {required Api api, required Uri uri, ApiRequestModel? apiRequestModel}) {
    Map<String, dynamic> body = apiRequestModel?.toJson ?? {};

    DioClient client = DioClient(api: api);

    switch (this) {
      case RequestType.post:
        return client.makePostRequest(uri: uri, body: body);
      case RequestType.get:
        return client.makeGetRequest(uri: uri);
      case RequestType.put:
        return client.makePutRequest(uri: uri, body: body);
      case RequestType.delete:
        return client.makeDeleteRequest(uri: uri);
    }
  }
}

extension ApiMapping on Api {
  String get endPoint {
    switch (this) {
      case Api.getPokemon:
        return EndPoint.getPokemon;
      case Api.getPokemonById:
        return EndPoint.getPokemonById;
      case Api.addPokemon:
        return EndPoint.addPokemon;
    }
  }

  RequestType get requestType {
    switch (this) {
      case Api.getPokemon:
      case Api.getPokemonById:
        return RequestType.get;
      default:
        return RequestType.post;
    }
  }

  Future<ApiResponseModel> call(
      {Map<String, String> pathParams = const {},
      ApiRequestModel? body,
      QueryParamModel? queryParameters}) async {
    Map<String, dynamic>? queryParams = queryParameters?.toJson;

    String temp = endPoint;

    for (String key in pathParams.keys) {
      temp = temp.replaceAll(key, pathParams[key] ?? '');
    }

    List<String> pathSegments = [];

    if (currentEnvironment.apiPath.isNotEmpty) {
      if (currentEnvironment.apiPath.contains('/')) {
        pathSegments.addAll(currentEnvironment.apiPath
            .split('/')
            .where((element) => element.isNotEmpty));
      } else {
        pathSegments.add(currentEnvironment.apiPath);
      }
    }

    if (temp.contains('/')) {
      pathSegments
          .addAll(temp.split('/').where((element) => element.isNotEmpty));
    } else {
      pathSegments.add(temp);
    }

    Uri uri = Uri(
      scheme: currentEnvironment.scheme,
      host: currentEnvironment.baseUrl,
      port: currentEnvironment.port,
      pathSegments: pathSegments,
      queryParameters: queryParams,
    );

    ApiResponseModel model =
        await requestType.call(api: this, uri: uri, apiRequestModel: body);

    return model;
  }
}
