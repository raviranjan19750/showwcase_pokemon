class PathParams {
  static const String id = ':id';
}

class EndPoint {
  static const String getPokemon = 'pokemon';
  static const String addPokemon = 'pokemon';
  static const String getPokemonById = 'pokemon/${PathParams.id}';
}
