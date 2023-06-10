import 'package:pokemon/api/model/pokemon/pokemon_detail.dart';

import '../../api/model/pokemon/pokemon_list_details.dart';

abstract class PokemonListingEvent {}

class FetchPokemonListing extends PokemonListingEvent {
  final int limit;
  final int offset;

  FetchPokemonListing({required this.limit, required this.offset});

}

class SearchPokemonListing extends PokemonListingEvent {

  String searchQuery;
  SearchPokemonListing({ this.searchQuery = ""});

}

class MarkAsFavoritePokemon extends PokemonListingEvent{

  PokemonListDetail pokemonDetail;
  MarkAsFavoritePokemon({required this.pokemonDetail});


}


class FetchFavoritePokemon extends PokemonListingEvent{

  FetchFavoritePokemon();


}
