import 'package:pokemon/api/api_enum.dart';
import 'package:pokemon/api/enpoints.dart';
import 'package:pokemon/api/model/pokemon/pokemon_list_details.dart';
import 'package:tuple/tuple.dart';
import '../model/pokemon/pokemon_detail.dart';
import '../model/query_model.dart';

mixin PokemonService {
  Future<Tuple2<List<PokemonListDetail>, int>> getPokemonList(
      {required int limit, required int offset}) async {
    final response = await Api.getPokemon.call(
        queryParameters: _QueryRequestModel(limit: limit, offset: offset));

    int totalItems = response.data['count'] ?? 0;

    List<PokemonListDetail> list = (response.data['results'] as List<dynamic>?)
            ?.map((e) => PokemonListDetail.fromJson(e))
            .toList() ??
        [];

    return Tuple2(list, totalItems);
  }

  Future<PokemonDetail> getPokemonById({required int id}) async {
    final response = await Api.getPokemonById
        .call(pathParams: {PathParams.id: id.toString()});

    PokemonDetail detail = PokemonDetail.fromJson(response.data);

    return detail;
  }
}

class _QueryRequestModel extends QueryParamModel {
  final int offset;
  final int limit;

  _QueryRequestModel({required this.limit, required this.offset});

  @override
  Map<String, String> get toJson => {
        'offset': offset.toString(),
        'limit': limit.toString(),
      };
}
